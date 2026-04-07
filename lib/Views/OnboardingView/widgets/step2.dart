import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class Step2 extends HookWidget {
  const Step2({
    super.key,
    this.bottomPadding = 0,
    this.onDateChanged,
    this.initialDate,
  });

  final double bottomPadding;
  final ValueChanged<DateTime>? onDateChanged;
  final DateTime? initialDate;

  static const _itemExtent = 54.0;

  /// Returns localized short month names for the given locale.
  static List<String> _localizedMonths(String locale) {
    return List.generate(12, (i) {
      return DateFormat('MMM', locale).format(DateTime(2000, i + 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    // Resolve locale from slang TranslationMetadata
    final locale = LocaleSettings.currentLocale.languageTag; // e.g. "tr", "en"

    final now = DateTime.now();
    final defaultDate = initialDate ?? DateTime(2000, 1, 1);

    final months = _localizedMonths(locale);
    final days = List.generate(31, (i) => i + 1);

    final minYear = now.year - 100;
    final maxYear = now.year - 18;
    // Descending: years[0] = maxYear (youngest allowed)
    final years = List.generate(maxYear - minYear + 1, (i) => maxYear - i);

    final selectedMonth = useState(defaultDate.month - 1);
    final selectedDay = useState(defaultDate.day - 1);
    final selectedYearIndex = useState(0);

    void notifyChange() {
      final month = selectedMonth.value + 1;
      final day = selectedDay.value + 1;
      final year = years[selectedYearIndex.value];
      final maxDay = DateUtils.getDaysInMonth(year, month);
      onDateChanged?.call(DateTime(year, month, day.clamp(1, maxDay)));
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              t.onboarding.step2.title,
              style: AppTextStyles.heading(
                30,
                FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              t.onboarding.step2.subtitle,
              style: AppTextStyles.body(
                14,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: _itemExtent * 5,
              child: Stack(
                children: [
                  // ── Wheel columns ─────────────────────────────────────────
                  Row(
                    children: [
                      // Month
                      Expanded(
                        flex: 3,
                        child: _WheelPicker(
                          itemCount: months.length,
                          itemExtent: _itemExtent,
                          initialIndex: selectedMonth.value,
                          selectedIndex: selectedMonth.value,
                          onSelectedItemChanged: (i) {
                            selectedMonth.value = i;
                            notifyChange();
                          },
                          itemBuilder: (ctx, i) => _WheelItem(
                            text: months[i],
                            distance: (i - selectedMonth.value).abs(),
                          ),
                        ),
                      ),
                      // Day
                      Expanded(
                        flex: 2,
                        child: _WheelPicker(
                          itemCount: days.length,
                          itemExtent: _itemExtent,
                          initialIndex: selectedDay.value,
                          selectedIndex: selectedDay.value,
                          onSelectedItemChanged: (i) {
                            selectedDay.value = i;
                            notifyChange();
                          },
                          itemBuilder: (ctx, i) => _WheelItem(
                            text: days[i].toString().padLeft(2, '0'),
                            distance: (i - selectedDay.value).abs(),
                          ),
                        ),
                      ),
                      // Year
                      Expanded(
                        flex: 3,
                        child: _WheelPicker(
                          itemCount: years.length,
                          itemExtent: _itemExtent,
                          initialIndex: selectedYearIndex.value,
                          selectedIndex: selectedYearIndex.value,
                          onSelectedItemChanged: (i) {
                            selectedYearIndex.value = i;
                            notifyChange();
                          },
                          itemBuilder: (ctx, i) => _WheelItem(
                            text: years[i].toString(),
                            distance: (i - selectedYearIndex.value).abs(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _WheelPicker extends StatefulWidget {
  const _WheelPicker({
    required this.itemCount,
    required this.itemExtent,
    required this.initialIndex,
    required this.selectedIndex,
    required this.itemBuilder,
    required this.onSelectedItemChanged,
  });

  final int itemCount;
  final double itemExtent;
  final int initialIndex;
  final int selectedIndex; // live value for rebuilds
  final Widget Function(BuildContext, int) itemBuilder;
  final ValueChanged<int> onSelectedItemChanged;

  @override
  State<_WheelPicker> createState() => _WheelPickerState();
}

class _WheelPickerState extends State<_WheelPicker> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      controller: _controller,
      itemExtent: widget.itemExtent,
      physics: const FixedExtentScrollPhysics(),
      perspective: 0.001,
      diameterRatio: 3.0,
      onSelectedItemChanged: widget.onSelectedItemChanged,
      childDelegate: ListWheelChildBuilderDelegate(
        builder: widget.itemBuilder,
        childCount: widget.itemCount,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _WheelItem extends StatelessWidget {
  const _WheelItem({required this.text, required this.distance});

  final String text;

  /// Distance from the currently selected index (0 = selected).
  final int distance;

  // Opacity curve: 0→1.0, 1→0.45, 2→0.20, 3+→0.08
  static const _opacities = [1.0, 0.45, 0.20, 0.08];

  // Font size curve: 0→24, 1→20, 2→17, 3+→15
  static const _sizes = [24.0, 20.0, 17.0, 15.0];

  // Font weight curve
  static const _weights = [
    FontWeight.w700,
    FontWeight.w500,
    FontWeight.w400,
    FontWeight.w300,
  ];

  @override
  Widget build(BuildContext context) {
    final idx = distance.clamp(0, 3);
    final opacity = _opacities[idx];
    final size = _sizes[idx];
    final weight = _weights[idx];

    return Center(
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 180),
        style: AppTextStyles.heading(
          size,
          weight,
          color: Colors.white.withValues(alpha: opacity),
        ),
        child: Text(text),
      ),
    );
  }
}
