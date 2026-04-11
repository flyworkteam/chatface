import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'character_card.dart';

class FollowCarousel extends HookConsumerWidget {
  const FollowCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(viewportFraction: 0.46);
    final personasAsync = ref.watch(followedPersonaListProvider);

    final characters = personasAsync.maybeWhen(
      data: (personas) => personas.toList(),
      orElse: () => const <PersonaProfile>[],
    );

    if (characters.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 190,
      child: PageView.builder(
        controller: pageController,
        padEnds: false,
        physics: const BouncingScrollPhysics(),
        itemCount: characters.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.only(left: i == 0 ? 20 : 12, right: 12),
            child: CharacterCard(character: characters[i]),
          );
        },
      ),
    );
  }
}
