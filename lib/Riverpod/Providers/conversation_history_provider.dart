import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final conversationHistoryProvider = FutureProvider<List<ConversationSummary>>((
  ref,
) async {
  final repo = ref.read(AllProviders.aiRepositoryProvider);
  return repo.fetchHistory();
});
