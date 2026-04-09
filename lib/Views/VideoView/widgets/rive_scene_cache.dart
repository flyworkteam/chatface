import 'dart:async';

import 'package:rive/rive.dart';

abstract class RiveSceneHandle {
  FileLoader get fileLoader;
  bool get isReady;
  Future<void> warm();
}

class CachedRiveSceneHandle implements RiveSceneHandle {
  CachedRiveSceneHandle(this.path, {FileLoader? fileLoader})
    : _fileLoader = fileLoader ?? _buildFileLoader(path);

  final String path;
  final FileLoader _fileLoader;
  Future<void>? _warmFuture;

  @override
  FileLoader get fileLoader => _fileLoader;

  @override
  bool get isReady => _fileLoader.isFileAvailable;

  @override
  Future<void> warm() {
    final existing = _warmFuture;
    if (existing != null) {
      return existing;
    }

    final future = _fileLoader.file().then((_) {}).catchError((error) {
      _warmFuture = null;
      throw error;
    });
    _warmFuture = future;
    return future;
  }

  static FileLoader _buildFileLoader(String path) {
    if (path.startsWith('http')) {
      return FileLoader.fromUrl(path, riveFactory: Factory.flutter);
    }

    return FileLoader.fromAsset(path, riveFactory: Factory.flutter);
  }
}

typedef RiveSceneHandleFactory = RiveSceneHandle Function(String path);

class RiveSceneCache {
  RiveSceneCache({RiveSceneHandleFactory? handleFactory})
    : _handleFactory = handleFactory ?? ((path) => CachedRiveSceneHandle(path));

  final RiveSceneHandleFactory _handleFactory;
  final Map<String, RiveSceneHandle> _handles = <String, RiveSceneHandle>{};

  static final shared = RiveSceneCache();

  RiveSceneHandle? handleFor(String? path) {
    final normalizedPath = _normalizePath(path);
    if (normalizedPath == null) {
      return null;
    }

    return _handles.putIfAbsent(
      normalizedPath,
      () => _handleFactory(normalizedPath),
    );
  }

  Future<void> warm(String? path) async {
    final handle = handleFor(path);
    if (handle == null) {
      return;
    }

    try {
      await handle.warm();
    } catch (_) {}
  }

  void warmAll(Iterable<String?> paths) {
    for (final path in paths) {
      unawaited(warm(path));
    }
  }

  static String? _normalizePath(String? path) {
    final normalized = path?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }

    return normalized;
  }
}
