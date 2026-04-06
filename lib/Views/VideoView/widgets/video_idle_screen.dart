import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Boş/Bitti ekranı — video görüşmesi bitmişken veya henüz başlamamışken
/// Tasarım: Siyah arka plan, ortada mesaj, swipe ikonu
class VideoIdleScreen extends StatelessWidget {
  const VideoIdleScreen({
    super.key,
    required this.onSwipeForNewChat,
  });

  final VoidCallback onSwipeForNewChat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Sağa swipe → yeni sohbet
        if (details.primaryVelocity != null && details.primaryVelocity! < -200) {
          onSwipeForNewChat();
        }
      },
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Mesaj
              Text(
                'The video call has ended.',
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Swipe for a new chat',
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              // Swipe ikonu
              SvgPicture.asset(
                AppIcons.swipe,
                width: 60,
                height: 60,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
