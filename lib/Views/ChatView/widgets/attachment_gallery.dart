import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatface/Models/ai_message_model.dart';
import 'package:flutter/material.dart';

Future<void> showAttachmentGallery(
  BuildContext context,
  List<AiAttachment> attachments,
  int initialIndex,
) {
  if (attachments.isEmpty) {
    return Future.value();
  }

  final startIndex = initialIndex.clamp(0, attachments.length - 1);

  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'close',
    barrierColor: Colors.black87,
    pageBuilder: (_, _, _) => _AttachmentGalleryView(
      attachments: attachments,
      initialIndex: startIndex,
    ),
  );
}

class _AttachmentGalleryView extends StatefulWidget {
  const _AttachmentGalleryView({
    required this.attachments,
    required this.initialIndex,
  });

  final List<AiAttachment> attachments;
  final int initialIndex;

  @override
  State<_AttachmentGalleryView> createState() => _AttachmentGalleryViewState();
}

class _AttachmentGalleryViewState extends State<_AttachmentGalleryView> {
  late final PageController _controller;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.95),
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.attachments.length,
              onPageChanged: (value) => setState(() {
                _index = value;
              }),
              itemBuilder: (_, pageIndex) {
                final attachment = widget.attachments[pageIndex];
                final imageUrl = attachment.url;
                return InteractiveViewer(
                  maxScale: 4,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (_, _, _) => const Icon(
                        Icons.broken_image,
                        color: Colors.white54,
                        size: 56,
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: 12,
              right: 12,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Text(
                '${_index + 1} / ${widget.attachments.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
