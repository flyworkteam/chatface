import 'package:chatface/theme/app_text_styles.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({
    super.key,
    required this.selectedCountry,
    this.onChanged,
  });

  static final List<Country> _countries = (() {
    final countries = CountryService().getAll();
    final seenCodes = <String>{};
    return countries
        .where((c) => seenCodes.add(c.countryCode))
        .toList(growable: false);
  })();

  static List<Country> get allCountries => _countries;

  /// Current selected country code (ISO alpha-2).
  final String selectedCountry;

  /// Called when a new country is picked.
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final currentCode = selectedCountry.trim().toUpperCase();
    final selected = _countries.firstWhere(
      (country) =>
          country.countryCode == (currentCode.isEmpty ? 'TR' : currentCode),
      orElse: () => _countries.firstWhere(
        (country) => country.countryCode == 'TR',
        orElse: () => _countries.first,
      ),
    );

    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected.countryCode,
          isExpanded: true,
          menuMaxHeight: 360,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white70,
          ),
          style: AppTextStyles.body(
            14,
            weight: FontWeight.bold,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
          dropdownColor: const Color(0xFF171721),
          selectedItemBuilder: (context) {
            return _countries.map((country) {
              final label = country.getTranslatedName(context) ?? country.name;
              return Row(
                children: [
                  Text(country.flagEmoji, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Text(
                    label,
                    style: AppTextStyles.body(
                      14,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }).toList();
          },
          items: _countries.map((country) {
            final label = country.getTranslatedName(context) ?? country.name;
            return DropdownMenuItem<String>(
              value: country.countryCode,
              child: Row(
                children: [
                  Text(country.flagEmoji, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body(
                        14,
                        weight: country.countryCode == selected.countryCode
                            ? FontWeight.w700
                            : FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value == null) return;
            onChanged?.call(value);
          },
        ),
      ),
    );
  }
}
