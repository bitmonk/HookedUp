import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormInputField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const FormInputField({
    super.key,
    required this.labelText,
    required this.obscureText,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  State<FormInputField> createState() => _FormInputFieldState();
}

bool _isValid = true;

class _FormInputFieldState extends State<FormInputField> {
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide.none,
      // borderSide: BorderSide(
      //   color: _isValid ? Color(0xFFF5F5F5) : Colors.red,
      //   // width: 1,
      // ),
    );
    return TextFormField(
      validator: widget.validator,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }

        setState(() {
          _isValid = widget.validator?.call(value) == null;
        });
      },
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: const Color(0xFF212221),
          height: 0.2.h,
        ),
        // alignLabelWithHint: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 12.h,
        ),
      ),
    );
  }
}
