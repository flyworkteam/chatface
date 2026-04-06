import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Views/CharacterDetailView/character_detail_arguments.dart';
import 'package:chatface/Views/CharactersView/widgets/characters_app_bar.dart';
import 'package:chatface/Views/HomeView/widgets/home_filter_sheet.dart';
import 'package:chatface/Views/shared/widgets/character_grid_card.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharactersView extends ConsumerWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t;
    final personasAsync = ref.watch(filteredPersonaListProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Positioned.fill(child: BlurredGradientBackground()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharactersAppBar(
                    onBack: () => Navigator.of(context).pop(),
                    onAction: () => _openFilterSheet(context),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: personasAsync.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(
                        child: Text(
                          'Failed to load companions: $error',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                      data: (personas) {
                        final characters = personas.toList(growable: false);
                        if (characters.isEmpty) {
                          return const Center(
                            child: Text(
                              'No companions available.',
                              style: TextStyle(color: Colors.white54),
                            ),
                          );
                        }
                        return GridView.builder(
                          padding: const EdgeInsets.only(bottom: 12),
                          itemCount: characters.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 0.63,
                              ),
                          itemBuilder: (context, index) {
                            final character = characters[index];
                            return CharacterGridCard(
                              character: character,
                              actionLabel: context.t.profile,
                              subtitle: t.characters.placeholderSubtitle,
                              onTap: () =>
                                  _openCharacterDetail(context, character),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
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

  Future<void> _openFilterSheet(BuildContext context) async {
    await showModalBottomSheet<Map<String, dynamic>?>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const HomeFilterSheet(),
    );
  }
}
