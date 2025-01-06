import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SentChatMessage extends StatelessWidget {
  final String message;
  const SentChatMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 322.w,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFEAF7FF),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        19, 12, 56, 12), // increased right padding
                    child: Text(
                      message,
                      style: TextStyle(color: Color(0xFF000000)),
                    ),
                  ),
                ),
                Positioned(
                  right: 18.w,
                  bottom: 12.h,
                  child: Text(
                    '12:38',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
