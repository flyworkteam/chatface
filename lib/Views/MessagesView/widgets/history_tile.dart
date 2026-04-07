import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/Riverpod/Providers/conversation_history_provider.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'avatar.dart';
import 'models.dart';

class HistoryTile extends ConsumerWidget {
  final HistoryItem item;
  const HistoryTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeLabel = TimeOfDay.fromDateTime(item.updatedAt).format(context);
    final icon = _previewIcon(item.previewType);
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChatView(
              persona: item.character,
              sessionId: item.sessionId,
              sessionMode: item.sessionMode,
              sessionLanguage: item.sessionLanguage,
            ),
          ),
        );
        ref.invalidate(conversationHistoryProvider);
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Avatar(character: item.character, radius: 26),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.character.name,
                        style: AppTextStyles.body(
                          15,
                          color: Colors.white,
                          weight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        timeLabel,
                        style: AppTextStyles.body(
                          12,
                          color: Colors.white.withValues(alpha: 0.45),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (icon != null) ...[
                        Icon(
                          icon,
                          size: 16,
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 6),
                      ],
                      Expanded(
                        child: Text(
                          item.previewText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.body(
                            13,
                            color: Colors.white.withValues(alpha: 0.55),
                            height: 13 * 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData? _previewIcon(String type) {
    switch (type) {
      case 'photo':
        return Icons.photo;
      case 'call_marker':
        return Icons.call_end;
      default:
        return null;
    }
  }
}
