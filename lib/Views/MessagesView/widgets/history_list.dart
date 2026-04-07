import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/conversation_history_provider.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'history_tile.dart';
import 'models.dart';

class HistoryList extends HookConsumerWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personasAsync = ref.watch(personaListProvider);
    final historyAsync = ref.watch(conversationHistoryProvider);

    return historyAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Failed to load history: $error',
          style: AppTextStyles.body(14, color: Colors.white70),
        ),
      ),
      data: (items) {
        if (items.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.t.chat.noMessages,
                    style: AppTextStyles.body(20, color: Colors.white54),
                  ),
                  Text(
                    context.t.chat.noMessagesSubtitle,
                    style: AppTextStyles.body(14, color: Colors.white54),
                  ),
                ],
              ),
            ),
          );
        }
        final personas =
            personasAsync.asData?.value ?? const <PersonaProfile>[];
        final historyItems = items
            .map(
              (summary) => HistoryItem(
                character: _toPersona(
                  summary.personaId ?? '',
                  summary.personaName,
                  personas,
                ),
                previewText: _previewLabel(context, summary),
                previewType: summary.previewType,
                updatedAt: summary.updatedAt,
                sessionId: summary.sessionId,
                lastConversationType: summary.lastConversationType,
                sessionMode: summary.sessionMode,
                sessionLanguage: summary.sessionLanguage,
              ),
            )
            .toList();

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: historyItems.length,
          separatorBuilder: (context, _) => SvgPicture.asset(AppIcons.divider),
          itemBuilder: (context, index) =>
              HistoryTile(item: historyItems[index]),
        );
      },
    );
  }

  String _previewLabel(BuildContext context, ConversationSummary summary) {
    switch (summary.previewType) {
      case 'photo':
        return context.t.chat.photo;
      case 'call_marker':
        if (summary.lastConversationType == 'video_call') {
          return context.t.chat.videoCallEnded;
        }
        return context.t.chat.voiceCallEnded;
      default:
        return summary.previewText;
    }
  }

  PersonaProfile _toPersona(
    String personaId,
    String fallbackName,
    List<PersonaProfile> personas,
  ) {
    PersonaProfile? persona;
    for (final candidate in personas) {
      if (candidate.id == personaId) {
        persona = candidate;
        break;
      }
    }
    if (persona != null) {
      return persona;
    }

    return PersonaProfile.fallback(id: personaId, name: fallbackName);
  }
}
