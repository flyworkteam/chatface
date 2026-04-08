import 'dart:async';

import 'package:chatface/Repositories/user_repository.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Views/OnboardingView/widgets/shared_photo_grid.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/custom_button.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class LoadingScreen extends HookConsumerWidget {
  final bool isActive;
  final VoidCallback onComplete;
  final void Function(double progress)? onProgressChanged;
  final Map<String, dynamic> onboardingData;

  const LoadingScreen({
    super.key,
    required this.isActive,
    required this.onComplete,
    required this.onboardingData,
    this.onProgressChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = useState<double>(0.0);
    final hasError = useState<String?>(null);
    final retryToken = useState<int>(0);
    final hasEverBeenActive = useRef(false);
    if (isActive) hasEverBeenActive.value = true;
    final effectiveActive = hasEverBeenActive.value;

    useEffect(() {
      if (!effectiveActive) return null;

      Print.info('🟢 LoadingScreen MOUNTED');
      var disposed = false;
      final userRepository = ref.read(userRepositoryProvider);
      final userNotifier = ref.read(userProfileProvider.notifier);

      void notifyProgress(double value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (disposed) return;
          onProgressChanged?.call(value);
        });
      }

      progress.value = 0.0;
      notifyProgress(0.0);
      hasError.value = null;

      Future<void>(() async {
        try {
          await _submitOnboardingFlow(
            userRepository: userRepository,
            userNotifier: userNotifier,
            onboardingData: onboardingData,
            updateProgress: (value) {
              if (disposed) return;
              progress.value = value;
              notifyProgress(value);
            },
            isDisposed: () => disposed,
          );
          if (!disposed) {
            await Future.delayed(const Duration(milliseconds: 400));
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (disposed) return;
              onComplete();
            });
          }
        } catch (error, stack) {
          Print.error('Onboarding loading error: $error');
          Print.error(stack.toString());
          if (!disposed) {
            hasError.value = error.toString();
          }
        }
      });

      return () {
        disposed = true;
        Print.info('🔴 LoadingScreen DISPOSED');
      };
    }, [effectiveActive, retryToken.value]);

    final t = context.t;
    final size = MediaQuery.of(context).size;
    final gridHeight = size.height * 0.65;

    return Column(
      children: [
        // ── Fotoğraf grid'i ──────────────────────────────────────────────
        Expanded(flex: 4, child: OnboardingPhotoGrid(gridHeight: gridHeight)),

        // ── Metin + progress bar ─────────────────────────────────────────
        Expanded(
          flex: 1,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: t.onboarding.loading.titlePart1,
                              style: AppTextStyles.heading(
                                26,
                                FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: t.onboarding.loading.titlePart2,
                              style: AppTextStyles.heading(
                                26,
                                FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        t.onboarding.loading.subtitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body(
                          14,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (hasError.value != null) ...[
                        Text(
                          'Something went wrong. Please try again.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body(
                            14,
                            color: Colors.redAccent,
                            weight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        CustomButton(
                          label: t.common.retry,
                          size: CustomButtonSize.medium,
                          fullWidth: false,
                          onPressed: () => retryToken.value++,
                          backgroundColor: Colors.redAccent,
                          borderRadius: 30,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }

  Future<void> _submitOnboardingFlow({
    required UserRepository userRepository,
    required UserNotifier userNotifier,
    required Map<String, dynamic> onboardingData,
    required void Function(double value) updateProgress,
    required bool Function() isDisposed,
  }) async {
    if (isDisposed()) return;
    updateProgress(0.1);
    await Future.delayed(const Duration(milliseconds: 250));

    if (isDisposed()) return;
    updateProgress(0.2);
    await _savePreferences(userRepository, onboardingData);

    if (isDisposed()) return;
    updateProgress(0.6);

    await _saveOneSignalId(userRepository);

    if (isDisposed()) return;
    updateProgress(0.85);

    await _refreshProfileUntilPersisted(
      userNotifier: userNotifier,
      onboardingData: onboardingData,
    );

    if (isDisposed()) return;
    updateProgress(1.0);
  }

  Future<void> _refreshProfileUntilPersisted({
    required UserNotifier userNotifier,
    required Map<String, dynamic> onboardingData,
  }) async {
    final expectedName = (onboardingData['name'] as String?)?.trim();
    final expectedGender = _normalizeGender(
      onboardingData['gender'] as String?,
    );

    for (var attempt = 1; attempt <= 3; attempt++) {
      final profileData = await userNotifier.refresh();
      final user = profileData?.user;
      final actualName = user?.fullName?.trim();
      final actualGender = _normalizeGender(user?.gender);
      final onboardingCompleted = user?.onboardingCompleted == true;

      final nameMatches =
          expectedName == null ||
          expectedName.isEmpty ||
          actualName == expectedName;

      final genderMatches =
          expectedGender == null || actualGender == expectedGender;

      if (user != null && onboardingCompleted && nameMatches && genderMatches) {
        return;
      }

      if (attempt < 3) {
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }

    throw StateError(
      'Onboarding data was not persisted correctly after savePreferences.',
    );
  }

  Future<void> _savePreferences(
    UserRepository repo,
    Map<String, dynamic> onboardingData,
  ) async {
    final locale = LocaleSettings.currentLocale;

    final Map<String, dynamic> payload =
        {
          'preferred_language': locale.languageCode,
          'full_name': (onboardingData['name'] as String?)?.trim(),
          'gender': _normalizeGender(onboardingData['gender'] as String?),
          'age': _calculateAge(onboardingData['birthDate'] as String?),
        }..removeWhere(
          (key, value) => value == null || (value is String && value.isEmpty),
        );

    if (payload.isEmpty) return;

    final saved = await repo.savePreferences(
      preferredLanguage: payload['preferred_language'] as String?,
      fullName: payload['full_name'] as String?,
      age: payload['age'] as int?,
      gender: payload['gender'] as String?,
    );

    if (!saved) {
      throw StateError('savePreferences returned success=false');
    }
  }

  Future<void> _saveOneSignalId(UserRepository repo) async {
    final playerId = OneSignal.User.pushSubscription.id;
    if (playerId == null || playerId.isEmpty) return;
    final saved = await repo.saveOneSignalPlayerId(playerId: playerId);
    if (!saved) {
      Print.error('saveOneSignalPlayerId returned success=false');
    }
  }

  static int? _calculateAge(String? birthDateIso) {
    if (birthDateIso == null || birthDateIso.isEmpty) return null;
    final birthDate = DateTime.tryParse(birthDateIso);
    if (birthDate == null) return null;
    final now = DateTime.now();
    var age = now.year - birthDate.year;
    if (DateTime(now.year, birthDate.month, birthDate.day).isAfter(now)) {
      age -= 1;
    }
    return age;
  }

  static String? _normalizeGender(String? gender) {
    switch (gender) {
      case 'male':
        return 'male';
      case 'female':
        return 'female';
      case 'preferNotToSay':
        return 'prefer_not_to_say';
      default:
        return null;
    }
  }
}
