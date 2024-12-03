import 'package:flutter/material.dart';

class CustomCheckBoxMultiple extends StatelessWidget {
  final String value;
  final bool isChecked; // Instead of groupValue, use isChecked
  final ValueChanged<bool> onChanged; // Now takes a bool for isChecked
  final String label;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomCheckBoxMultiple({
    super.key,
    required this.value,
    required this.isChecked, // Determines if the checkbox is selected
    required this.onChanged,
    required this.label,
    this.size = 48.0,
    this.selectedColor = const Color(0xFF606C38),
    this.unselectedColor = const Color(0xFFF5F5F5),
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(label),
          ),
          GestureDetector(
            onTap: () {
              onChanged(!isChecked); // Toggle the checkbox state
            },
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: isChecked ? selectedColor : unselectedColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                color: isChecked
                    ? selectedColor.withOpacity(0.1)
                    : const Color(0xFFF5F5F5),
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: size * 0.5,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
