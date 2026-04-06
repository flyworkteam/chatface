import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;
  const BottomNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onIndexChanged,
        backgroundColor: Colors.black,
        indicatorColor: Colors.transparent,

        overlayColor: WidgetStateProperty.all(Colors.transparent),

        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(AppIcons.home),
            selectedIcon: SvgPicture.asset(AppIcons.homeSelected),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AppIcons.video),
            selectedIcon: SvgPicture.asset(AppIcons.videoNavSelected),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AppIcons.chat),
            selectedIcon: SvgPicture.asset(AppIcons.chatSelected),
            label: '',
          ),
        ],
      ),
    );
  }
}
