import 'package:chatface/Views/VideoView/widgets/ai_character_display.dart';
import 'package:chatface/Views/VideoView/widgets/rive_scene_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rive/rive.dart';

void main() {
  testWidgets('does not show a spinner while a rive scene is still loading', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AICharacterDisplay(
            imagePath: 'https://example.com/avatar.png',
            isNetworkImage: true,
            riveAssetPath: 'scene.riv',
            riveSceneHandle: _FakeRiveSceneHandle(isReady: true),
            riveWidgetFactory:
                (context, riveSceneHandle, onLoaded, stateBuilder) {
                  return stateBuilder(context, RiveLoading());
                },
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(Image), findsOneWidget);
  });
}

class _FakeRiveSceneHandle implements RiveSceneHandle {
  _FakeRiveSceneHandle({required this.isReady});

  @override
  final bool isReady;

  @override
  FileLoader get fileLoader => throw UnimplementedError();

  @override
  Future<void> warm() async {}
}
