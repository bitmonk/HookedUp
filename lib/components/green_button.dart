import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GreenButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF606C38),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 37.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22.sp,
          color: const Color(0xFFF3FAFE),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
