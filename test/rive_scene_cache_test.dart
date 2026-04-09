import 'package:chatface/Views/VideoView/widgets/rive_scene_cache.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rive/rive.dart';

void main() {
  group('RiveSceneCache', () {
    test('reuses the same scene handle for repeated paths', () {
      final cache = RiveSceneCache(
        handleFactory: (path) => _FakeRiveSceneHandle(path),
      );

      final first = cache.handleFor('scene.riv');
      final second = cache.handleFor('scene.riv');

      expect(identical(first, second), isTrue);
    });

    test('warms a cached scene only once', () async {
      late _FakeRiveSceneHandle handle;
      final cache = RiveSceneCache(
        handleFactory: (path) {
          handle = _FakeRiveSceneHandle(path);
          return handle;
        },
      );

      await cache.warm('scene.riv');
      await cache.warm('scene.riv');

      expect(handle.warmCalls, 1);
      expect(handle.isReady, isTrue);
    });
  });
}

class _FakeRiveSceneHandle implements RiveSceneHandle {
  _FakeRiveSceneHandle(this.path);

  final String path;
  int warmCalls = 0;
  bool _isReady = false;
  Future<void>? _warmFuture;

  @override
  FileLoader get fileLoader =>
      FileLoader.fromAsset('unused.riv', riveFactory: Factory.flutter);

  @override
  bool get isReady => _isReady;

  @override
  Future<void> warm() {
    final existing = _warmFuture;
    if (existing != null) {
      return existing;
    }

    final future = Future<void>(() {
      warmCalls += 1;
      _isReady = true;
    });
    _warmFuture = future;
    return future;
  }
}
