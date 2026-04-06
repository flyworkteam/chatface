import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'media_picker_panel.dart';

class InputSection extends HookConsumerWidget {
  final TextEditingController controller;
  final ValueNotifier<bool> showMediaPicker;
  final VoidCallback onSend;
  final Future<void> Function(ImageSource source) onPickAttachment;
  final bool isUploadingAttachment;

  const InputSection({
    super.key,
    required this.controller,
    required this.showMediaPicker,
    required this.onSend,
    required this.onPickAttachment,
    required this.isUploadingAttachment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: showMediaPicker.value
              ? MediaPickerPanel(onPick: onPickAttachment)
              : const SizedBox.shrink(),
        ),
        if (isUploadingAttachment)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Row(
              children: [
                const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    context.t.chat.uploadingPhoto,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => showMediaPicker.value = !showMediaPicker.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: showMediaPicker.value
                        ? const Color(0xFF9B3080).withValues(alpha: 0.5)
                        : Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    showMediaPicker.value
                        ? AppIcons.closecircle
                        : AppIcons.addcircle,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 44),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Center(
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => onSend(),
                      decoration: InputDecoration(
                        hintText: context.t.chat.typeAMessage,
                        hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.35),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 11,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onSend,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFE91E8C), Color(0xFFAA10A0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppIcons.sendMessage,
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
