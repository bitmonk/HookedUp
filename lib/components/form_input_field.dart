import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormInputField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final Function(String)? onChanged;
  const FormInputField({
    super.key,
    required this.labelText,
    required this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: const Color(0xFF212221),
        ), // Responsive label
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 18.h,
        ),
      ),
    );
  }
}
