import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormInputField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  const FormInputField({
    super.key,
    required this.labelText,
    required this.obscureText,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.validator,
    this.focusNode,
  });

  @override
  State<FormInputField> createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  bool _isValid = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        final error = widget.validator?.call(value);
        if (error != null) {
          setState(() {
            _isValid = false; // Set invalid state if there's an error
          });
        } else {
          setState(() {
            _isValid = true; // Set valid state if there's no error
          });
        }
        return error;
      },
      // validator: widget.validator,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: widget.controller,
      obscureText: widget.obscureText,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        labelText: widget.labelText,
        fillColor: Color(0xFFF5F5F5),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: _isValid ? Colors.black54 : Colors.red,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 15.h,
        ),
      ),
    );
  }
}
