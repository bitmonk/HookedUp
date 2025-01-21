import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/openseason/open_season_card.dart';
import 'package:hooked_up/components/openseason/request_sent_card.dart';
import 'package:hooked_up/utils/colors.dart';

class OpenSeason extends StatefulWidget {
  const OpenSeason({super.key});

  @override
  State<OpenSeason> createState() => _OpenSeasonState();
}

class _OpenSeasonState extends State<OpenSeason> {
  bool myTabIsClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 26.h),
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
                SizedBox(width: 12.w),
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
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          myTabIsClicked = false;
                        });
                      },
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
                              color: myTabIsClicked
                                  ? Color(0xFFF3FAFE)
                                  : AppColors.thickGreen,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          myTabIsClicked = true;
                        });
                      },
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
                              color: myTabIsClicked
                                  ? AppColors.thickGreen
                                  : Color(0xFFF3FAFE),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            // Wrap the column with an Expanded or Flexible widget to make the SingleChildScrollView scrollable
            Expanded(
              child: SingleChildScrollView(
                child: !myTabIsClicked
                    ? Column(
                        children: [
                          SizedBox(height: 30.h),
                          OpenSeasonCard(),
                          SizedBox(height: 12.h),
                          OpenSeasonCard(),
                          SizedBox(height: 12.h),
                          OpenSeasonCard(),
                          SizedBox(height: 12.h),
                          OpenSeasonCard(),
                          SizedBox(height: 12.h),
                          OpenSeasonCard(),
                          SizedBox(height: 12.h),
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Request Sent',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View all',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF606C38),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(width: 12.h),
                                RequestSentCard(),
                                SizedBox(width: 12.h),
                                RequestSentCard(),
                                SizedBox(width: 12.h),
                                RequestSentCard(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'My Events',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View all',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF606C38),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              OpenSeasonCard(
                                eventRequests: true,
                              ),
                              SizedBox(height: 12.h),
                              OpenSeasonCard(
                                eventRequests: true,
                              ),
                              SizedBox(height: 12.h),
                              OpenSeasonCard(
                                eventRequests: true,
                              ),
                              SizedBox(height: 12.h),
                              OpenSeasonCard(
                                eventRequests: true,
                              ),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
