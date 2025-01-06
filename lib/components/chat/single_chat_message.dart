import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleChatMessage extends StatelessWidget {
  final String message;
  const SingleChatMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 23.h, right: 12.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Image.asset(
                'assets/images/explainer/profile.png',
                width: 27,
                height: 27,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        19, 12, 56, 12), // increased right padding
                    child: Text(
                      message,
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
