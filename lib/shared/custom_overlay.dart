// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:chatface/theme/app_colors.dart';
import 'package:chatface/theme/app_paddings.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum OverlayType { success, info, error, favoriteRemoved }

class CustomOverlay {
  static void show(
    BuildContext context, {
    required String message,
    required String icon,
    String? title,
    OverlayType type = OverlayType.info,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? undoAction,
    String? undoLabel,
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (_) => _OverlayContent(
        message: message,
        icon: icon,
        type: type,
        duration: duration,
        title: title,
        undoAction: undoAction,
        undoLabel: undoLabel,
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, overlayEntry.remove);
  }
}

class _OverlayContent extends HookWidget {
  final String message;
  final String? title;
  final OverlayType type;
  final Duration duration;
  final String icon;
  final VoidCallback? undoAction;
  final String? undoLabel;

  const _OverlayContent({
    required this.message,
    required this.type,
    required this.icon,
    this.title,
    this.duration = const Duration(seconds: 3),
    this.undoAction,
    this.undoLabel,
  });

  Color _backgroundColor() {
    switch (type) {
      case OverlayType.success:
        return Color(0xffe6f7f1cc).withValues(alpha: 0.8);
      case OverlayType.error:
        return AppColors.danger.withValues(alpha: 0.92);
      case OverlayType.info:
        return Color(0xfffff3e7cc).withValues(alpha: 0.8);
      case OverlayType.favoriteRemoved:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    final offsetAnim = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));
    final opacityAnim = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    useEffect(() {
      controller.forward();
      return null;
    }, []);

    return Positioned(
      top: 50,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: offsetAnim,
        child: FadeTransition(
          opacity: opacityAnim,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                color: _backgroundColor(),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: icon.endsWith('.svg')
                          ? SvgPicture.asset(icon, width: 24, height: 24)
                          : Image.asset(icon),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: title != null && title!.isNotEmpty
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title!,
                                style: AppTextStyles.body(
                                  16,
                                  weight: FontWeight.w600,
                                  color: OverlayType.favoriteRemoved == type
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                message,
                                style: AppTextStyles.body(
                                  14,
                                  color: OverlayType.favoriteRemoved == type
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            message,
                            style: AppTextStyles.body(
                              16,
                              color: OverlayType.favoriteRemoved == type
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                  ),
                  if (undoAction != null)
                    TextButton(
                      onPressed: undoAction,
                      child: Text(
                        (undoLabel == null || undoLabel!.trim().isEmpty)
                            ? 'Undo'
                            : undoLabel!,
                        style: AppTextStyles.body(
                          16,
                          weight: FontWeight.w600,
                          color: OverlayType.favoriteRemoved == type
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
