import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

enum CustomButtonType { filled, outlined, text, icon }

enum CustomButtonSize { small, medium, large }

enum CustomButtonIconPosition { leading, trailing, start, end }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.label = '',
    this.onPressed,
    this.onLongPress,
    this.type = CustomButtonType.filled,
    this.size = CustomButtonSize.medium,
    this.fullWidth = false,
    this.iconPadding,
    this.icon,
    this.iconPosition = CustomButtonIconPosition.leading,
    this.isLoading = false,
    this.disabled = false,
    this.backgroundColor,
    this.foregroundColor,
    this.labelColor,
    this.labelStyle,
    this.gradient,
    this.gradientColors,
    this.gradientBegin,
    this.gradientEnd,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shadow,
  });

  const CustomButton.icon({
    super.key,
    required Widget this.icon,
    this.onPressed,
    this.onLongPress,
    this.size = CustomButtonSize.medium,
    this.isLoading = false,
    this.disabled = false,
    this.backgroundColor,
    this.foregroundColor,
    this.labelColor,
    this.iconPadding,
    this.labelStyle,
    this.gradient,
    this.gradientColors,
    this.gradientBegin,
    this.gradientEnd,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shadow,
  }) : label = '',
       type = CustomButtonType.icon,
       fullWidth = false,
       iconPosition = CustomButtonIconPosition.leading;

  const CustomButton.iconFilled({
    super.key,
    required Widget this.icon,
    this.onPressed,
    this.onLongPress,
    this.size = CustomButtonSize.medium,
    this.isLoading = false,
    this.disabled = false,
    this.backgroundColor,
    this.foregroundColor,
    this.labelColor,
    this.labelStyle,
    this.gradient,
    this.iconPadding,
    this.gradientColors,
    this.gradientBegin,
    this.gradientEnd,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shadow,
  }) : label = '',
       type = CustomButtonType.filled,
       fullWidth = false,
       iconPosition = CustomButtonIconPosition.leading;

  final String label;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final CustomButtonType type;
  final CustomButtonSize size;
  final bool fullWidth;
  final Widget? icon;
  final CustomButtonIconPosition iconPosition;
  final bool isLoading;
  final bool disabled;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? labelColor;
  final double? iconPadding;
  final TextStyle? labelStyle;

  /// Hazır bir Gradient objesi (LinearGradient, RadialGradient, vb.)
  final Gradient? gradient;

  /// Gradient için renk listesi (gradient null ise bu kullanılır)
  final List<Color>? gradientColors;

  /// Gradient başlangıç noktası (varsayılan: centerLeft)
  final AlignmentGeometry? gradientBegin;

  /// Gradient bitiş noktası (varsayılan: centerRight)
  final AlignmentGeometry? gradientEnd;

  /// Border rengi (outlined type için)
  final Color? borderColor;

  /// Border kalınlığı (outlined type için)
  final double? borderWidth;

  /// Border radius
  final double? borderRadius;

  /// Butona uygulanacak gölge listesi
  final List<BoxShadow>? shadow;

  bool get _isEnabled => !disabled && !isLoading && onPressed != null;

  /// Shadow varsa butonu DecoratedBox ile sarmalar, yoksa direkt döner.
  Widget _wrapWithShadow({
    required Widget child,
    required double borderRadius,
    List<BoxShadow>? shadow,
  }) {
    if (shadow == null || shadow.isEmpty) return child;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadow,
      ),
      child: child,
    );
  }

  /// Gradient'i çözer: önce gradient prop, yoksa gradientColors'dan oluşturur
  Gradient? get _resolvedGradient {
    if (gradient != null) return gradient;
    if (gradientColors != null && gradientColors!.length >= 2) {
      return LinearGradient(
        colors: gradientColors!,
        begin: gradientBegin ?? Alignment.centerLeft,
        end: gradientEnd ?? Alignment.centerRight,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final resolvedLabelStyle = labelStyle?.copyWith(inherit: false);
    final effectiveGradient = _resolvedGradient;

    final ButtonStyle baseStyle = switch (type) {
      CustomButtonType.filled => FilledButton.styleFrom(
        // Gradient varsa arka plan şeffaf olmalı
        backgroundColor: effectiveGradient != null
            ? Colors.transparent
            : (backgroundColor ?? colorScheme.primary),
        side: borderColor != null
            ? BorderSide(color: borderColor!, width: borderWidth ?? 1)
            : null,
        foregroundColor: foregroundColor ?? colorScheme.onPrimary,
        textStyle: resolvedLabelStyle,
      ),
      CustomButtonType.outlined => OutlinedButton.styleFrom(
        foregroundColor: foregroundColor ?? colorScheme.primary,
        side: BorderSide(
          color: borderColor ?? foregroundColor ?? colorScheme.primary,
          width: borderWidth ?? 1.5,
        ),
        textStyle: resolvedLabelStyle,
      ),
      CustomButtonType.text => TextButton.styleFrom(
        foregroundColor: foregroundColor ?? colorScheme.primary,
        textStyle: resolvedLabelStyle,
      ),
      CustomButtonType.icon => IconButton.styleFrom(
        foregroundColor: foregroundColor ?? colorScheme.primary,
      ),
    };

    final EdgeInsetsGeometry padding = switch (size) {
      CustomButtonSize.small => const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      CustomButtonSize.medium => const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      CustomButtonSize.large => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
    };

    // labelStyle verilmişse onu kullan, yoksa size'a göre otomatik oluştur
    final TextStyle textStyle =
        resolvedLabelStyle ??
        switch (size) {
          CustomButtonSize.small => AppTextStyles.body(
            12,
            color:
                labelColor ??
                foregroundColor ??
                baseStyle.foregroundColor?.resolve({}),
          ),
          CustomButtonSize.medium => AppTextStyles.body(
            14,
            color:
                labelColor ??
                foregroundColor ??
                baseStyle.foregroundColor?.resolve({}),
          ),
          CustomButtonSize.large => AppTextStyles.body(
            16,
            color:
                labelColor ??
                foregroundColor ??
                baseStyle.foregroundColor?.resolve({}),
          ),
        };

    final ButtonStyle resolvedStyle = baseStyle.merge(
      ButtonStyle(
        textStyle: WidgetStateProperty.all(textStyle),
        padding: WidgetStateProperty.all(padding),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 50),
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(fullWidth ? double.infinity : 0, switch (size) {
            CustomButtonSize.small => 40,
            CustomButtonSize.medium => 48,
            CustomButtonSize.large => 56,
          }),
        ),
        shadowColor: shadow != null
            ? WidgetStateProperty.all(shadow!.first.color)
            : null,
        elevation: shadow != null
            ? WidgetStateProperty.all(shadow!.first.blurRadius / 2)
            : null,
      ),
    );

    final Widget content = _ButtonContent(
      label: label,
      icon: icon,
      iconPosition: iconPosition,
      textStyle: textStyle,
      iconPadding: iconPadding,
      isLoading: isLoading,
      colorScheme: colorScheme,
    );

    switch (type) {
      case CustomButtonType.filled:
        if (icon != null && label.isEmpty) {
          final iconBgColor = backgroundColor ?? colorScheme.primary;
          final iconFgColor = foregroundColor ?? colorScheme.onPrimary;

          return Container(
            width: switch (size) {
              CustomButtonSize.small => 40,
              CustomButtonSize.medium => 48,
              CustomButtonSize.large => 56,
            },
            height: switch (size) {
              CustomButtonSize.small => 40,
              CustomButtonSize.medium => 48,
              CustomButtonSize.large => 56,
            },
            decoration: BoxDecoration(
              color: _isEnabled
                  ? iconBgColor
                  : colorScheme.onSurface.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              boxShadow: shadow,
            ),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: _isEnabled ? onPressed : null,
                onLongPress: _isEnabled ? onLongPress : null,
                child: Center(
                  child: IconTheme(
                    data: IconThemeData(
                      color: _isEnabled
                          ? iconFgColor
                          : colorScheme.onSurface.withValues(alpha: 0.6),
                      size: switch (size) {
                        CustomButtonSize.small => 18,
                        CustomButtonSize.medium => 20,
                        CustomButtonSize.large => 24,
                      },
                    ),
                    child: content,
                  ),
                ),
              ),
            ),
          );
        }

        // Gradient varsa özel Container ile sarmalıyoruz
        if (effectiveGradient != null) {
          return Container(
            width: fullWidth ? double.infinity : null,
            height: switch (size) {
              CustomButtonSize.small => 40,
              CustomButtonSize.medium => 48,
              CustomButtonSize.large => 56,
            },
            decoration: BoxDecoration(
              gradient: _isEnabled ? effectiveGradient : null,
              color: !_isEnabled
                  ? colorScheme.onSurface.withValues(alpha: 0.1)
                  : null,
              borderRadius: BorderRadius.circular(borderRadius ?? 50),
              boxShadow: shadow,
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius ?? 50),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: _isEnabled ? onPressed : null,
                onLongPress: _isEnabled ? onLongPress : null,
                borderRadius: BorderRadius.circular(borderRadius ?? 50),
                child: Container(
                  padding: padding,
                  alignment: Alignment.center,
                  child: content,
                ),
              ),
            ),
          );
        }

        return _wrapWithShadow(
          shadow: shadow,
          borderRadius: borderRadius ?? 50,
          child: FilledButton(
            style: resolvedStyle,
            onPressed: _isEnabled ? onPressed : null,
            onLongPress: _isEnabled ? onLongPress : null,
            child: content,
          ),
        );
      case CustomButtonType.outlined:
        return _wrapWithShadow(
          shadow: shadow,
          borderRadius: borderRadius ?? 50,
          child: OutlinedButton(
            style: resolvedStyle,
            onPressed: _isEnabled ? onPressed : null,
            onLongPress: _isEnabled ? onLongPress : null,
            child: content,
          ),
        );
      case CustomButtonType.text:
        return _wrapWithShadow(
          shadow: shadow,
          borderRadius: borderRadius ?? 50,
          child: TextButton(
            style: resolvedStyle,
            onPressed: _isEnabled ? onPressed : null,
            onLongPress: _isEnabled ? onLongPress : null,
            child: content,
          ),
        );
      case CustomButtonType.icon:
        final iconBgColor =
            backgroundColor ??
            (_isEnabled
                ? colorScheme.primary.withValues(alpha: 0.1)
                : colorScheme.onSurface.withValues(alpha: 0.1));

        final iconFgColor =
            foregroundColor ??
            (_isEnabled
                ? colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.6));

        return Container(
          width: switch (size) {
            CustomButtonSize.small => 40,
            CustomButtonSize.medium => 48,
            CustomButtonSize.large => 56,
          },
          height: switch (size) {
            CustomButtonSize.small => 40,
            CustomButtonSize.medium => 48,
            CustomButtonSize.large => 56,
          },
          decoration: BoxDecoration(
            color: effectiveGradient != null && _isEnabled ? null : iconBgColor,
            gradient: _isEnabled ? effectiveGradient : null,
            shape: BoxShape.circle,
            boxShadow: shadow,
          ),
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: _isEnabled ? onPressed : null,
              onLongPress: _isEnabled ? onLongPress : null,
              child: Center(
                child: IconTheme(
                  data: IconThemeData(
                    color: iconFgColor,
                    size: switch (size) {
                      CustomButtonSize.small => 18,
                      CustomButtonSize.medium => 20,
                      CustomButtonSize.large => 24,
                    },
                  ),
                  child: content,
                ),
              ),
            ),
          ),
        );
    }
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.icon,
    required this.iconPosition,
    required this.textStyle,
    required this.isLoading,
    this.iconPadding,
    required this.colorScheme,
  });

  final String label;
  final Widget? icon;
  final CustomButtonIconPosition iconPosition;
  final TextStyle textStyle;
  final bool isLoading;
  final double? iconPadding;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final labelWidget = Text(label, style: textStyle);

    if (isLoading) {
      return SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(
            textStyle.color ?? colorScheme.primary,
          ),
        ),
      );
    }

    if (icon != null && label.isEmpty) {
      return icon!;
    }

    if (icon == null) {
      return labelWidget;
    }

    final children = <Widget>[labelWidget];

    if (iconPosition == CustomButtonIconPosition.start) {
      children.insert(
        0,
        Padding(
          padding: EdgeInsets.only(right: iconPadding ?? 0),
          child: icon,
        ),
      );
    } else if (iconPosition == CustomButtonIconPosition.trailing) {
      children.add(
        Padding(
          padding: EdgeInsets.only(left: iconPadding ?? 0),
          child: icon,
        ),
      );
    } else if (iconPosition == CustomButtonIconPosition.end) {
      children.insert(0, SizedBox(width: 5));
      children.add(
        Padding(
          padding: EdgeInsets.only(left: iconPadding ?? 5),
          child: icon,
        ),
      );
    } else if (iconPosition == CustomButtonIconPosition.leading) {
      children.insert(
        0,
        Padding(
          padding: EdgeInsets.only(right: iconPadding ?? 5),
          child: icon,
        ),
      );
      children.add(const SizedBox(width: 5));
    } else {
      children.add(
        Padding(padding: const EdgeInsets.only(left: 12), child: icon),
      );
    }

    return Row(
      mainAxisSize:
          iconPosition == CustomButtonIconPosition.start ||
              iconPosition == CustomButtonIconPosition.end
          ? MainAxisSize.max
          : MainAxisSize.min,
      mainAxisAlignment:
          iconPosition == CustomButtonIconPosition.start ||
              iconPosition == CustomButtonIconPosition.end
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
