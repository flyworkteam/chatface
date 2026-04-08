import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

class Step5 extends HookWidget {
  const Step5({super.key, this.bottomPadding = 0});

  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final cameraGranted = useState<bool>(false);
    final micGranted = useState<bool>(false);
    final locationGranted = useState<bool>(false);
    final cameraLoading = useState<bool>(false);
    final micLoading = useState<bool>(false);
    final locationLoading = useState<bool>(false);

    // Check current status on mount
    useEffect(() {
      Future<void> checkStatuses() async {
        final camera = await Permission.camera.status;
        final mic = await Permission.microphone.status;
        final location = await Permission.locationWhenInUse.status;
        cameraGranted.value = camera.isGranted;
        micGranted.value = mic.isGranted;
        locationGranted.value = location.isGranted;
      }

      checkStatuses();
      return null;
    }, []);

    Future<bool> askToOpenSettings() async {
      final shouldOpen = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(t.onboarding.step5.permissionRequired),
            content: const Text(
              'This permission is blocked. Open app settings to enable it?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: Text(t.onboarding.step5.notNow),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: Text(t.onboarding.step5.openSettings),
              ),
            ],
          );
        },
      );

      return shouldOpen ?? false;
    }

    Future<void> requestPermission({
      required Permission permission,
      required ValueNotifier<bool> granted,
      required ValueNotifier<bool> loading,
    }) async {
      if (loading.value) return;
      loading.value = true;
      try {
        var status = await permission.status;

        if (status.isGranted) {
          granted.value = true;
          return;
        }

        if (status.isPermanentlyDenied || status.isRestricted) {
          final shouldOpen = await askToOpenSettings();
          if (shouldOpen) {
            await openAppSettings();
            status = await permission.status;
            granted.value = status.isGranted;
          }
          return;
        }

        status = await permission.request();
        granted.value = status.isGranted;

        if (!status.isGranted &&
            (status.isPermanentlyDenied || status.isRestricted)) {
          final shouldOpen = await askToOpenSettings();
          if (shouldOpen) {
            await openAppSettings();
            final updated = await permission.status;
            granted.value = updated.isGranted;
          }
        }
      } finally {
        loading.value = false;
      }
    }

    Future<void> requestCamera() async {
      await requestPermission(
        permission: Permission.camera,
        granted: cameraGranted,
        loading: cameraLoading,
      );
    }

    Future<void> requestMic() async {
      await requestPermission(
        permission: Permission.microphone,
        granted: micGranted,
        loading: micLoading,
      );
    }

    Future<void> requestLocation() async {
      await requestPermission(
        permission: Permission.locationWhenInUse,
        granted: locationGranted,
        loading: locationLoading,
      );
    }

    final permissions = [
      (
        'assets/icons/camera.svg',
        t.onboarding.step5.permission1,
        t.onboarding.step5.permission1Subtitle,
        cameraGranted,
        cameraLoading,
        requestCamera,
      ),
      (
        'assets/icons/microphone.svg',
        t.onboarding.step5.permission2,
        t.onboarding.step5.permission2Subtitle,
        micGranted,
        micLoading,
        requestMic,
      ),
      (
        'assets/icons/location.svg',
        t.onboarding.step5.permission3,
        t.onboarding.step5.permission3Subtitle,
        locationGranted,
        locationLoading,
        requestLocation,
      ),
    ];

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              t.onboarding.step5.title,
              style: AppTextStyles.heading(
                30,
                FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 28),
            ...permissions.map(
              (p) => _PermissionItem(
                iconPath: p.$1,
                title: p.$2,
                subtitle: p.$3,
                isGranted: p.$4,
                isLoading: p.$5,
                onToggle: p.$6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionItem extends StatelessWidget {
  const _PermissionItem({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.isGranted,
    required this.isLoading,
    required this.onToggle,
  });

  final String iconPath;
  final String title;
  final String subtitle;
  final ValueNotifier<bool> isGranted;
  final ValueNotifier<bool> isLoading;
  final Future<void> Function() onToggle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          Center(
            child: SvgPicture.asset(
              iconPath,
              width: 36,
              height: 36,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body(
                    15,
                    weight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTextStyles.body(
                    12,
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isGranted,
            builder: (context, granted, _) {
              return ValueListenableBuilder<bool>(
                valueListenable: isLoading,
                builder: (context, loading, _) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: loading
                        ? null
                        : () async {
                            await onToggle();
                          },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: 50,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: granted ? Colors.white : Colors.white54,
                      ),
                      child: loading
                          ? Center(
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white.withValues(alpha: 0.9),
                                  ),
                                ),
                              ),
                            )
                          : AnimatedAlign(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              alignment: granted
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: granted
                                      ? Color(0xff774487)
                                      : Colors.white24,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
