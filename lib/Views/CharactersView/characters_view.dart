import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Views/CharacterDetailView/character_detail_arguments.dart';
import 'package:chatface/Views/CharactersView/widgets/characters_app_bar.dart';
import 'package:chatface/Views/HomeView/widgets/home_filter_sheet.dart';
import 'package:chatface/Views/shared/widgets/character_grid_card.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharactersView extends ConsumerWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Positioned.fill(child: BlurredGradientBackground()),
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverAppBar(
                  pinned: false,
                  floating: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  toolbarHeight: kToolbarHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CharactersAppBar(
                        onBack: () => Navigator.of(context).pop(),
                        onAction: () => _openFilterSheet(context),
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: _buildGridSliver(ref, t),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: kToolbarHeight + 24),
                sliver: SliverToBoxAdapter(child: Container()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridSliver(WidgetRef ref, TranslationsEn t) {
    final personasAsync = ref.watch(filteredPersonaListProvider);
    return personasAsync.when(
      loading: () => SliverToBoxAdapter(
        child: const Padding(
          padding: EdgeInsets.all(32),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              'Failed to load companions: $error',
              style: AppTextStyles.body(14, color: Colors.white70),
            ),
          ),
        ),
      ),
      data: (personas) {
        final characters = personas.toList(growable: false);
        if (characters.isEmpty) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Text(
                  'No companions available.',
                  style: AppTextStyles.body(14, color: Colors.white54),
                ),
              ),
            ),
          );
        }
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.63,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final character = characters[index];
            return CharacterGridCard(
              character: character,
              actionLabel: context.t.profile,
              subtitle: t.characters.placeholderSubtitle,
              onTap: () => _openCharacterDetail(context, character),
            );
          }, childCount: characters.length),
        );
      },
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
