import 'package:ecommerce_app/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int selectedIndex = 0;

  final categories = ['All', 'Men', 'Women', 'Girls'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ChoiceChip(
              label: Text(
                categories[index],
                style: AppTextStyle.withColor(
                  AppTextStyle.bodySmall,
                  selectedIndex == index
                      ? Colors.white
                      : (isDark ? Colors.grey[300]! : Colors.grey[600]!),
                ),
              ),
              selected: selectedIndex == index,
              onSelected: (selected) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedColor: Theme.of(context).primaryColor,
              backgroundColor:
                  isDark ? Colors.grey[800] : Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: selectedIndex == index ? 2 : 0,
              pressElevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
