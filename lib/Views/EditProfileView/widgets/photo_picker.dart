import 'dart:io';

import 'package:chatface/theme/app_border_radius.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoPicker extends StatefulWidget {
  const PhotoPicker({
    super.key,
    this.imageUrls = const [],
    this.uploadingImage,
    this.maxPhotos = 10,
    this.isUploading = false,
    this.onAdd,
    this.onEditAt,
    this.onRemoveAt,
  });

  final List<String> imageUrls;
  final File? uploadingImage;
  final int maxPhotos;
  final bool isUploading;
  final VoidCallback? onAdd;
  final ValueChanged<int>? onEditAt;
  final ValueChanged<int>? onRemoveAt;

  @override
  State<PhotoPicker> createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  int? _activeIndex;
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant PhotoPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldVisibleCount =
        oldWidget.imageUrls.length + (oldWidget.uploadingImage != null ? 1 : 0);
    final newVisibleCount =
        widget.imageUrls.length + (widget.uploadingImage != null ? 1 : 0);

    if (_activeIndex != null && _activeIndex! >= widget.imageUrls.length) {
      _activeIndex = null;
    }

    if (newVisibleCount > oldVisibleCount) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_scrollController.hasClients) return;

        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildPhotoCard({required Widget child}) {
    return SizedBox(width: 118, height: 162, child: child);
  }

  @override
  Widget build(BuildContext context) {
    final hasRoom = widget.imageUrls.length < widget.maxPhotos;
    final showAddCard = hasRoom && widget.uploadingImage == null;

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          for (var i = 0; i < widget.imageUrls.length; i++) ...[
            GestureDetector(
              onTap: () {
                setState(() {
                  _activeIndex = _activeIndex == i ? null : i;
                });
              },
              child: _buildPhotoCard(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: AppBorderRadius.lgRadius,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                widget.imageUrls[i],
                                fit: BoxFit.cover,
                                errorBuilder: (context, _, _) {
                                  return Image.asset(
                                    AppImages.person1,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            if (_activeIndex == i)
                              Positioned.fill(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.35),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (_activeIndex == i) ...[
                      Positioned(
                        top: 20,
                        right: 15,
                        left: 15,
                        bottom: 20,
                        child: GestureDetector(
                          onTap: widget.isUploading ? null : widget.onAdd,
                          child: ClipRRect(
                            borderRadius: AppBorderRadius.lgRadius,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF2A153D,
                                ).withValues(alpha: 0.4),
                                borderRadius: AppBorderRadius.lgRadius,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppIcons.addcircle,
                                  width: 35,
                                  height: 35,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: GestureDetector(
                          onTap: () {
                            widget.onEditAt?.call(i);
                          },
                          child: SvgPicture.asset(AppIcons.edit),
                        ),
                      ),
                      Positioned(
                        right: -15,
                        top: -15,
                        child: GestureDetector(
                          onTap: () {
                            widget.onRemoveAt?.call(i);
                          },
                          child: SvgPicture.asset(AppIcons.minuscircle),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],

          if (widget.uploadingImage != null) ...[
            _buildPhotoCard(
              child: ClipRRect(
                borderRadius: AppBorderRadius.lgRadius,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.file(
                        widget.uploadingImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.45),
                        ),
                        child: const Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],

          if (showAddCard)
            GestureDetector(
              onTap: widget.isUploading ? null : widget.onAdd,
              child: _buildPhotoCard(
                child: ClipRRect(
                  borderRadius: AppBorderRadius.lgRadius,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A153D).withValues(alpha: 0.9),
                      borderRadius: AppBorderRadius.lgRadius,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.addcircle,
                        width: 35,
                        height: 35,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
