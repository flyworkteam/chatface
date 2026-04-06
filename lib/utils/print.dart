import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

enum LogLevel {
  verbose,
  debug,
  info,
  success,
  data,
  api,
  perf,
  warning,
  error,
  route,
  json,
}

/// Dahili pattern override yapısı
class PatternLevelOverride {
  final RegExp pattern;
  final LogLevel level;
  PatternLevelOverride(this.pattern, this.level);
}

/// Log görünümünü kontrol etmek için konfigürasyon
class LogConfig {
  bool enableColors;
  bool showTimestamp;
  bool showLevelLabel;
  bool showStackTraceOnError; // eski davranış (developer.log stackTrace alanı)
  bool showStackTraceInline; // yeni: kutu içine yaz
  bool forceLogInRelease;
  bool prettyJson;
  bool jsonSyntaxHighlight;
  bool trimLargeJson;
  int horizontalPadding;
  int minBoxWidth;
  int maxBoxWidth; // kutu maksimum dış genişlik
  int contentWrapWidth; // satir sarmalama hedefi (içerik)
  int maxContentLines; // trim için
  int maxChars; // total karakter limiti (trim notu eklenir)
  int maxJsonLines; // json trim limiti
  LogLevel minLevel; // seviye filtresi
  Map<String, LogLevel> tagLevelOverrides; // tag -> level
  final List<PatternLevelOverride> _patternLevelOverrides;

  LogConfig({
    this.enableColors = true,
    this.showTimestamp = true,
    this.showLevelLabel = true,
    this.showStackTraceOnError = true,
    this.showStackTraceInline = false,
    this.forceLogInRelease = false,
    this.prettyJson = true,
    this.jsonSyntaxHighlight = true,
    this.trimLargeJson = true,
    this.horizontalPadding = 1,
    this.minBoxWidth = 46,
    this.maxBoxWidth = 120,
    this.contentWrapWidth = 100,
    this.maxContentLines = 400,
    this.maxChars = 40000,
    this.maxJsonLines = 400,
    this.minLevel = LogLevel.verbose,
    Map<String, LogLevel>? tagLevelOverrides,
    List<PatternLevelOverride>? patternLevelOverrides,
  }) : tagLevelOverrides = tagLevelOverrides ?? <String, LogLevel>{},
       _patternLevelOverrides = patternLevelOverrides != null
           ? List.of(patternLevelOverrides)
           : <PatternLevelOverride>[];

  LogConfig copyWith({
    bool? enableColors,
    bool? showTimestamp,
    bool? showLevelLabel,
    bool? showStackTraceOnError,
    bool? showStackTraceInline,
    bool? forceLogInRelease,
    bool? prettyJson,
    bool? jsonSyntaxHighlight,
    bool? trimLargeJson,
    int? horizontalPadding,
    int? minBoxWidth,
    int? maxBoxWidth,
    int? contentWrapWidth,
    int? maxContentLines,
    int? maxChars,
    int? maxJsonLines,
    LogLevel? minLevel,
    Map<String, LogLevel>? tagLevelOverrides,
  }) => LogConfig(
    enableColors: enableColors ?? this.enableColors,
    showTimestamp: showTimestamp ?? this.showTimestamp,
    showLevelLabel: showLevelLabel ?? this.showLevelLabel,
    showStackTraceOnError: showStackTraceOnError ?? this.showStackTraceOnError,
    showStackTraceInline: showStackTraceInline ?? this.showStackTraceInline,
    forceLogInRelease: forceLogInRelease ?? this.forceLogInRelease,
    prettyJson: prettyJson ?? this.prettyJson,
    jsonSyntaxHighlight: jsonSyntaxHighlight ?? this.jsonSyntaxHighlight,
    trimLargeJson: trimLargeJson ?? this.trimLargeJson,
    horizontalPadding: horizontalPadding ?? this.horizontalPadding,
    minBoxWidth: minBoxWidth ?? this.minBoxWidth,
    maxBoxWidth: maxBoxWidth ?? this.maxBoxWidth,
    contentWrapWidth: contentWrapWidth ?? this.contentWrapWidth,
    maxContentLines: maxContentLines ?? this.maxContentLines,
    maxChars: maxChars ?? this.maxChars,
    maxJsonLines: maxJsonLines ?? this.maxJsonLines,
    minLevel: minLevel ?? this.minLevel,
    tagLevelOverrides: tagLevelOverrides ?? this.tagLevelOverrides,
    // ÖNEMLİ: pattern listesi her copyWith'te kopyalanır (çoğaltma bug fix)
    patternLevelOverrides: List<PatternLevelOverride>.from(
      _patternLevelOverrides,
    ),
  );
}

