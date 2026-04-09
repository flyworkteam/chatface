import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Views/ChatView/widgets/attachment_gallery.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  style: AppTextStyles.body(
                    12,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
                if (hasText) const SizedBox(height: 8),
              ],
            ),
          if (hasText)
            _MessageTextBubble(
              text: message.text,
              isUser: isUser,
              onListen: onListen,
              isListening: isListening,
            ),

          if (isUser && !message.isDelivered && hasAttachments)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                context.t.chat.uploadingPhoto,
                style: AppTextStyles.body(
                  12,
                  color: Colors.white.withValues(alpha: 0.5),
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

enum _MessageAction { copy, listen }

class _MessageTextBubble extends StatelessWidget {
  const _MessageTextBubble({
    required this.text,
    required this.isUser,
    this.onListen,
    required this.isListening,
  });

  final String text;
  final bool isUser;
  final VoidCallback? onListen;
  final bool isListening;

  @override
  Widget build(BuildContext context) {
    final bubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      decoration: BoxDecoration(
        gradient: isUser
            ? const LinearGradient(
                colors: [
                  Color(0xFFE46264),
                  Color(0xFFB94991),
                  Color(0xFFB01CD4),
                ],
                stops: [0, 0.5, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isUser ? null : const Color(0xff222021),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30),
          bottomLeft: Radius.circular(isUser ? 30 : 0),
          bottomRight: Radius.circular(isUser ? 0 : 30),
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.body(14, color: Colors.white, height: 14 * 1.55),
      ),
    );

    if (isUser) return bubble;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<_MessageAction>(
        customButton: bubble,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.zero,
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        dropdownStyleData: DropdownStyleData(
          width: 190,
          offset: const Offset(0, -5),
          elevation: 0,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E24),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        items: [
          DropdownMenuItem<_MessageAction>(
            value: _MessageAction.copy,
            child: _MessageActionTile(
              iconAsset: AppIcons.copyMessage,
              label: MaterialLocalizations.of(context).copyButtonLabel,
            ),
          ),
          if (onListen != null)
            DropdownMenuItem<_MessageAction>(
              value: _MessageAction.listen,
              enabled: !isListening,
              child: _MessageActionTile(
                iconAsset: isListening
                    ? AppIcons.callvolumeslash
                    : AppIcons.callvolume,
                label: context.t.chat.readAloud,
                isDisabled: isListening,
              ),
            ),
        ],
        onChanged: (action) {
          if (action == null) return;
          switch (action) {
            case _MessageAction.copy:
              Clipboard.setData(ClipboardData(text: text));
              break;
            case _MessageAction.listen:
              if (!isListening) onListen?.call();
              break;
          }
        },
      ),
    );
  }
}

class _MessageActionTile extends StatelessWidget {
  const _MessageActionTile({
    required this.iconAsset,
    required this.label,
    this.isDisabled = false,
  });

  final String iconAsset;
  final String label;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final itemColor = isDisabled ? Colors.white38 : Colors.white;

    return Row(
      spacing: 12,
      children: [
        SvgPicture.asset(
          iconAsset,
          colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
        ),
        Text(label, style: AppTextStyles.body(16, color: itemColor)),
      ],
    );
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
              style: AppTextStyles.body(13, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
