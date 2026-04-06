import 'package:flutter/material.dart';

class CharactersFilterBar extends StatelessWidget {
  const CharactersFilterBar({
    super.key,
    required this.filters,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> filters;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: [
        for (var i = 0; i < filters.length; i++)
          GestureDetector(
            onTap: () => onSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: selectedIndex == i
                    ? Colors.white24
                    : Colors.white.withValues(alpha: 0.06),
                border: Border.all(
                  color: selectedIndex == i ? Colors.white : Colors.white24,
                ),
              ),
              child: Text(
                filters[i],
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