/// Basit süre ölçer
class LogTimer {
  final Stopwatch _sw = Stopwatch()..start();
  final String? tag;
  final String? label;
  LogTimer({this.tag, this.label});
  void end([String? msg]) {
    _sw.stop();
    final dur = _sw.elapsed;
    Print.perf(
      '${label ?? 'TIMER'}: ${dur.inMilliseconds} ms${msg != null ? ' | $msg' : ''}',
      tag: tag,
    );
  }
}

/// Gelişmiş log aracı
abstract final class Print {
  // Option B defaults: inline stack trace in the boxed log, no external developer.log stackTrace
  static LogConfig config = LogConfig(
    showStackTraceOnError: false,
    showStackTraceInline: true,
  );

  /// Konfigürasyon güncelleme
  static void configure(LogConfig Function(LogConfig current) update) {
    config = update(config);
  }

  static void setMinLevel(LogLevel level) {
    config = config.copyWith(minLevel: level);
  }

  static void overrideTagLevel(String tag, LogLevel level) {
    final map = Map<String, LogLevel>.from(config.tagLevelOverrides);
    map[tag] = level;
    config = config.copyWith(tagLevelOverrides: map);
  }

  static void addPatternLevelOverride(RegExp pattern, LogLevel level) {
    config._patternLevelOverrides.add(PatternLevelOverride(pattern, level));
  }

  static LogTimer timer({String? tag, String? label}) =>
      LogTimer(tag: tag, label: label);

  // ANSI renkler
  static const _reset = '\u001b[0m';
  // _bold ve _dim kaldırıldı (lint temizliği)
  static const _colors = <LogLevel, String>{
    LogLevel.verbose: '\u001b[37m', // gri
    LogLevel.debug: '\u001b[36m', // cyan
    LogLevel.info: '\u001b[32m', // yeşil
    LogLevel.success: '\u001b[32;1m', // parlak yeşil
    LogLevel.data: '\u001b[38;5;45m', // açık mavi
    LogLevel.api: '\u001b[38;5;141m', // mor ton
    LogLevel.perf: '\u001b[38;5;214m', // turuncu
    LogLevel.warning: '\u001b[33m', // sarı
    LogLevel.error: '\u001b[31m', // kırmızı
    LogLevel.route: '\u001b[35m', // mor
    LogLevel.json: '\u001b[34m', // mavi
  };

  static const _icons = <LogLevel, String>{
    LogLevel.verbose: '⋯',
    LogLevel.debug: '🐛',
    LogLevel.info: '💡',
    LogLevel.success: '✅',
    LogLevel.data: '📦',
    LogLevel.api: '📡',
    LogLevel.perf: '⏱',
    LogLevel.warning: '⚠️',
    LogLevel.error: '🛑',
    LogLevel.route: '🚀',
    LogLevel.json: '🧾',
  };

  static const _defaultTags = <LogLevel, String>{
    LogLevel.verbose: 'verbose',
    LogLevel.debug: 'debug',
    LogLevel.info: 'info',
    LogLevel.success: 'success',
    LogLevel.data: 'data',
    LogLevel.api: 'api',
    LogLevel.perf: 'perf',
    LogLevel.warning: 'warning',
    LogLevel.error: 'error',
    LogLevel.route: 'routes',
    LogLevel.json: 'json',
  };

