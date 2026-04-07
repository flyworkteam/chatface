import 'package:chatface/theme/app_border_radius.dart';
import 'package:chatface/theme/app_paddings.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomFormTextField extends HookWidget {
  const CustomFormTextField({
    super.key,
    this.label,
    this.hintText,
    this.helperText,
    this.initialValue,
    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintStyle,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.autofillHints,
    this.prefixIcon,
    this.suffixIcon,
    this.showVisibilityToggle = false,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onTap,
    this.focusNode,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.contentPadding,
    this.borderRadius,
    this.inputFormatters,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.visibilityOnIcon = Icons.visibility,
    this.visibilityOffIcon = Icons.visibility_off,
  }) : assert(
         controller == null || initialValue == null,
         'You cannot provide both a controller and an initialValue.',
       );

  final String? label;
  final String? hintText;
  final String? helperText;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showVisibilityToggle;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableSuggestions;
  final bool autocorrect;
  final IconData visibilityOnIcon;
  final IconData visibilityOffIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final double resolvedRadius = borderRadius ?? AppBorderRadius.xl;
    final EdgeInsetsGeometry resolvedPadding =
        contentPadding ??
        const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md + 4,
        );
    final Color resolvedFill =
        fillColor ??
        colorScheme.surfaceContainerHigh.withValues(
          alpha: colorScheme.brightness == Brightness.dark ? 0.35 : 0.65,
        );
    final Color resolvedBorder = borderColor ?? colorScheme.outlineVariant;
    final Color resolvedFocusedBorder =
        focusedBorderColor ?? colorScheme.primary;
    final Color resolvedErrorBorder = errorBorderColor ?? colorScheme.error;

    OutlineInputBorder outline(Color color, {double width = 1.4}) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(resolvedRadius),
          borderSide: BorderSide(color: color, width: width),
        );

    final localFocusNode = useFocusNode();
    final FocusNode activeFocusNode = focusNode ?? localFocusNode;
    final isObscured = useState(obscureText);

    final bool effectiveObscure = obscureText || showVisibilityToggle;
    final Widget? effectiveSuffix = showVisibilityToggle && effectiveObscure
        ? IconButton(
            visualDensity: VisualDensity.compact,
            icon: Icon(
              isObscured.value ? visibilityOffIcon : visibilityOnIcon,
              color: colorScheme.onSurfaceVariant,
            ),
            onPressed: () => isObscured.value = !isObscured.value,
          )
        : suffixIcon;

    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      focusNode: activeFocusNode,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      obscureText: effectiveObscure ? isObscured.value : false,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: effectiveObscure ? 1 : maxLines,
      minLines: effectiveObscure ? 1 : minLines,
      maxLength: maxLength,
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      inputFormatters: inputFormatters,
      style: AppTextStyles.body(16, color: colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        helperText: helperText,
        prefixIcon: prefixIcon,
        suffixIcon: effectiveSuffix,
        filled: true,
        fillColor: resolvedFill,
        contentPadding: resolvedPadding,
        hintStyle:
            hintStyle ??
            AppTextStyles.body(
              14,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
        labelStyle: AppTextStyles.body(14, color: colorScheme.onSurface),
        helperStyle: AppTextStyles.body(
          12,
          color: colorScheme.onSurfaceVariant,
        ),
        errorStyle: AppTextStyles.body(12, color: resolvedErrorBorder),
        border: outline(resolvedBorder),
        enabledBorder: outline(resolvedBorder),
        disabledBorder: outline(
          resolvedBorder.withValues(alpha: 0.4),
          width: 1.2,
        ),
        focusedBorder: outline(resolvedFocusedBorder, width: 1.8),
        errorBorder: outline(resolvedErrorBorder),
        focusedErrorBorder: outline(resolvedErrorBorder, width: 1.8),
      ),
    );
  }
}
