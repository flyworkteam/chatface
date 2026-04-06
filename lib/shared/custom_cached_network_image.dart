import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatface/theme/app_border_radius.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
    this.cacheKey,
    this.alignment = Alignment.center,
    this.fadeInDuration = const Duration(milliseconds: 350),
    this.fadeOutDuration = const Duration(milliseconds: 200),
    this.memCacheWidth,
    this.memCacheHeight,
    this.filterQuality = FilterQuality.high,
    this.onTap,
    this.semanticLabel,
    this.backgroundImage,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  final double? borderRadius;
  final String? cacheKey;
  final Alignment alignment;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final FilterQuality filterQuality;
  final VoidCallback? onTap;
  final String? semanticLabel;
  final String? backgroundImage;

  @override
  Widget build(BuildContext context) {
    Widget image = Container(
      decoration: backgroundImage != null
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              ),
            )
          : null,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        cacheKey: cacheKey,
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: memCacheWidth,
        memCacheHeight: memCacheHeight,
        alignment: alignment,
        fadeInDuration: fadeInDuration,
        fadeOutDuration: fadeOutDuration,
        filterQuality: filterQuality,
        placeholder: placeholder ?? _defaultPlaceholder,
        errorWidget: errorWidget ?? _defaultErrorWidget,
      ),
    );

    final double resolvedRadius = borderRadius ?? AppBorderRadius.md;

    image = ClipRRect(
      borderRadius: BorderRadius.circular(resolvedRadius),
      child: image,
    );

    if (semanticLabel != null) {
      image = Semantics(label: semanticLabel, image: true, child: image);
    }

    if (onTap != null) {
      image = GestureDetector(onTap: onTap, child: image);
    }

    return image;
  }

  Widget _defaultPlaceholder(BuildContext context, String url) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: backgroundImage != null
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              ),
            )
          : null,
      child: SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _defaultErrorWidget(BuildContext context, String url, Object error) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(borderRadius ?? AppBorderRadius.md),
      ),
      child: Center(
        child: Icon(
          Icons.broken_image_outlined,
          color: colorScheme.onErrorContainer,
          size: 28,
        ),
      ),
    );
  }
}