  /// Ana log metodumuz
  static void _log(LogLevel level, Object? raw, {String? tag, StackTrace? st}) {
    if (!kDebugMode && !config.forceLogInRelease) return;

    // Level eşik filtresi
    if (level.index < config.minLevel.index) return;

    // Tag override
    if (tag != null && config.tagLevelOverrides.containsKey(tag)) {
      level = config.tagLevelOverrides[tag]!;
    }

    Object? object = raw;

    // Pattern override (mesaj string ise)
    final rawStr = raw?.toString() ?? '';
    for (final p in config._patternLevelOverrides) {
      if (p.pattern.hasMatch(rawStr)) {
        level = p.level;
        break;
      }
    }

    // Otomatik JSON pretty
    if (raw is Map || raw is List) {
      object = config.prettyJson
          ? const JsonEncoder.withIndent('  ').convert(raw)
          : jsonEncode(raw);
    } else if (raw is String) {
      final trimmed = raw.trim();
      final isJsonCandidate =
          (trimmed.startsWith('{') && trimmed.endsWith('}')) ||
          (trimmed.startsWith('[') && trimmed.endsWith(']'));
      if (isJsonCandidate) {
        try {
          final decoded = jsonDecode(trimmed);
          if (decoded is Map || decoded is List) {
            object = config.prettyJson
                ? const JsonEncoder.withIndent('  ').convert(decoded)
                : jsonEncode(decoded);
            level = level == LogLevel.error ? level : LogLevel.json;
          }
        } catch (_) {}
      }
    }

    var text = object.toString();

    // Büyük içerik kısaltma (toplam karakter)
    if (text.length > config.maxChars) {
      text =
          '${text.substring(0, config.maxChars)}\n... (trimmed ${text.length - config.maxChars} chars)';
    }

    // JSON syntax highlight
    if (config.enableColors &&
        config.jsonSyntaxHighlight &&
        level == LogLevel.json) {
      text = _highlightJson(text);
    }

    // Satırları al
    var lines = text.replaceAll('\r', '').split('\n');

    // JSON satır trim
    if (config.trimLargeJson &&
        level == LogLevel.json &&
        lines.length > config.maxJsonLines) {
      final omitted = lines.length - config.maxJsonLines;
      lines = lines.take(config.maxJsonLines).toList()
        ..add('... ($omitted more json lines trimmed)');
    }

    // Genel satır trim
    if (lines.length > config.maxContentLines) {
      final omitted = lines.length - config.maxContentLines;
      lines = lines.take(config.maxContentLines).toList()
        ..add('... ($omitted lines trimmed)');
    }

    // İlk wrap (geniş config hedefi)
    lines = _wrapAll(lines, config.contentWrapWidth);

    final ts = config.showTimestamp ? _formatTime(DateTime.now()) : null;
    final label = config.showLevelLabel ? level.name.toUpperCase() : null;
    final icon = _icons[level];

    // Inline StackTrace
    List<String>? stLines;
    StackTrace? externalSt = st;
    if (level == LogLevel.error) {
      if (config.showStackTraceInline) {
        final trace = (st ?? StackTrace.current).toString().trim();
        stLines = trace.split('\n').take(25).toList();
      } else if (st == null && config.showStackTraceOnError) {
        externalSt = StackTrace.current;
      }
    }

    if (stLines != null && stLines.isNotEmpty) {
      lines.add('');
      lines.addAll(stLines);
    }

    String boxed;
    try {
      boxed = _boxify(
        lines,
        color: config.enableColors ? _colors[level] : null,
        icon: icon,
        label: label,
        timestamp: ts,
        level: level,
      );
    } catch (e, stBox) {
      // Fallback (kutuda render hatası olursa crash engelle)
      developer.log(
        '[${level.name}] ${lines.join(' ')}',
        name: tag ?? _defaultTags[level]!,
        error: e,
        stackTrace: stBox,
      );
      return;
    }

    // Tag'i her satıra ekle ki terminal aramalarında tüm kutu görünsün
    final finalTag = tag ?? _defaultTags[level]!;
    final tagPrefix = '[${finalTag.toUpperCase()}] ';

    // Her satıra tag prefix'i ekle
    final boxedLines = boxed.split('\n');
    final taggedLines = boxedLines.map((line) => '$tagPrefix$line').toList();
    final taggedMessage = taggedLines.join('\n');

    developer.log(taggedMessage, name: finalTag, stackTrace: externalSt);
  }

