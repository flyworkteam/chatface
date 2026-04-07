import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CharacterMetaPanel extends StatelessWidget {
  const CharacterMetaPanel({super.key, required this.character});

  final PersonaProfile character;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final infoItems = [
      _MetaInfo(
        label: t.editProfile.gender,
        value: (character.gender ?? '').toLowerCase() == 'male'
            ? t.onboarding.step3.male
            : t.onboarding.step3.female,
      ),
      _MetaInfo(
        label: t.editProfile.languagePreferences,
        value: character.defaultLanguage.toUpperCase(),
      ),
      _MetaInfo(label: t.videoChat.country, value: character.displayLocation()),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: infoItems
          .map(
            (item) => Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: AppTextStyles.body(
                      12,
                      weight: FontWeight.w600,
                      letterSpacing: 0.4 / 12,
                      height: 12 * 1.25,
                      color: Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.value,
                    style: AppTextStyles.body(14, color: Colors.white),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _MetaInfo {
  const _MetaInfo({required this.label, required this.value});
  final String label;
  final String value;
}
