import 'package:chatface/Services/translation_service.dart';
import 'package:flutter/material.dart';

class TranslatedJobTitle extends StatefulWidget {
  const TranslatedJobTitle({
    super.key,
    required this.title,
    required this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  final String title;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  State<TranslatedJobTitle> createState() => _TranslatedJobTitleState();
}

class _TranslatedJobTitleState extends State<TranslatedJobTitle> {
  String? _resolvedTitle;
  String? _activeLocale;
  int _requestId = 0;

  String get _normalizedTitle => widget.title.replaceAll('\n', ' ').trim();

  @override
  void initState() {
    super.initState();
    _resolvedTitle = _normalizedTitle;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshTranslationIfNeeded();
  }

  @override
  void didUpdateWidget(covariant TranslatedJobTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title) {
      _resolvedTitle = _normalizedTitle;
      _refreshTranslationIfNeeded(force: true);
    }
  }

  Future<void> _refreshTranslationIfNeeded({bool force = false}) async {
    final locale = Localizations.maybeLocaleOf(context);
    final targetLanguage = locale?.languageCode.isNotEmpty == true
        ? locale!.languageCode
        : TranslationService.instance.deviceLanguageCode;

    if (!force && _activeLocale == targetLanguage) {
      return;
    }

    _activeLocale = targetLanguage;
    final requestId = ++_requestId;
    final translated = await TranslationService.instance.translate(
      _normalizedTitle,
      targetLang: targetLanguage,
    );

    if (!mounted || requestId != _requestId) {
      return;
    }

    final normalizedResult = translated.trim();
    setState(() {
      _resolvedTitle = normalizedResult.isNotEmpty
          ? normalizedResult.replaceAll('\n', ' ')
          : _normalizedTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayTitle = _resolvedTitle?.trim().isNotEmpty == true
        ? _resolvedTitle!
        : _normalizedTitle;

    return Text(
      displayTitle,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textAlign: widget.textAlign,
      style: widget.style,
    );
  }
}
