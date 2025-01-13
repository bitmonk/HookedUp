import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';

class InviteBox extends StatelessWidget {
  final String title;
  final String inputFieldTitle;
  final String buttonTitle;
  final VoidCallback onPressed;

  const InviteBox({
    super.key,
    required this.title,
    required this.inputFieldTitle,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 249.h,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.green,
        border: Border.all(
          width: 1,
          color: Color(0xFF9FA482),
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(18.w, 18.h, 21.w, 31.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFD88F48),
              ),
            ),
            SizedBox(
              height: 23,
            ),
            FormInputField(labelText: inputFieldTitle, obscureText: false),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              width: double.infinity,
              child: GreenButton(
                text: buttonTitle,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
