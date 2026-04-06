import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_colors.dart';
import 'package:chatface/theme/app_paddings.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

enum PolicyType { terms, privacy, cookies }

void showPolicySheet(BuildContext context, PolicyType type) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _PolicySheet(type: type),
  );
}

class _PolicySheet extends StatelessWidget {
  const _PolicySheet({required this.type});
  final PolicyType type;

  @override
  Widget build(BuildContext context) {
    final t = context.t.termOfService;

    final String title;
    final List<_PolicySection> sections;

    switch (type) {
      case PolicyType.privacy:
        final p = t.privacyPolicy;
        title = p.title;
        sections = [
          _PolicySection(body: p.intro),
          _PolicySection(title: p.section1Title, body: null),
          _PolicySection(title: p.section1sub1Title, body: p.section1sub1Body),
          _PolicySection(title: p.section1sub2Title, body: p.section1sub2Body),
          _PolicySection(title: p.section2Title, body: p.section2Body),
          _PolicySection(title: p.section3Title, body: p.section3Body),
          _PolicySection(title: p.section4Title, body: p.section4Body),
          _PolicySection(title: p.section5Title, body: p.section5Body),
          _PolicySection(title: p.section6Title, body: p.section6Body),
        ];
        break;

      case PolicyType.terms:
        final p = t.termsOfService;
        title = p.title;
        sections = [
          _PolicySection(body: p.intro),
          _PolicySection(isDisclaimer: true, body: p.disclaimer),
          _PolicySection(title: p.section1Title, body: p.section1Body),
          _PolicySection(title: p.section2Title, body: p.section2Body),
          _PolicySection(title: p.section3Title, body: p.section3Body),
          _PolicySection(title: p.section4Title, body: p.section4Body),
          _PolicySection(title: p.section5Title, body: p.section5Body),
          _PolicySection(title: p.section6Title, body: p.section6Body),
          _PolicySection(title: p.section7Title, body: p.section7Body),
          _PolicySection(title: p.section8Title, body: p.section8Body),
        ];
        break;

      case PolicyType.cookies:
        final p = t.cookiePolicy;
        title = p.title;
        sections = [
          _PolicySection(body: p.intro),
          _PolicySection(isDisclaimer: true, body: p.important),
          _PolicySection(title: p.section1Title, body: p.section1Body),
          _PolicySection(title: p.section2Title, body: p.section2Body),
          _PolicySection(title: p.section3Title, body: p.section3Body),
          _PolicySection(title: p.section4Title, body: p.section4Body),
          _PolicySection(title: p.section5Title, body: p.section5Body),
          _PolicySection(title: p.section6Title, body: p.section6Body),
        ];
        break;
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.96,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // ── Handle ──────────────────────────────────────────────────
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ── Header ──────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyles.heading(
                          20,
                          FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 24, thickness: 1, color: Colors.black12),

              // ── Scrollable Content ───────────────────────────────────────
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: AppPaddings.horizontalPage.copyWith(bottom: 48),
                  itemCount: sections.length,
                  itemBuilder: (_, i) => _SectionWidget(section: sections[i]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── Data model ─────────────────────────────────────────────────────────────

class _PolicySection {
  const _PolicySection({this.title, this.body, this.isDisclaimer = false});
  final String? title;
  final String? body;
  final bool isDisclaimer;
}

// ── Section widget ──────────────────────────────────────────────────────────

class _SectionWidget extends StatelessWidget {
  const _SectionWidget({required this.section});
  final _PolicySection section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (section.title != null) ...[
            Text(
              section.title!,
              style: AppTextStyles.heading(
                14,
                FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
          ],
          if (section.isDisclaimer && section.body != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.25),
                ),
              ),
              child: Text(
                section.body!,
                style: AppTextStyles.body(13, color: Colors.black87),
              ),
            )
          else if (section.body != null)
            Text(
              section.body!,
              style: AppTextStyles.body(13, color: Colors.black54),
            ),
        ],
      ),
    );
  }
}
