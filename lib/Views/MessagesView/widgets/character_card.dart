import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CharacterCard extends StatelessWidget {
  final PersonaProfile character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: character.isNetworkImage
                    ? NetworkImage(character.displayImagePath)
                    : AssetImage(character.displayImagePath) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            left: 12,
            right: 10,
            bottom: 12,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ChatView(persona: character)),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(20),
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
                            character.name,
                            style: AppTextStyles.body(
                              16,
                              color: Colors.white,
                              weight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            context.t.chat.message,
                            style: AppTextStyles.body(
                              12,
                              color: Colors.white.withValues(alpha: 12),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SvgPicture.asset(
                      AppIcons.sendMessage,
                      width: 25,
                      height: 30,
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
