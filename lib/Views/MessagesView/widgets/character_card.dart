import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CharacterCard extends StatelessWidget {
  final PersonaProfile character;
  const CharacterCard({super.key, required this.character});

  static const List<List<Color>> _accentPalettes = [
    [Color(0xFF95A8C6), Color(0xFFC8A5BB)],
    [Color(0xFF9AB7C9), Color(0xFFD1B3A4)],
    [Color(0xFF8FB5AF), Color(0xFFBCD1B0)],
    [Color(0xFF9FA2CC), Color(0xFFD2AFC8)],
    [Color(0xFFB3A3D1), Color(0xFFC6C0E1)],
    [Color(0xFF8FAECF), Color(0xFFB8C6D9)],
  ];

  List<Color> _accentFor(PersonaProfile persona) {
    final seed =
        '${persona.id.toLowerCase()}-${persona.name.toLowerCase()}-${persona.defaultLanguage.toLowerCase()}';
    final index = seed.hashCode.abs() % _accentPalettes.length;
    return _accentPalettes[index];
  }

  @override
  Widget build(BuildContext context) {
    final accent = _accentFor(character);
    final firstName = character.name.trim().split(' ').first;
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: accent,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: CustomCachedNetworkImage(
              imageUrl: character.displayImageUrl,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ChatView(persona: character)),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.44),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            firstName,
                            style: AppTextStyles.body(
                              14,
                              color: Colors.white,
                              weight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            context.t.chat.message,
                            style: AppTextStyles.body(
                              12,
                              weight: FontWeight.w300,
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      AppIcons.sendMessage,
                      width: 22,
                      height: 22,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
