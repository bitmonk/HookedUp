import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/popup/show_note_to_join.dart';
import 'package:hooked_up/utils/colors.dart';

class EventRequestItem extends StatelessWidget {
  const EventRequestItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          SizedBox(
            height: 42.h,
            width: 42.w,
            child: CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/images/explainer/profile2.png'),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sarah Smith',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {
                        showNoteToJoinPopup(
                          context: context,
                          title: 'Note to Join',
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0xFF212221).withAlpha(60),
                            ),
                          ),
                        ),
                        child: Text(
                          'View Note',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xFF212221).withAlpha(60),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 27.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                          color: AppColors.heading,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            'ACCEPT',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF5F5F5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      height: 27.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'DENY',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
