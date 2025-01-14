import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/openseason/open_season_card.dart';
import 'package:hooked_up/utils/colors.dart';

class OpenSeason extends StatefulWidget {
  const OpenSeason({super.key});

  @override
  State<OpenSeason> createState() => _OpenSeasonState();
}

class _OpenSeasonState extends State<OpenSeason> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 26.h,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48.h,
                    child: FormInputField(
                      labelText: 'Search',
                      obscureText: false,
                    ),
                  ),
                ),
                SizedBox(width: 12.w), // Add spacing between widgets
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD7D9C9),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 33.h,
                      width: 173.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD7D9C9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'ALL EVENTS',
                          style: TextStyle(
                            color: AppColors.thickGreen,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      height: 33.h,
                      width: 173.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD7D9C9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'MY EVENTS',
                          style: TextStyle(
                            color: Color(0xFFF3FAFE),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            OpenSeasonCard(),
          ],
        ),
      ),
    );
  }
}
