import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Views/CharacterDetailView/character_detail_arguments.dart';
import 'package:chatface/Views/CharacterDetailView/widgets/character_action_buttons.dart';
import 'package:chatface/Views/CharacterDetailView/widgets/character_detail_app_bar.dart';
import 'package:chatface/Views/CharacterDetailView/widgets/character_hero_card.dart';
import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class CharacterDetailView extends HookConsumerWidget {
  const CharacterDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)?.settings.arguments as CharacterDetailArguments?;
    final personasAsync = ref.watch(personaListProvider);
    final offerings = useState<Offerings?>(null);
    final isFetchingOfferings = useState<bool>(false);

    final character = _resolveCharacter(
      personasAsync.asData?.value,
      args!.character,
    );
    final user = ref.watch(userProfileProvider);
    Future<void> fetchOfferings() async {
      if (isFetchingOfferings.value) return;
      isFetchingOfferings.value = true;
      try {
        final fetchedOfferings = await Purchases.getOfferings();
        if (!context.mounted) return;
        offerings.value = fetchedOfferings;
      } catch (_) {
        // Intentionally ignored: paywall can still be shown with default offerings.
      } finally {
        isFetchingOfferings.value = false;
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        fetchOfferings();
      });
      return null;
    }, const []);

    Future<void> handlePremiumBannerTap() async {
      if (offerings.value == null) {
        await fetchOfferings();
      }

      final paywallResult = await RevenueCatUI.presentPaywall(
        offering: offerings.value?.current,
      );

      if (paywallResult == PaywallResult.purchased) {
        await ref.read(userProfileProvider.notifier).refresh();
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Positioned.fill(child: BlurredGradientBackground()),
          user.when(
            data: (profile) {
              Print.info(
                'Building CharacterDetailView for character: ${character.name}, '
                'user is premium: ${profile!.user.isPremium}',
              );
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: kToolbarHeight),
                      CharacterDetailAppBar(
                        onBack: () => Navigator.of(context).pop(),
                        title: character.name,
                      ),
                      const SizedBox(height: 24),
                      Hero(
                        tag: 'character-${character.id}',
                        child: CharacterHeroCard(character: character),
                      ),
                      const SizedBox(height: 20),

                      CharacterPrimaryActionButton(
                        label: t.characters.characterDetails.videoCall,
                        iconPath: AppIcons.videoCall,
                        onPressed: () {
                          if (!profile.user.isPremium) {
                            handlePremiumBannerTap();
                            return;
                          }
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.main,
                            (route) => false,
                            arguments: <String, dynamic>{
                              'initialIndex': 1,
                              'initialVideoCharacter': character,
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: CharacterSecondaryActionButton(
                              label: t.characters.characterDetails.message,
                              iconPath: AppIcons.messageBubble,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ChatView(persona: character),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CharacterSecondaryActionButton(
                              label: t.characters.characterDetails.voiceCall,
                              iconPath: AppIcons.voiceCall,
                              onPressed: () {
                                if (!profile.user.isPremium) {
                                  handlePremiumBannerTap();
                                  return;
                                }
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.call,
                                  arguments: {'character': character},
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: kBottomNavigationBarHeight + 24),
                    ],
                  ),
                ),
              );
            },
            error: (e, st) => Text('Error: $e \n$st'),
            loading: () => CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

PersonaProfile _resolveCharacter(
  List<PersonaProfile>? personas,
  PersonaProfile fallback,
) {
  if (personas == null || personas.isEmpty) {
    return fallback;
  }

  for (final persona in personas) {
    if (persona.id == fallback.id) {
      return persona;
    }
  }

  return fallback;
}
