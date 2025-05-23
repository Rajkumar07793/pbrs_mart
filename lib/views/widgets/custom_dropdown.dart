import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items:
          items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: const TextStyle(fontSize: 12)),
                ),
              )
              .toList(),
      onChanged: onChanged,
      isExpanded: true,
      underline: Container(height: 0), // hide default underline
      style: const TextStyle(color: Colors.black),
      dropdownColor: Colors.white,
    );
  }
}
