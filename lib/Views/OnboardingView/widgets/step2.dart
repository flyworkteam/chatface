import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    // Initial date: Jan 1, 2000
    final now = DateTime.now();
    final defaultDate = initialDate ?? DateTime(2000, 1, 1);

    // Month names
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    // Day range 1-31
    final days = List.generate(31, (i) => i + 1);

    // Year range: [now.year - 100] to [now.year - 18]
    final minYear = now.year - 100;
    final maxYear = now.year - 18;
    final years = List.generate(maxYear - minYear + 1, (i) => maxYear - i);

    final selectedMonth = useState(defaultDate.month - 1); // 0-indexed
    final selectedDay = useState(defaultDate.day - 1);
    final selectedYearIndex = useState(
      0,
    ); // index in years list (years[0] = maxYear)

    final monthController = useScrollController();
    final dayController = useScrollController();
    final yearController = useScrollController();

    void notifyChange() {
      final month = selectedMonth.value + 1;
      final day = selectedDay.value + 1;
      final year = years[selectedYearIndex.value];
      // Clamp day to valid range
      final maxDay = DateUtils.getDaysInMonth(year, month);
      final clampedDay = day.clamp(1, maxDay);
      onDateChanged?.call(DateTime(year, month, clampedDay));
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
                  // Center highlight line
                  Positioned(
                    top: _itemExtent * 2,
                    left: 0,
                    right: 0,
                    height: _itemExtent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // Month picker
                      Expanded(
                        flex: 3,
                        child: _WheelPicker(
                          itemCount: months.length,
                          itemExtent: _itemExtent,
                          initialIndex: selectedMonth.value,
                          scrollController: monthController,
                          onSelectedItemChanged: (i) {
                            selectedMonth.value = i;
                            notifyChange();
                          },
                          itemBuilder: (ctx, i) => _WheelItem(
                            text: months[i],
                            isSelected: selectedMonth.value == i,
                          ),
                        ),
                      ),
                      // Day picker
                      Expanded(
                        flex: 2,
                        child: _WheelPicker(
                          itemCount: days.length,
                          itemExtent: _itemExtent,
                          initialIndex: selectedDay.value,
                          scrollController: dayController,
                          onSelectedItemChanged: (i) {
                            selectedDay.value = i;
                            notifyChange();
                          },
                          itemBuilder: (ctx, i) => _WheelItem(
                            text: days[i].toString().padLeft(2, '0'),
                            isSelected: selectedDay.value == i,
                          ),
                        ),
                      ),
                      // Year picker
                      Expanded(
                        flex: 3,
                        child: _WheelPicker(
                          itemCount: years.length,
                          itemExtent: _itemExtent,
                          initialIndex: selectedYearIndex.value,
                          scrollController: yearController,
                          onSelectedItemChanged: (i) {
                            selectedYearIndex.value = i;
                            notifyChange();
                          },
                          itemBuilder: (ctx, i) => _WheelItem(
                            text: years[i].toString(),
                            isSelected: selectedYearIndex.value == i,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Top gradient fade
                  // Positioned(
                  //   top: 0,
                  //   left: 0,
                  //   right: 0,
                  //   height: _itemExtent * 1.8,
                  //   child: IgnorePointer(
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         gradient: LinearGradient(
                  //           begin: Alignment.topCenter,
                  //           end: Alignment.bottomCenter,
                  //           colors: [
                  //             Colors.black.withValues(alpha: 0.85),
                  //             Colors.transparent,
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // // Bottom gradient fade
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   height: _itemExtent * 1.8,
                  //   child: IgnorePointer(
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         gradient: LinearGradient(
                  //           begin: Alignment.bottomCenter,
                  //           end: Alignment.topCenter,
                  //           colors: [
                  //             Colors.black.withValues(alpha: 0.85),
                  //             Colors.transparent,
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WheelPicker extends StatefulWidget {
  const _WheelPicker({
    required this.itemCount,
    required this.itemExtent,
    required this.initialIndex,
    required this.itemBuilder,
    required this.onSelectedItemChanged,
    required this.scrollController,
  });

  final int itemCount;
  final double itemExtent;
  final int initialIndex;
  final Widget Function(BuildContext, int) itemBuilder;
  final ValueChanged<int> onSelectedItemChanged;
  final ScrollController scrollController;

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
      perspective: 0.003,
      diameterRatio: 1.6,
      onSelectedItemChanged: widget.onSelectedItemChanged,
      childDelegate: ListWheelChildBuilderDelegate(
        builder: widget.itemBuilder,
        childCount: widget.itemCount,
      ),
    );
  }
}

class _WheelItem extends StatelessWidget {
  const _WheelItem({required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 150),
        style: isSelected
            ? AppTextStyles.heading(24, FontWeight.w700, color: Colors.white)
            : AppTextStyles.body(
                18,
                color: Colors.white.withValues(alpha: 0.28),
              ),
        child: Text(text),
      ),
    );
  }
}
