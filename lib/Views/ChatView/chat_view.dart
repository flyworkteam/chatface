import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Models/ai_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Riverpod/Providers/chat_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/Riverpod/Providers/tts_playback_provider.dart';
import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import 'widgets/chat_app_bar.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/input_section.dart';
import 'widgets/locked_input_bar.dart';
import 'widgets/typing_indicator.dart';

class ChatView extends HookConsumerWidget {
  const ChatView({
    super.key,
    required this.persona,
    this.sessionId,
    this.sessionMode,
    this.sessionLanguage,
  });

  final PersonaProfile persona;
  final String? sessionId;
  final String? sessionMode;
  final String? sessionLanguage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final user = ref.watch(userProfileProvider).requireValue?.user;
    final showMediaPicker = useState(false);
    final isUploading = useState(false);
    final chatState = ref.watch(chatControllerProvider);
    final chatNotifier = ref.read(chatControllerProvider.notifier);
    final ttsState = ref.watch(ttsPlaybackProvider);
    final personasAsync = ref.watch(personaListProvider);
    final chatStarted = useState(false);
    Print.info(chatState.isTyping, tag: 'ChatView - isTyping');
    final offerings = useState<Offerings?>(null);
    final isFetchingOfferings = useState<bool>(false);
    if (!chatStarted.value && personasAsync.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (personasAsync.hasError) {
      return Scaffold(
        body: Center(
          child: Text(
            'Failed to load companion: ${personasAsync.error}',
            style: AppTextStyles.body(14, color: Colors.white70),
          ),
        ),
      );
    }

    final personas = personasAsync.asData?.value;
    final resolvedPersona = personas?.firstWhere(
      (p) => p.id == persona.id,
      orElse: () => persona,
    );
    final activePersona = chatState.persona ?? resolvedPersona ?? persona;

    void sendMessage() {
      final text = textController.text.trim();
      if (text.isEmpty) return;
      chatNotifier.sendUserMessage(text: text);
      textController.clear();
      showMediaPicker.value = false;
    }

    Future<void> handlePickAttachment(ImageSource source) async {
      final messenger = ScaffoldMessenger.of(context);
      final translations = context.t;
      try {
        isUploading.value = true;
        final attachment = await ref
            .read(AllProviders.attachmentUploadServiceProvider)
            .pickAndUpload(source);
        if (attachment != null) {
          chatNotifier.sendUserMessage(attachments: [attachment]);
        }
      } catch (error) {
        final message = error.toString().contains('media_permission_denied')
            ? translations.chat.mediaPermissionDenied
            : translations.chat.photoUploadFailed;
        messenger.showSnackBar(SnackBar(content: Text(message)));
      } finally {
        isUploading.value = false;
        showMediaPicker.value = false;
      }
    }

    useEffect(() {
      if (chatStarted.value) return null;
      if (resolvedPersona == null) return null;

      chatStarted.value = true;
      Future.microtask(() {
        final chatController = ref.read(chatControllerProvider.notifier);
        if (sessionId != null &&
            sessionMode != null &&
            sessionLanguage != null) {
          chatController.attachSession(
            AiSession(
              id: sessionId!,
              personaId: resolvedPersona.id,
              languageCode: sessionLanguage!,
              mode: sessionMode!,
              persona: resolvedPersona,
            ),
            persona: resolvedPersona,
          );
          return;
        }
        chatController.startChat(resolvedPersona);
      });
      return null;
    }, [resolvedPersona, persona.id, sessionId, sessionMode, sessionLanguage]);
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
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BlurredGradientBackground(),

          SafeArea(
            child: Column(
              children: [
                ChatAppBar(
                  characterName: activePersona.name,
                  characterImageUrl: activePersona.displayImagePath,
                  onCallTap: () {
                    !user!.isPremium
                        ? handlePremiumBannerTap()
                        : Navigator.pushNamed(
                            context,
                            AppRoutes.call,
                            arguments: {'character': activePersona},
                          );
                  },
                  onVideoCallTap: () {
                    !user!.isPremium
                        ? handlePremiumBannerTap()
                        : Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.main,
                            (route) => false,
                            arguments: <String, dynamic>{
                              'initialIndex': 1,
                              'initialVideoCharacter': activePersona,
                            },
                          );
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => showMediaPicker.value = false,
                    child: Stack(
                      children: [
                        PagedListView<int?, AiMessage>.separated(
                          state: chatState.pagingState,
                          fetchNextPage: chatNotifier.fetchNextPage,
                          reverse: true,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          builderDelegate: PagedChildBuilderDelegate<AiMessage>(
                            itemBuilder: (context, message, index) {
                              final isListening = ttsState.isPlaying(
                                message.id,
                              );
                              return ChatBubble(
                                message: message,
                                isListening: isListening,
                                onListen:
                                    message.role == 'assistant' &&
                                        message.isPersisted &&
                                        !message.isStreaming &&
                                        !message.isMarker
                                    ? () => chatNotifier.requestTts(message.id)
                                    : null,
                              );
                            },
                            firstPageProgressIndicatorBuilder: (_) =>
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            newPageProgressIndicatorBuilder: (_) =>
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            noItemsFoundIndicatorBuilder: (_) => Center(
                              child: Text(
                                context.t.chat.noMessagesSubtitle,
                                style: AppTextStyles.body(
                                  14,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (_, _) => const SizedBox(height: 8),
                        ),
                        if (chatState.isTyping)
                          const Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: TypingIndicator(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                // ── Bottom area ──
                if (!user!.isPremium)
                  const LockedInputBar()
                else
                  InputSection(
                    controller: textController,
                    showMediaPicker: showMediaPicker,
                    onSend: sendMessage,
                    onPickAttachment: handlePickAttachment,
                    isUploadingAttachment: isUploading.value,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
