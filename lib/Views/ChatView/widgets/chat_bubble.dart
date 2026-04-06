import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Views/ChatView/widgets/attachment_gallery.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    this.onListen,
    this.isListening = false,
  });

  final AiMessage message;
  final VoidCallback? onListen;
  final bool isListening;

  @override
  Widget build(BuildContext context) {
    if (message.isMarker) {
      return _ConversationMarkerChip(text: _markerLabel(context));
    }

    final isUser = message.role == 'user';
    final hasAttachments = message.attachments.isNotEmpty;
    final hasText = message.text.trim().isNotEmpty;

    return Padding(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: isUser ? 60 : 0,
        right: isUser ? 0 : 60,
      ),
      child: Column(
        crossAxisAlignment: isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (hasAttachments)
            Column(
              crossAxisAlignment: isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                _AttachmentGrid(
                  attachments: message.attachments,
                  isUser: isUser,
                  onTapAttachment: (index) => showAttachmentGallery(
                    context,
                    message.attachments,
                    index,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  context.t.chat.tapToViewPhoto,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.45),
                    fontSize: 12,
                  ),
                ),
                if (hasText) const SizedBox(height: 8),
              ],
            ),
          if (hasText)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              decoration: BoxDecoration(
                gradient: isUser
                    ? const LinearGradient(
                        colors: [Color(0xFFE91E8C), Color(0xFFAA10A0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: isUser ? null : Colors.white.withValues(alpha: 0.10),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isUser ? 18 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 18),
                ),
              ),
              child: Text(
                message.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.55,
                ),
              ),
            ),
          if (!isUser && onListen != null)
            TextButton.icon(
              onPressed: isListening ? null : onListen,
              icon: SvgPicture.asset(
                AppIcons.callvolume,
                colorFilter: const ColorFilter.mode(
                  Colors.white70,
                  BlendMode.srcIn,
                ),
              ),
              label: Text(
                isListening ? 'Playing...' : 'Listen',
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          if (isUser && !message.isDelivered && hasAttachments)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                context.t.chat.uploadingPhoto,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _markerLabel(BuildContext context) {
    if (message.conversationType == 'video_call') {
      return context.t.chat.videoCallEnded;
    }
    if (message.conversationType == 'voice_call') {
      return context.t.chat.voiceCallEnded;
    }
    return message.text.isNotEmpty
        ? message.text
        : context.t.chat.voiceCallEnded;
  }
}

class _AttachmentGrid extends StatelessWidget {
  const _AttachmentGrid({
    required this.attachments,
    required this.onTapAttachment,
    required this.isUser,
  });

  final List<AiAttachment> attachments;
  final ValueChanged<int> onTapAttachment;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: isUser ? WrapAlignment.end : WrapAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < attachments.length; i++)
          GestureDetector(
            onTap: () => onTapAttachment(i),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: 180,
                height: 180,
                color: Colors.white.withValues(alpha: 0.08),
                child: CachedNetworkImage(
                  imageUrl: attachments[i].thumbnailUrl ?? attachments[i].url,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (_, _, _) =>
                      const Icon(Icons.broken_image, color: Colors.white54),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ConversationMarkerChip extends StatelessWidget {
  const _ConversationMarkerChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
