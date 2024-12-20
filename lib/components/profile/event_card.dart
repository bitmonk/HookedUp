import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118.h,
      width: 383.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.green,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              top: 15.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 57.h,
                  width: 57.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      'assets/images/explainer/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event Title",
                ),
                Text(
                  'Event Location',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFF212221).withAlpha(60),
                  ),
                ),
                Text(
                  'Event Location',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFF212221).withAlpha(60),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
