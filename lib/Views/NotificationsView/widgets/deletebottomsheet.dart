import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class DeleteNotificationsBottomSheet extends StatelessWidget {
  const DeleteNotificationsBottomSheet({
    this.onCancel,
    this.onDelete,
    super.key,
  });

  final VoidCallback? onCancel;
  final VoidCallback? onDelete;

  static void show(BuildContext context, {VoidCallback? onDelete}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => DeleteNotificationsBottomSheet(
        onCancel: () => Navigator.pop(context),
        onDelete: () {
          Navigator.pop(context);
          onDelete?.call();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Center(
                // child: SvgPicture.asset(AppIcons.delete, width: 40, height: 40),
              ),
            ),
            const SizedBox(height: 16),
            // Text(
            //   context.t.deleteNotifications,
            //   textAlign: TextAlign.center,
            //   style: AppTextStyles.body(
            //     20,
            //     height: 22,
            //     weight: FontWeight.w600,
            //     color: Colors.black,
            //   ),
            // ),
            // const SizedBox(height: 12),
            // Text(
            //   context.t.deleteNotificationsDescription,
            //   textAlign: TextAlign.center,
            //   style: AppTextStyles.body(
            //     16,
            //     height: 18,
            //     weight: FontWeight.w400,
            //     color: Colors.black,
            //   ),
            // ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onCancel,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          context.t.cancel,
                          style: AppTextStyles.body(
                            16,
                            height: 18,
                            weight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // child: Center(
                      //   child: Text(
                      //     context.t.deleteAll,
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w600,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
