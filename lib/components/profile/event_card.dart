import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.0.w, right: 25.w),
      child: Container(
        // height: 118.h,
        width: 383.w,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Color(0xFFF5F5F5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9.w),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Event Title",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                'Event Location',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFF212221).withAlpha(60),
                                ),
                              ),
                              Text(
                                'Category',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFF212221).withAlpha(60),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '2/03/2024',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFF212221).withAlpha(60),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Divider(
                color: Color(0xFFFFFFFC),
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 19.w, bottom: 9.h, right: 19.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Hosted by',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF212221).withAlpha(60),
                        ),
                      ),
                      TextSpan(
                        text: ' Sarah Smith',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2B361C),
                        ),
                      ),
                    ]),
                  ),
                  SvgPicture.asset(
                    'assets/images/icons/three_dots.svg',
                    colorFilter:
                        ColorFilter.mode(Color(0xFFD9D9D9), BlendMode.srcIn),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
