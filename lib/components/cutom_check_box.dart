import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final String label;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomCheckBox({
    super.key,
    required this.value,
    required this.groupValue,
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
              onChanged(value);
            },
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: groupValue == value ? selectedColor : unselectedColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                color: const Color(0xFFF5F5F5),
              ),
              child: groupValue == value
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
