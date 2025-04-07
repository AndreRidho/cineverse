import 'package:cineverse/config/colors/colors.dart';
import 'package:flutter/material.dart';

class MyDropdown<Item, ItemId> extends StatelessWidget {
  final Item? value;
  final String hint;
  final List<Item> items;
  final String Function(Item) getLabel;
  final ValueChanged<Item?> onChanged;

  const MyDropdown({
    super.key,
    required this.value,
    required this.hint,
    required this.items,
    required this.getLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Item>(
      dropdownColor: navy,
      value: value,
      hint: Text(
        hint,
        style: const TextStyle(color: Colors.white),
      ),
      items: items.map((Item item) {
        return DropdownMenuItem<Item>(
          value: item,
          child: Text(
            getLabel(item),
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
