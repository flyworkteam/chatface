import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/HomeView/home_view.dart';
import 'package:chatface/Views/MainView/widgets/bottom_nav_bar_widget.dart';
import 'package:chatface/Views/MessagesView/messages_view.dart';
import 'package:chatface/Views/VideoView/video_view.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/custom_overlay.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainView extends HookWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final initialIndex = args?['initialIndex'] as int? ?? 0;
    final initialVideoCharacter =
        args?['initialVideoCharacter'] as PersonaProfile?;

    final currentIndex = useState(initialIndex);

    final lastBackPress = useState<DateTime?>(null);

    final pages = [
      const HomeView(),
      VideoView(initialCharacter: initialVideoCharacter),
      const MessagesView(),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final now = DateTime.now();
        final backButtonHasBeenPressedBefore =
            lastBackPress.value != null &&
            now.difference(lastBackPress.value!) < const Duration(seconds: 2);

        if (backButtonHasBeenPressedBefore) {
          SystemNavigator.pop();
          return;
        }

        lastBackPress.value = now;
        CustomOverlay.show(
          context,
          message: context.t.pressBackAgainToExit,
          icon: AppIcons.warning,
          type: OverlayType.info,
        );
      },
      child: Scaffold(
        body: pages[currentIndex.value],
        extendBody: true,
        bottomNavigationBar: BottomNavBarWidget(
          currentIndex: currentIndex.value,
          onIndexChanged: (index) {
            currentIndex.value = index;
          },
        ),
      ),
    );
  }
}
