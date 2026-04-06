import 'package:chatface/Riverpod/Providers/persona_provider.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/follow_carousel.dart';
import 'widgets/history_list.dart';
import 'widgets/page_header.dart';
import 'widgets/section_title.dart';

class MessagesView extends ConsumerWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followedPersonasAsync = ref.watch(followedPersonaListProvider);
    final hasFollowedPersonas = followedPersonasAsync.maybeWhen(
      data: (personas) => personas.isNotEmpty,
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BlurredGradientBackground(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MessagesPageHeader(),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 4, bottom: 4),
                  child: Text(
                    context.t.chat.message,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        if (hasFollowedPersonas) ...[
                          SectionTitle(title: context.t.videoChat.follow),
                          SizedBox(height: 12),
                          FollowCarousel(),
                          SizedBox(height: 24),
                        ],
                        SectionTitle(title: context.t.chat.history),
                        SizedBox(height: 8),
                        HistoryList(),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
