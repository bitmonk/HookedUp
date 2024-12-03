import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final String label;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.size = 48.0,
    this.selectedColor = const Color(0xFF606C38),
    this.unselectedColor = Colors.grey,
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5F5F5),
              ),
              child: groupValue == value
                  ? Icon(
                      Icons.circle,
                      size: size * 0.4,
                      color:
                          groupValue == value ? selectedColor : unselectedColor,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