  static String _formatTime(DateTime dt) {
    final ms = dt.millisecond.toString().padLeft(3, '0');
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}.$ms';
  }

  static String _boxify(
    List<String> lines, {
    required LogLevel level,
    String? color,
    String? icon,
    String? label,
    String? timestamp,
  }) {
    // Trim trailing boş satırlar
    while (lines.isNotEmpty && lines.last.trim().isEmpty) {
      lines.removeLast();
    }
    final contentLines = lines.isEmpty ? ['(empty)'] : List<String>.from(lines);

    final metaPieces = <String>[];
    if (icon != null) metaPieces.add(icon);
    if (label != null) metaPieces.add(label);
    if (timestamp != null) metaPieces.add(timestamp);
    final rawHeaderMeta = metaPieces.join('  ');

    // Longest (geçici) - wrap sonrası tekrar değerlendirilecek
    final provisionalLongest =
        ([
          rawHeaderMeta,
          ...contentLines,
        ].map(_visibleLength).fold<int>(0, (p, c) => c > p ? c : p)) +
        (config.horizontalPadding * 2);
    final width = provisionalLongest.clamp(
      config.minBoxWidth,
      config.maxBoxWidth,
    );
    final pad = ' ' * config.horizontalPadding;
    final horizontal = '─' * width;

    final availableContentWidth = width - (config.horizontalPadding * 2);

    // Header wrap
    final headerLines = <String>[];
    if (rawHeaderMeta.isNotEmpty) {
      if (_visibleLength(rawHeaderMeta) > availableContentWidth) {
        headerLines.addAll(_wrapAdvanced(rawHeaderMeta, availableContentWidth));
      } else {
        headerLines.add(rawHeaderMeta);
      }
    }

    // İçerik satırlarını kutu genişliğine göre tekrar wrap et
    final adjustedContent = <String>[];
    for (final l in contentLines) {
      if (_visibleLength(l) > availableContentWidth) {
        adjustedContent.addAll(_wrapAdvanced(l, availableContentWidth));
      } else {
        adjustedContent.add(l);
      }
    }

    String makeLine(String text) {
      final visible = _visibleLength(text);
      final remaining = availableContentWidth - visible;
      return '│$pad$text${' ' * (remaining < 0 ? 0 : remaining)}$pad│';
    }

    final buffer = StringBuffer();
    final clr = color ?? '';
    final reset = color != null ? _reset : '';

    buffer.writeln('$clr┌$horizontal┐$reset');
    if (headerLines.isNotEmpty) {
      for (var i = 0; i < headerLines.length; i++) {
        buffer.writeln('$clr${makeLine(headerLines[i])}$reset');
      }
      if (adjustedContent.isNotEmpty) {
        buffer.writeln('$clr├${'─' * width}┤$reset');
      }
    }
    for (final line in adjustedContent) {
      buffer.writeln('$clr${makeLine(line)}$reset');
    }
    buffer.write('$clr└$horizontal┘$reset');
    return buffer.toString();
  }

  static List<String> _wrapAll(List<String> lines, int maxWidth) {
    final out = <String>[];
    for (final l in lines) {
      if (_visibleLength(l) <= maxWidth) {
        out.add(l);
      } else {
        out.addAll(_wrapAdvanced(l, maxWidth));
      }
    }
    return out;
  }

  static List<String> _wrapAdvanced(String text, int maxWidth) {
    if (maxWidth <= 4) return [text];
    final result = <String>[];
    var current = StringBuffer();
    int visibleLen = 0;
    final parts = text.split(' ');
    for (var part in parts) {
      final len = _visibleLength(part);
      // Token tek başına maxWidth'ten büyükse parça parça böl
      if (len > maxWidth) {
        if (current.isNotEmpty) {
          result.add(current.toString());
          current = StringBuffer();
          visibleLen = 0;
        }
        int start = 0;
        while (start < part.length) {
          final end = (start + maxWidth).clamp(0, part.length);
          result.add(part.substring(start, end));
          start = end;
        }
        continue;
      }
      if (visibleLen + len + (current.isNotEmpty ? 1 : 0) > maxWidth) {
        if (current.isNotEmpty) {
          result.add(current.toString());
          current = StringBuffer();
          visibleLen = 0;
        }
      }
      if (current.isNotEmpty) {
        current.write(' ');
        visibleLen += 1;
      }
      current.write(part);
      visibleLen += len;
    }
    if (current.isNotEmpty) result.add(current.toString());
    return result.isEmpty ? [text] : result;
  }

  static int _visibleLength(String text) =>
      text.replaceAll(RegExp(r'\x1B\[[0-9;]*[mK]'), '').length;

  static String _highlightJson(String input) {
    const keyColor = '\u001b[33m'; // sarı
    const stringColor = '\u001b[32m'; // yeşil
    const numberColor = '\u001b[36m'; // cyan
    const boolColor = '\u001b[35m'; // mor
    const nullColor = '\u001b[90m'; // gri
    String colorize(Match m) {
      if (m.group(1) != null) {
        // key
        return '$keyColor"${m.group(1)}"$_reset:';
      }
      if (m.group(2) != null) {
        // string
        return '$stringColor"${m.group(2)}"$_reset';
      }
      if (m.group(3) != null) {
        // number
        return '$numberColor${m.group(3)}$_reset';
      }
      if (m.group(4) != null) {
        // bool
        return '$boolColor${m.group(4)}$_reset';
      }
      if (m.group(5) != null) {
        // null
        return '$nullColor${m.group(5)}$_reset';
      }
      return m.group(0)!;
    }

    final pattern = RegExp(
      r'"([^"\\]*(?:\\.[^"\\]*)*)"\s*:|"([^"\\]*(?:\\.[^"\\]*)*)"|(\b-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?\b)|(\btrue\b|\bfalse\b)|(\bnull\b)',
    );
    return input.replaceAllMapped(pattern, colorize);
  }

  // --- Public API genişletildi ---
  static void log(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.debug, object, tag: tag, st: st);
  static void debug(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.debug, object, tag: tag, st: st);
  static void info(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.info, object, tag: tag, st: st);
  static void success(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.success, object, tag: tag, st: st);
  static void data(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.data, object, tag: tag, st: st);
  static void api(
    String method,
    String path, {
    String? tag,
    Object? query,
    Object? body,
    Object? status,
    Duration? duration,
  }) {
    final b = StringBuffer()..write('API ');
    b.write(method.toUpperCase());
    b.write(' ');
    b.write(path);
    if (query != null) b.write(' | query=${jsonEncode(query)}');
    if (body != null) b.write(' | body=${jsonEncode(body)}');
    if (status != null) b.write(' | status=$status');
    if (duration != null) b.write(' | ${duration.inMilliseconds}ms');
    _log(LogLevel.api, b.toString(), tag: tag ?? 'API');
  }

  static void perf(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.perf, object, tag: tag, st: st);
  static void warning(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.warning, object, tag: tag, st: st);
  static void error(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.error, object, tag: tag, st: st);
  static void routes(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.route, object, tag: tag, st: st);
  static void json(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.json, object, tag: tag, st: st);
  static void verbose(Object? object, {String? tag, StackTrace? st}) =>
      _log(LogLevel.verbose, object, tag: tag, st: st);
  static void exception(Object? error, {String? tag, StackTrace? st}) =>
      _log(LogLevel.error, error, tag: tag, st: st ?? StackTrace.current);
}
