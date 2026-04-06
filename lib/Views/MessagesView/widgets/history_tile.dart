import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';
import 'models.dart';

class HistoryTile extends StatelessWidget {
  final HistoryItem item;
  const HistoryTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final timeLabel = TimeOfDay.fromDateTime(item.updatedAt).format(context);
    final icon = _previewIcon(item.previewType);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) =>
                ChatView(persona: item.character, sessionId: item.sessionId),
          ),
        );
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        timeLabel,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.45),
                          fontSize: 12,
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
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.55),
                            fontSize: 13,
                            height: 1.4,
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
