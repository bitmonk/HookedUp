import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenSeasonCard extends StatelessWidget {
  const OpenSeasonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385.w,
      height: 207.h,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 15.h, 14.w, 8.h),
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Morning Fishing Trip - Join Me!',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Hey everyone! I'll be heading out on the boat this Saturday morning for some fishing. Planning to hit the water around sunrise and see what we can catch. \n just a relaxed day on the water with ..",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'Event Location',
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: Color(0xFF212221).withAlpha(60),
                      ),
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
