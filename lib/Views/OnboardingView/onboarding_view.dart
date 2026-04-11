import 'dart:math' as math;

import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Views/OnboardingView/widgets/final_screen.dart';
import 'package:chatface/Views/OnboardingView/widgets/loading_screen.dart';
import 'package:chatface/Views/OnboardingView/widgets/step1.dart';
import 'package:chatface/Views/OnboardingView/widgets/step2.dart';
import 'package:chatface/Views/OnboardingView/widgets/step3.dart';
import 'package:chatface/Views/OnboardingView/widgets/step4.dart';
import 'package:chatface/Views/OnboardingView/widgets/step5.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/shared/custom_button.dart';
import 'package:chatface/shared/policy_bottom_sheet.dart';
import 'package:chatface/theme/app_colors.dart';
import 'package:chatface/theme/app_paddings.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Steps: 0=Name, 1=Age, 2=Gender, 3=Safety, 4=Permissions, 5=Loading, 6=Final
const _kTotalUserSteps = 5;
const _kLoadingStep = 5;
const _kFinalStep = 6;

class OnboardingView extends HookConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final sharedGridScrollCtrl = useAnimationController(
      duration: const Duration(seconds: 16),
    );

    useEffect(() {
      sharedGridScrollCtrl.repeat();
      return null;
    }, [sharedGridScrollCtrl]);

    final currentStep = useState<int>(0);
    final hasHydratedFromProfile = useState<bool>(false);
    final hasResolvedInitialStep = useState<bool>(false);
    final isStepTransitioning = useState<bool>(false);
    final hasStartedCompletionFlow = useState<bool>(false);
    final hasReachedFinalStep = useState<bool>(false);

    final loadingProgress = useState<double>(0.0);

    // User data collected across steps
    final userName = useState<String>('');
    // Default age: Jan 1, 2000 (picker starts here, always valid)
    final userBirthDate = useState<DateTime?>(DateTime(2000, 1, 1));
    final userGender = useState<Gender?>(null);

    final profileAsync = ref.watch(userProfileProvider);
    final userProfile = profileAsync.asData?.value?.user;

    final authProvider = userProfile?.authProvider?.toLowerCase();
    final isSocialLogin = authProvider == 'google' || authProvider == 'apple';
    final existingName = userProfile?.fullName?.trim();
    final existingAge = userProfile?.age;

    Gender? parseGender(String? value) {
      switch (value) {
        case 'male':
          return Gender.male;
        case 'female':
          return Gender.female;
        case 'prefer_not_to_say':
        case 'preferNotToSay':
          return Gender.preferNotToSay;
        default:
          return null;
      }
    }

    final existingGender = parseGender(userProfile?.gender);
    final hasExistingName = isSocialLogin && (existingName?.isNotEmpty == true);
    final hasExistingAge =
        isSocialLogin && existingAge != null && existingAge > 0;
    final hasExistingGender = isSocialLogin && existingGender != null;

    bool shouldSkipStep(int step) {
      switch (step) {
        default:
          return false;
      }
    }

    int? findNextStep(int fromStep) {
      for (var i = fromStep + 1; i <= _kFinalStep; i++) {
        if (i >= _kLoadingStep || !shouldSkipStep(i)) {
          return i;
        }
      }
      return null;
    }

    int? findPrevStep(int fromStep) {
      for (var i = fromStep - 1; i >= 0; i--) {
        if (!shouldSkipStep(i)) return i;
      }
      return null;
    }

    Future<void> goToStep(int step, {bool animate = true}) async {
      if (hasStartedCompletionFlow.value && step < _kLoadingStep) {
        return;
      }

      if (hasReachedFinalStep.value && step < _kFinalStep) {
        return;
      }

      if (isStepTransitioning.value) {
        return;
      }

      isStepTransitioning.value = true;

      if (!pageController.hasClients) {
        currentStep.value = step;
        isStepTransitioning.value = false;
        return;
      }

      if (animate) {
        try {
          await pageController.animateToPage(
            step,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
          );
        } finally {
          isStepTransitioning.value = false;
        }
        return;
      }

      currentStep.value = step;
      pageController.jumpToPage(step);
      isStepTransitioning.value = false;
    }

    useEffect(() {
      if (hasHydratedFromProfile.value || userProfile == null) return null;

      final profileName = userProfile.fullName?.trim();
      if (profileName != null && profileName.isNotEmpty) {
        userName.value = profileName;
      }

      if (userProfile.age != null && userProfile.age! > 0) {
        final now = DateTime.now();
        userBirthDate.value = DateTime(now.year - userProfile.age!, 1, 1);
      }

      final parsedGender = parseGender(userProfile.gender);
      if (parsedGender != null) {
        userGender.value = parsedGender;
      }

      hasHydratedFromProfile.value = true;
      return null;
    }, [userProfile]);

    useEffect(() {
      if (hasResolvedInitialStep.value) return null;
      if (currentStep.value != 0) {
        hasResolvedInitialStep.value = true;
        return null;
      }
      if (profileAsync.isLoading) return null;

      final target = shouldSkipStep(0) ? (findNextStep(0) ?? _kLoadingStep) : 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!pageController.hasClients) return;
        if (currentStep.value != target) {
          pageController.jumpToPage(target);
        }
        hasResolvedInitialStep.value = true;
      });
      return null;
    }, [profileAsync, hasExistingName, hasExistingAge, hasExistingGender]);

    final isLoadingScreen = currentStep.value == _kLoadingStep;
    final isFinalScreen = currentStep.value == _kFinalStep;
    final isUserStep = currentStep.value < _kLoadingStep;
    final isSafetyStep = currentStep.value == 3;

    final visibleUserSteps = List.generate(
      _kTotalUserSteps,
      (i) => i,
    ).where((i) => !shouldSkipStep(i)).toList();
    final currentVisibleStepIndex = visibleUserSteps.indexOf(currentStep.value);
    final currentVisibleStepNumber = currentVisibleStepIndex >= 0
        ? currentVisibleStepIndex + 1
        : 1;
    final totalVisibleUserSteps = visibleUserSteps.length;

    // Validation per step
    bool isStepValid() {
      switch (currentStep.value) {
        case 0:
          return userName.value.trim().isNotEmpty;
        case 1:
          return true; // age picker always has a default value
        case 2:
          return userGender.value != null;
        case 3:
          return true; // info screen
        case 4:
          return true; // permissions always continuable
        default:
          return true;
      }
    }

    void nextPage() {
      final nextStep = findNextStep(currentStep.value);
      if (nextStep != null) {
        final shouldAnimate = nextStep < _kLoadingStep;
        goToStep(nextStep, animate: shouldAnimate);
      }
    }

    void prevPage() {
      if (!isUserStep) return;
      final prevStep = findPrevStep(currentStep.value);
      if (prevStep != null) {
        goToStep(prevStep);
      }
    }

    void skipToEnd() {
      if (!isUserStep) return;

      goToStep(_kLoadingStep);
    }

    void handleOnPressed() {
      if (isFinalScreen) {
        Navigator.of(context).pushReplacementNamed('/main');
        return;
      }
      if (isLoadingScreen) return;
      if (!isStepValid()) return;
      nextPage();
    }

    final shouldShowTopBar = isUserStep;
    final isStepActionDisabled = isUserStep && !isStepValid();

    final horizontalPadding = AppPaddings.horizontalPage;
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    const buttonHeight = 56.0;
    const buttonShadowOffset = 5.0;
    const buttonVerticalMargin = AppSpacing.xl;
    const communityRulesExtraInset = 28.0;
    final bottomInsetForContent =
        bottomSafe +
        buttonHeight +
        buttonShadowOffset +
        buttonVerticalMargin +
        (isSafetyStep ? communityRulesExtraInset : 0);

    // Step label for button
    String buttonLabel() {
      if (isFinalScreen) return context.t.get_started;
      if (isLoadingScreen) return context.t.get_started;
      if (currentStep.value == 4) return context.t.onboarding.allowAccess;
      if (currentStep.value == 3) return context.t.onboarding.iUnderstand;
      return context.t.kContinue;
    }

    final hideTopBar = isLoadingScreen || isFinalScreen;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BlurredGradientBackground(),

          Padding(
            padding: hideTopBar ? EdgeInsets.zero : horizontalPadding,
            child: Column(
              children: [
                // Top bar
                if (!hideTopBar)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: shouldShowTopBar ? 1.0 : 0.0,
                    child: IgnorePointer(
                      ignoring: !shouldShowTopBar,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: AppSpacing.md,
                            bottom: AppSpacing.lg,
                          ),
                          child: _TopBar(
                            currentStep: currentVisibleStepNumber - 1,
                            totalSteps: totalVisibleUserSteps,
                            onBack: findPrevStep(currentStep.value) != null
                                ? prevPage
                                : null,
                            onSkip: skipToEnd,
                          ),
                        ),
                      ),
                    ),
                  ),

                // Page content
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      if (index >= _kLoadingStep) {
                        hasStartedCompletionFlow.value = true;
                      }

                      if (hasStartedCompletionFlow.value &&
                          index < _kLoadingStep) {
                        final target = hasReachedFinalStep.value
                            ? _kFinalStep
                            : _kLoadingStep;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (!pageController.hasClients) return;
                          pageController.jumpToPage(target);
                        });
                        return;
                      }

                      if (index == _kFinalStep) {
                        hasReachedFinalStep.value = true;
                      }

                      if (hasReachedFinalStep.value && index < _kFinalStep) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (!pageController.hasClients) return;
                          pageController.jumpToPage(_kFinalStep);
                        });
                        return;
                      }

                      if (currentStep.value != index) {
                        currentStep.value = index;
                      }
                    },
                    children: [
                      // Step 1: Name
                      Step1(
                        bottomPadding: bottomInsetForContent,
                        onNameChanged: (v) => userName.value = v,
                        initialName: userName.value,
                      ),

                      // Step 2: Age
                      Step2(
                        bottomPadding: bottomInsetForContent,
                        onDateChanged: (d) => userBirthDate.value = d,
                        initialDate: userBirthDate.value,
                      ),

                      // Step 3: Gender
                      Step3(
                        bottomPadding: bottomInsetForContent,
                        onGenderChanged: (g) => userGender.value = g,
                        initialGender: userGender.value,
                      ),

                      // Step 4: Safety
                      Step4(bottomPadding: bottomInsetForContent),

                      // Step 5: Permissions
                      Step5(bottomPadding: bottomInsetForContent),

                      // Loading
                      LoadingScreen(
                        isActive: isLoadingScreen,
                        onComplete: () {
                          hasStartedCompletionFlow.value = true;
                          hasReachedFinalStep.value = true;
                          goToStep(_kFinalStep, animate: false);
                        },
                        onProgressChanged: (progress) {
                          loadingProgress.value = progress;
                        },
                        photoGridAnimation: sharedGridScrollCtrl,
                        onboardingData: {
                          'name': userName.value,
                          'birthDate': userBirthDate.value?.toIso8601String(),
                          'gender': userGender.value?.name,
                        },
                      ),

                      // Final
                      FinalScreen(photoGridAnimation: sharedGridScrollCtrl),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Pinned bottom button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppSpacing.xl,
                  right: AppSpacing.xl,
                  bottom: AppSpacing.xl,
                ),
                child: isLoadingScreen
                    ? _LoadingProgressBar(progress: loadingProgress.value)
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IgnorePointer(
                            ignoring: isStepActionDisabled,
                            child: CustomButton(
                              label: buttonLabel(),
                              size: CustomButtonSize.large,
                              fullWidth: true,
                              borderRadius: 50,
                              labelStyle: AppTextStyles.body(
                                16,
                                weight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: -0.05,
                              ),
                              backgroundColor: AppColors.secondary,

                              onPressed: handleOnPressed,
                            ),
                          ),
                          if (isSafetyStep) ...[
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () =>
                                  showPolicySheet(context, PolicyType.terms),
                              child: Text(
                                context.t.onboarding.step4.communityRules,
                                style:
                                    AppTextStyles.body(
                                      13,
                                      color: Colors.white.withValues(
                                        alpha: 0.7,
                                      ),
                                      weight: FontWeight.w500,
                                    ).copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingProgressBar extends StatelessWidget {
  const _LoadingProgressBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).round();

    return SizedBox(
      height: 52,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final filledWidth = math.max(52.0, constraints.maxWidth * progress);

          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeOut,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: filledWidth,
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      '$percent%',
                      style: AppTextStyles.body(
                        14,
                        weight: FontWeight.w600,
                        color: progress > 0.85
                            ? Colors.black.withValues(alpha: 0.6)
                            : Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.currentStep,
    required this.totalSteps,
    this.onBack,
    this.onSkip,
  });

  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBack;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (onBack != null && currentStep > 0)
              GestureDetector(
                onTap: onBack,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      t.back,
                      style: AppTextStyles.body(
                        14,
                        weight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            else
              const SizedBox(width: 60),
            Text(
              '${currentStep + 1} / $totalSteps',
              style: AppTextStyles.body(
                13,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
            GestureDetector(
              onTap: onSkip,
              child: Text(
                t.skip,
                style: AppTextStyles.body(
                  14,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Progress indicator
        Row(
          children: List.generate(totalSteps, (i) {
            final isActive = i <= currentStep;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: i < totalSteps - 1 ? 4 : 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 3,
                  decoration: BoxDecoration(
                    color: isActive
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.22),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
