import 'package:chatface/Views/CallView/widgets/call_language_picker.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_colors.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Gender ve Country/Language dropdown'ları
/// Tasarım: Alt kısımda yan yana iki dropdown butonu — popup yukarı açılır
class VideoFilterBar extends HookWidget {
  const VideoFilterBar({
    super.key,
    required this.selectedGender,
    required this.selectedLanguage,
    required this.onGenderChanged,
    required this.onLanguageChanged,
  });

  final String? selectedGender;
  final String? selectedLanguage;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    final genderKey = useMemoized(() => GlobalKey());
    final languageKey = useMemoized(() => GlobalKey());

    final overlayEntry = useRef<OverlayEntry?>(null);
    final genderOpen = useState(false);
    final languageOpen = useState(false);

    void removeOverlay({bool resetOpenState = true}) {
      overlayEntry.value?.remove();
      overlayEntry.value = null;
      if (resetOpenState && context.mounted) {
        genderOpen.value = false;
        languageOpen.value = false;
      }
    }

    void showPopupAbove({required GlobalKey anchorKey, required Widget popup}) {
      removeOverlay();

      final renderBox =
          anchorKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) return;

      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;
      final bottomFromTop = screenHeight - position.dy + 8;

      overlayEntry.value = OverlayEntry(
        builder: (_) => Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: removeOverlay,
                behavior: HitTestBehavior.translucent,
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
            Positioned(left: position.dx, bottom: bottomFromTop, child: popup),
          ],
        ),
      );

      final overlay = Overlay.of(context);
      overlay.insert(overlayEntry.value!);
    }

    void toggleGender() {
      if (genderOpen.value) {
        removeOverlay();
        return;
      }
      genderOpen.value = true;
      languageOpen.value = false;
      showPopupAbove(
        anchorKey: genderKey,
        popup: _GenderPopup(
          selectedGender: selectedGender,
          onSelect: (value) {
            removeOverlay();
            onGenderChanged(value);
          },
        ),
      );
    }

    void toggleLanguage() {
      if (languageOpen.value) {
        removeOverlay();
        return;
      }
      languageOpen.value = true;
      genderOpen.value = false;
      showPopupAbove(
        anchorKey: languageKey,
        popup: _LanguagePopup(
          selectedLanguage: selectedLanguage,
          onSelect: (value) {
            removeOverlay();
            onLanguageChanged(value);
          },
        ),
      );
    }

    useEffect(() {
      return () {
        // Avoid updating hook state while the widget tree is being torn down.
        removeOverlay(resetOpenState: false);
      };
    }, const []);

    final selectedLanguageMeta = _callLanguageForCode(selectedLanguage);
    final countryFlag = _flagForLanguageCode(selectedLanguage);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _FilterChip(
            key: genderKey,
            iconAsset: AppIcons.gender,
            label: _genderLabel(context, selectedGender),
            isOpen: genderOpen.value,
            onTap: toggleGender,
          ),
          const SizedBox(width: 12),
          _FilterChip(
            key: languageKey,
            iconAsset: countryFlag,
            label: selectedLanguageMeta?.name ?? context.t.videoChat.country,
            isOpen: languageOpen.value,
            onTap: toggleLanguage,
          ),
        ],
      ),
    );
  }

  String _genderLabel(BuildContext context, String? gender) {
    switch (gender?.trim().toLowerCase()) {
      case 'male':
        return context.t.videoChat.male;
      case 'female':
        return context.t.videoChat.female;
      default:
        return context.t.editProfile.gender;
    }
  }

  CallLanguage? _callLanguageForCode(String? languageCode) {
    if (languageCode == null || languageCode.isEmpty) return null;
    for (final language in callLanguages) {
      if (language.code == languageCode.toLowerCase()) return language;
    }
    return null;
  }

  String _flagForLanguageCode(String? languageCode) {
    switch (languageCode?.toLowerCase()) {
      case 'tr':
        return AppFlags.turkey;
      case 'de':
        return AppFlags.german;
      case 'fr':
        return AppFlags.french;
      case 'es':
        return AppFlags.spanish;
      case 'ko':
        return AppFlags.korean;
      case 'it':
        return AppFlags.italian;
      case 'ja':
        return AppFlags.japanese;
      case 'ru':
        return AppFlags.russian;
      case 'pt':
        return AppFlags.portugal;
      case 'hi':
        return AppFlags.hindi;
      case 'zh':
        return AppFlags.china;
      case 'en':
      default:
        return AppFlags.english;
    }
  }
}

// ---------------------------------------------------------------------------
// _FilterChip
// ---------------------------------------------------------------------------

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    super.key,
    required this.iconAsset,
    required this.label,
    required this.isOpen,
    required this.onTap,
  });

  final String iconAsset;
  final String label;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isOpen
                ? Colors.white.withValues(alpha: 0.45)
                : Colors.white.withValues(alpha: 0.18),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(iconAsset, width: 16, height: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.rubik(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            AnimatedRotation(
              turns: isOpen ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white.withValues(alpha: 0.6),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _GenderPopup  — butonun üzerinde açılan küçük overlay
// ---------------------------------------------------------------------------

class _GenderPopup extends StatelessWidget {
  const _GenderPopup({required this.selectedGender, required this.onSelect});

  final String? selectedGender;
  final ValueChanged<String> onSelect;

  static const _genders = [('male', 'Male'), ('female', 'Female')];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _genders.map((g) {
          final isSelected = selectedGender?.toLowerCase() == g.$1;
          return GestureDetector(
            onTap: () => onSelect(g.$1),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      g.$2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isSelected ? AppColors.primary : Colors.white,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_rounded,
                      color: AppColors.primary,
                      size: 16,
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _LanguagePopup  — butonun üzerinde açılan scrollable overlay
// ---------------------------------------------------------------------------

class _LanguagePopup extends StatelessWidget {
  const _LanguagePopup({
    required this.selectedLanguage,
    required this.onSelect,
  });

  final String? selectedLanguage;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      constraints: const BoxConstraints(maxHeight: 260),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 6),
          shrinkWrap: true,
          itemCount: callLanguages.length,
          itemBuilder: (context, index) {
            final lang = callLanguages[index];
            final isSelected = selectedLanguage == lang.code;
            return GestureDetector(
              onTap: () => onSelect(lang.code),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 11,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        lang.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected ? AppColors.primary : Colors.white,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Icon(
                        Icons.check_rounded,
                        color: AppColors.primary,
                        size: 16,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
