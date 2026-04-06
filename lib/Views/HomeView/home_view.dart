import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Views/CharacterDetailView/character_detail_arguments.dart';
import 'package:chatface/Views/HomeView/widgets/home_featured_swiper.dart';
import 'package:chatface/Views/HomeView/widgets/home_filter_sheet.dart';
import 'package:chatface/Views/HomeView/widgets/home_header.dart';
import 'package:chatface/Views/HomeView/widgets/home_more_section.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personasAsync = ref.watch(filteredPersonaListProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Positioned.fill(child: BlurredGradientBackground()),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(
                    onFilterTap: () => _openFilterSheet(context),
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
                        style: const TextStyle(color: Colors.white70),
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
        ],
      ),
    );
  }

  Future<void> _openFilterSheet(BuildContext context) async {
    await showModalBottomSheet<Map<String, dynamic>?>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const HomeFilterSheet(),
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
