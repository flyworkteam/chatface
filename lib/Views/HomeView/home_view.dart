import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Views/CharacterDetailView/character_detail_arguments.dart';
import 'package:chatface/Views/HomeView/widgets/home_featured_swiper.dart';
import 'package:chatface/Views/HomeView/widgets/home_filter_sheet.dart';
import 'package:chatface/Views/HomeView/widgets/home_header.dart';
import 'package:chatface/Views/HomeView/widgets/home_more_section.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  static const double _bottomNavBarHeight = 80;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personasAsync = ref.watch(filteredPersonaListProvider);
    final isFilterSheetOpen = useState(false);
    final navigationClearance =
        _bottomNavBarHeight + MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Positioned.fill(child: BlurredGradientBackground()),
          if (isFilterSheetOpen.value)
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => isFilterSheetOpen.value = false,
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, 0, 24, navigationClearance + 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(
                    onFilterTap: () => isFilterSheetOpen.value = true,
                    onNotificationsTap: () =>
                        Navigator.pushNamed(context, AppRoutes.notifications),
                  ),
                  const SizedBox(height: 28),
                  personasAsync.when(
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    error: (error, stack) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Failed to load companions: $error',
                        style: AppTextStyles.body(16, color: Colors.white70),
                      ),
                    ),
                    data: (personas) {
                      final featured = personas.take(3).toList();
                      final others = personas.skip(3).take(4).toList();
                      Print.debug(
                        'Featured personas: ${featured.map((p) => p.name).join(', ')}',
                      );
                      Print.debug(
                        'Other personas: ${others.map((p) => p.name).join(', ')}',
                      );
                      return Column(
                        children: [
                          HomeFeaturedSwiper(
                            characters: featured,
                            onTapCharacter: (character) =>
                                _openCharacterDetail(context, character),
                          ),
                          const SizedBox(height: 32),
                          HomeMoreSection(
                            characters: others,
                            onSeeAll: () => Navigator.pushNamed(
                              context,
                              AppRoutes.characters,
                            ),
                            onCharacterTap: (character) =>
                                _openCharacterDetail(context, character),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            left: 0,
            right: 0,
            bottom: isFilterSheetOpen.value ? navigationClearance : -800,
            child: IgnorePointer(
              ignoring: !isFilterSheetOpen.value,
              child: HomeFilterSheet(
                onClose: () => isFilterSheetOpen.value = false,
                bottomPadding: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openCharacterDetail(BuildContext context, PersonaProfile character) {
    Navigator.pushNamed(
      context,
      AppRoutes.characterDetail,
      arguments: CharacterDetailArguments(character: character),
    );
  }
}
