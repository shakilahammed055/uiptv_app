import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;
  final String selectedCategory;
  final ValueChanged<bool> onSelected;

  CategoryChip({
    required this.category,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: ChoiceChip(
        label: Text(
          category,
          style: TextStyle(
            color:
                selectedCategory == category ? Colors.white : Color(0XFF969696),
            fontWeight: FontWeight.bold,
          ),
        ),
        selected: selectedCategory == category,
        onSelected: onSelected,
        selectedColor: Color(0XFFFF3440),
        backgroundColor: Color(0XFF221821),
      ),
    );
  }
}
