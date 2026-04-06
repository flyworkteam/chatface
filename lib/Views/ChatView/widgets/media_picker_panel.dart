import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'media_option.dart';

class MediaPickerPanel extends StatelessWidget {
  const MediaPickerPanel({super.key, required this.onPick});

  final Future<void> Function(ImageSource source) onPick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediaOption(
          icon: SvgPicture.asset(AppIcons.gallery),
          label: context.t.chat.gallery,
          onTap: () => onPick(ImageSource.gallery),
        ),
        MediaOption(
          icon: SvgPicture.asset(AppIcons.camera),
          label: context.t.chat.camera,
          onTap: () => onPick(ImageSource.camera),
        ),
      ],
    );
  }
}
