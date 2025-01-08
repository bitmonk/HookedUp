import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/popup/closable_connection_sent_popup.dart';
import 'package:hooked_up/utils/colors.dart';

Future<dynamic> showSendNotePopup({
  required BuildContext context,
  required String title,
  String? content,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFFFFFFFC),
      // contentPadding: EdgeInsets.fromLTRB(26.w, 19.h, 32.w, 31.h),
      title: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Let them know why you’re connecting them! Share a quick message to explain the purpose of this introduction.',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 11.w,
                  ),
                  SizedBox(
                    height: 29.h,
                    width: 29.w,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/profile2.png'),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    'Sarah Smith',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xFF212221),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 36.w,
                  ),
                  SizedBox(
                    height: 29.h,
                    width: 29.w,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/profile2.png'),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    'Sarah Smith',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xFF212221),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                color: Color(0xFFFFFFFC),
                height: 116.h,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Add Note',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF212221),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
                    fillColor: const Color(0xF5F5F5F5),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: GreenButton(
                    text: 'SEND',
                    onPressed: () {
                      Navigator.pop(context);
                      showClosableConnectionSentPopup(
                          context: context,
                          title: 'Connection Sent Successfully.',
                          buttonText: 'OKAY',
                          onPressed: () {});
                    }),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Color(0xFF2B361C),
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
