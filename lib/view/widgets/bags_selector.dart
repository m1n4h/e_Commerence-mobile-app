import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/app_textstyle.dart';

class BagSelector extends StatefulWidget {
  final Function(int) onSelected;

  const BagSelector({super.key, required this.onSelected});

  @override
  State<BagSelector> createState() => _BagSelectorState();
}

class _BagSelectorState extends State<BagSelector> {
  int selectedSize = 0;
  final List<String> sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: List.generate(
        sizes.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(
              sizes[index],
              style: AppTextStyle.withColor(
                AppTextStyle.bodySmall,
                selectedSize == index
                    ? Colors.white
                    : (isDark ? Colors.grey[300]! : Colors.grey[600]!),
              ),
            ),
            selected: selectedSize == index,
            selectedColor: Theme.of(context).primaryColor,
            backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onSelected: (bool selected) {
              setState(() {
                selectedSize = selected ? index : selectedSize;
              });
              widget.onSelected(selectedSize);
            },
          ),
        ),
      ),
    );
  }
}
