import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/VideoView/video_view_logic.dart';
import 'package:chatface/Views/VideoView/widgets/video_character_swipe_deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VideoCharacterSwipeDeck', () {
    testWidgets(
      'dragging moves the front stage and reveals the preview stage',
      (tester) async {
        final presentations = <VideoCharacterSwipePresentation>[];

        await tester.pumpWidget(
          _buildHarness(
            previousCharacter: _persona('previous'),
            nextCharacter: _persona('next'),
            onPresentationChanged: presentations.add,
          ),
        );

        final gesture = await tester.startGesture(
          tester.getCenter(find.byKey(VideoCharacterSwipeDeck.gestureKey)),
        );
        await gesture.moveBy(const Offset(-80, 0));
        await tester.pump();

        final frontTransform = tester.widget<Transform>(
          find.byKey(VideoCharacterSwipeDeck.frontTransformKey),
        );
        final backOpacity = tester.widget<Opacity>(
          find.byKey(VideoCharacterSwipeDeck.backOpacityKey),
        );

        expect(frontTransform.transform.storage[12], lessThan(0));
        expect(backOpacity.opacity, greaterThan(0.22));
        expect(presentations.last.direction, equals(VideoSwipeDirection.left));

        await gesture.up();
      },
    );

    testWidgets('a short slow drag snaps back without committing', (
      tester,
    ) async {
      final committedDirections = <VideoSwipeDirection>[];

      await tester.pumpWidget(
        _buildHarness(
          previousCharacter: _persona('previous'),
          nextCharacter: _persona('next'),
          onCommitSwipe: committedDirections.add,
        ),
      );

      await tester.drag(
        find.byKey(VideoCharacterSwipeDeck.gestureKey),
        const Offset(-40, 0),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      final frontTransform = tester.widget<Transform>(
        find.byKey(VideoCharacterSwipeDeck.frontTransformKey),
      );

      expect(frontTransform.transform.storage[12].abs(), lessThan(1));
      expect(committedDirections, isEmpty);
    });

    testWidgets('a long drag commits the swipe direction on release', (
      tester,
    ) async {
      final committedDirections = <VideoSwipeDirection>[];

      await tester.pumpWidget(
        _buildHarness(
          previousCharacter: _persona('previous'),
          nextCharacter: _persona('next'),
          onCommitSwipe: committedDirections.add,
        ),
      );

      await tester.drag(
        find.byKey(VideoCharacterSwipeDeck.gestureKey),
        const Offset(-140, 0),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 260));

      expect(committedDirections, equals([VideoSwipeDirection.left]));
    });
  });
}

Widget _buildHarness({
  PersonaProfile? previousCharacter,
  PersonaProfile? nextCharacter,
  ValueChanged<VideoCharacterSwipePresentation>? onPresentationChanged,
  ValueChanged<VideoSwipeDirection>? onCommitSwipe,
}) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 320,
          height: 560,
          child: VideoCharacterSwipeDeck(
            currentCharacter: _persona('current'),
            previousCharacter: previousCharacter,
            nextCharacter: nextCharacter,
            isInteractionEnabled: true,
            onPresentationChanged: onPresentationChanged ?? (_) {},
            onCommitSwipe: (direction) async {
              onCommitSwipe?.call(direction);
            },
            stageBuilder: (context, character, isPreview) {
              return ColoredBox(
                color: isPreview ? Colors.blueGrey : Colors.black,
                child: Center(
                  child: Text(
                    character.id,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}

PersonaProfile _persona(String id) =>
    PersonaProfile.fallback(id: id, name: id, defaultLanguage: 'en');
