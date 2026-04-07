import 'dart:io';

import 'package:chatface/Models/user_model.dart';
import 'package:chatface/Riverpod/Providers/call_session_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/Views/EditProfileView/widgets/photo_picker.dart';
import 'package:chatface/Views/EditProfileView/widgets/profile_text_field.dart';
import 'package:chatface/Views/EditProfileView/widgets/select_country.dart';
import 'package:chatface/Views/EditProfileView/widgets/select_gender.dart';
import 'package:chatface/Views/EditProfileView/widgets/select_learn_language.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/shared/custom_button.dart';
import 'package:chatface/shared/toast.dart';
import 'package:chatface/theme/app_paddings.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/user_profile_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileView extends HookConsumerWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    final userAsync = ref.watch(userProfileProvider);
    final userNotifier = ref.read(userProfileProvider.notifier);

    final user = userAsync.value?.user;

    final nameController = useTextEditingController(text: user?.fullName ?? '');
    final aboutMeController = useTextEditingController(
      text: user?.aboutMe ?? '',
    );
    final selectedLanguage = useState(user?.preferredLanguage ?? 'en');
    final selectedCountry = useState(user?.country ?? 'TR');
    final selectedGender = useState(user?.gender ?? 'male');
    final uploadedPhotoUrls = useState<List<String>>(<String>[]);
    final removedPhotoUrls = useState<List<String>>(<String>[]);
    final uploadingPhoto = useState<File?>(null);
    final isPhotoUploading = useState(false);
    final showSuccess = useState(false);
    final isLoading = useState(false);
    final successToastKey = useMemoized(GlobalKey.new);
    final imagePicker = useMemoized(ImagePicker.new);

    void syncUploadedPhotosFromUser(UserProfile? currentUser) {
      if (currentUser == null) return;

      final resolvedUrls = currentUser.profilePictureUrls
          .map(resolveUserProfileImageUrl)
          .whereType<String>()
          .where((url) => !removedPhotoUrls.value.contains(url))
          .toList(growable: false);

      if (resolvedUrls.isEmpty) return;

      uploadedPhotoUrls.value = resolvedUrls;
    }

    // Update local state when user data loads from backend
    useEffect(
      () {
        if (user?.fullName != null && nameController.text != user!.fullName) {
          nameController.text = user.fullName!;
        }
        if (user?.preferredLanguage != null) {
          selectedLanguage.value = user!.preferredLanguage;
        }
        if (user?.aboutMe != null && aboutMeController.text != user!.aboutMe) {
          aboutMeController.text = user.aboutMe!;
        }
        if (user?.country != null && user!.country!.trim().isNotEmpty) {
          selectedCountry.value = user.country!;
        }
        if (user?.gender != null && user!.gender!.trim().isNotEmpty) {
          selectedGender.value = user.gender!;
        }
        syncUploadedPhotosFromUser(user);
        return null;
      },
      [
        user?.fullName,
        user?.age,
        user?.aboutMe,
        user?.country,
        user?.gender,
        user?.preferredLanguage,
        user?.updatedAt,
      ],
    );

    useEffect(() {
      if (!showSuccess.value) return null;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final toastContext = successToastKey.currentContext;
        if (toastContext == null) return;

        Scrollable.ensureVisible(
          toastContext,
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOut,
          alignment: 0.9,
        );
      });

      return null;
    }, [showSuccess.value]);

    Future<void> showPermissionDialog(ImageSource source) async {
      final sourceLabel = source == ImageSource.camera ? 'kamera' : 'galeri';

      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF1B1B22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Izin Gerekli',
              style: AppTextStyles.body(14, color: Colors.white),
            ),
            content: Text(
              '$sourceLabel izni olmadan resim secemezsin. Ayarlardan izin verebilirsin.',
              style: AppTextStyles.body(
                14,
                color: Colors.white.withValues(alpha: 0.78),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings();
                },
                child: Text(context.t.settings),
              ),
            ],
          );
        },
      );
    }

    Future<bool> requestPickerPermission(ImageSource source) async {
      Permission permission;
      if (source == ImageSource.camera) {
        permission = Permission.camera;
      } else if (Platform.isIOS) {
        permission = Permission.photos;
      } else {
        permission = Permission.photos;
      }

      var status = await permission.status;
      if (!status.isGranted && !status.isLimited) {
        status = await permission.request();
      }

      if (status.isGranted || status.isLimited) {
        return true;
      }

      if (source == ImageSource.gallery && Platform.isAndroid) {
        final legacyStorageStatus = await Permission.storage.request();
        if (legacyStorageStatus.isGranted) {
          return true;
        }
        if (legacyStorageStatus.isPermanentlyDenied && context.mounted) {
          await showPermissionDialog(source);
        }
        return false;
      }

      if (status.isPermanentlyDenied && context.mounted) {
        await showPermissionDialog(source);
      }

      return false;
    }

    Future<void> pickPhotoFrom(ImageSource source, {int? replaceIndex}) async {
      final isReplace = replaceIndex != null;
      if (!isReplace &&
          (uploadedPhotoUrls.value.length >= 2 || isPhotoUploading.value)) {
        return;
      }

      final granted = await requestPickerPermission(source);
      if (!granted) return;

      final file = await imagePicker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1600,
      );

      if (file == null) return;

      final localFile = File(file.path);
      uploadingPhoto.value = localFile;
      isPhotoUploading.value = true;

      final url = await userNotifier.uploadPhoto([localFile]);
      isPhotoUploading.value = false;
      uploadingPhoto.value = null;

      syncUploadedPhotosFromUser(
        ref.read(userProfileProvider).asData?.value?.user,
      );

      if (url == null || url.isEmpty) return;

      if (isReplace) {
        final idx = replaceIndex;
        if (idx < 0 || idx >= uploadedPhotoUrls.value.length) return;

        final next = [...uploadedPhotoUrls.value];
        next[idx] = url;
        uploadedPhotoUrls.value = next;
        return;
      }

      if (!uploadedPhotoUrls.value.contains(url)) {
        uploadedPhotoUrls.value = [...uploadedPhotoUrls.value, url];
      }
    }

    Future<void> pickPhoto({int? replaceIndex}) async {
      await showModalBottomSheet<void>(
        context: context,
        backgroundColor: const Color(0xFF1A1A21),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                      color: Colors.white,
                    ),
                    title: Text(
                      context.t.chat.gallery,
                      style: AppTextStyles.body(14, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      pickPhotoFrom(
                        ImageSource.gallery,
                        replaceIndex: replaceIndex,
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                    ),
                    title: Text(
                      context.t.chat.camera,
                      style: AppTextStyles.body(14, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      pickPhotoFrom(
                        ImageSource.camera,
                        replaceIndex: replaceIndex,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    Future<void> save() async {
      FocusScope.of(context).unfocus();
      isLoading.value = true;
      final success = await userNotifier.updateProfile(
        fullName: nameController.text.trim(),
        profilePictureUrls: uploadedPhotoUrls.value.isNotEmpty
            ? uploadedPhotoUrls.value
            : null,
        preferredLanguage: selectedLanguage.value,
        aboutMe: aboutMeController.text.trim(),
        gender: selectedGender.value,
        country: selectedCountry.value,
      );
      isLoading.value = false;

      if (success) {
        LocaleSettings.setLocale(
          AppLocale.values.byName(selectedLanguage.value),
        );
        await SecureStorageService().saveLanguage(selectedLanguage.value);
        await ref
            .read(personaFilterProvider.notifier)
            .setLanguage(selectedLanguage.value);
        if (ref.read(callSessionControllerProvider) != null) {
          await ref
              .read(callSessionControllerProvider.notifier)
              .changeLanguage(selectedLanguage.value);
        }
        showSuccess.value = true;
        Future.delayed(const Duration(seconds: 3), () {
          if (context.mounted) showSuccess.value = false;
        });
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          const BlurredGradientBackground(),
          Column(
            children: [
              const SizedBox(height: kToolbarHeight + AppSpacing.sm),
              Row(
                children: [
                  const SizedBox(width: AppSpacing.xl),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      AppIcons.backarrow,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    t.profileEdit,
                    style: AppTextStyles.heading(
                      18,
                      FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.lg),
              PhotoPicker(
                imageUrls: uploadedPhotoUrls.value,
                uploadingImage: uploadingPhoto.value,
                isUploading: isPhotoUploading.value,
                onAdd: () => pickPhoto(),
                onEditAt: (index) => pickPhoto(replaceIndex: index),
                onRemoveAt: (index) {
                  if (index < 0 || index >= uploadedPhotoUrls.value.length) {
                    return;
                  }
                  final removedUrl = uploadedPhotoUrls.value[index];
                  final next = [...uploadedPhotoUrls.value]..removeAt(index);
                  uploadedPhotoUrls.value = next;
                  if (!removedPhotoUrls.value.contains(removedUrl)) {
                    removedPhotoUrls.value = [
                      ...removedPhotoUrls.value,
                      removedUrl,
                    ];
                  }
                },
              ),
              const SizedBox(height: AppSpacing.lg),

              // Form fields
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xl,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileTextField(
                          label: t.editProfile.aboutMe,
                          hint: t.editProfile.aboutMeHint,
                          controller: aboutMeController,
                          maxLength: 60,
                        ),
                        const SizedBox(height: AppSpacing.md),

                        // Full Name
                        ProfileTextField(
                          label: t.editProfile.fullName,
                          hint: t.editProfile.fullName,
                          controller: nameController,
                          maxLength: 25,
                        ),
                        const SizedBox(height: AppSpacing.md),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.editProfile.gender,
                                    style: AppTextStyles.body(
                                      12,
                                      weight: FontWeight.w700,
                                      letterSpacing: -0.05,
                                      color: Colors.white.withValues(
                                        alpha: 0.92,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SelectGender(
                                    selectedCode: selectedGender.value,
                                    onChanged: (code) =>
                                        selectedGender.value = code,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.editProfile.country,
                                    style: AppTextStyles.body(
                                      12,
                                      weight: FontWeight.w700,
                                      letterSpacing: -0.05,
                                      color: Colors.white.withValues(
                                        alpha: 0.92,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SelectCountry(
                                    selectedCountry: selectedCountry.value,
                                    onChanged: (code) =>
                                        selectedCountry.value = code,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: AppSpacing.md),

                        // Select Learn Language
                        Text(
                          context.t.editProfile.selectLanguage,
                          style: AppTextStyles.body(
                            12,
                            weight: FontWeight.w700,
                            letterSpacing: -0.05,
                            color: Colors.white.withValues(alpha: 0.92),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SelectLearnLanguage(
                          selectedCode: selectedLanguage.value,
                          onChanged: (code) => selectedLanguage.value = code,
                        ),

                        // Success toast
                        if (showSuccess.value) ...[
                          const SizedBox(height: AppSpacing.lg),
                          Container(
                            key: successToastKey,
                            child: Toast(
                              title: t.editProfile.saved,
                              message: t.editProfile.changesSaved,
                              onDismiss: () => showSuccess.value = false,
                              icon: AppIcons.saved,
                              backgroundColor: Colors.black.withValues(
                                alpha: 0.68,
                              ),
                              titleColor: Colors.white,
                              messageColor: Colors.white.withValues(
                                alpha: 0.78,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

              // Save button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: CustomButton(
                  label: context.t.save,
                  size: CustomButtonSize.large,
                  fullWidth: true,
                  borderRadius: 50,
                  labelStyle: AppTextStyles.body(
                    24,
                    weight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -0.05,
                  ),
                  icon: SvgPicture.asset(AppIcons.save),
                  backgroundColor: Color(0xffFFFFFF).withValues(alpha: 0.4),

                  onPressed: (isLoading.value || isPhotoUploading.value)
                      ? null
                      : save,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              SafeArea(
                top: false,
                child: const SizedBox(height: AppSpacing.sm),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
