import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Büyük dairesel avatar + isim + durum metni
/// Tasarım: Beyaz borderli dairesel avatar, altında isim ve "Calling..." veya timer
class CallAvatar extends StatelessWidget {
  const CallAvatar({
    super.key,
    required this.avatarImagePath,
    required this.name,
    required this.statusText,
    this.avatarSize = 180,
    this.isNetworkImage = false,
  });

  final String avatarImagePath;
  final String name;
  final String statusText;
  final double avatarSize;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Dairesel avatar - beyaz border
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipOval(
            child: isNetworkImage
                ? Image.network(
                    avatarImagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        _placeholderAvatar(),
                  )
                : Image.asset(
                    avatarImagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _placeholderAvatar(),
                  ),
          ),
        ),
        const SizedBox(height: 20),
        // İsim
        Text(
          name,
          style: GoogleFonts.rubik(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        // Durum (Calling... veya 00:10)
        Text(
          statusText,
          style: GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _placeholderAvatar() {
    return Container(
      color: Colors.grey.shade800,
      child: const Icon(Icons.person, size: 80, color: Colors.white54),
    );
  }
}
