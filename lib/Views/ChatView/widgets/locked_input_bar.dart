import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';

class LockedInputBar extends StatelessWidget {
  const LockedInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                context.t.chat.pleaseUpgrade,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75),
                  fontSize: 14,
                ),
              ),
            ),
            Image.asset(AppIcons.lock, width: 22, height: 22),
          ],
        ),
      ),
    );
  }
}
