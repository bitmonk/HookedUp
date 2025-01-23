import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/openseason/open_season_card.dart';
import 'package:hooked_up/components/openseason/request_sent_card.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/components/popup/report_closable_popup.dart';
import 'package:hooked_up/screen/season/create_season_event.dart';
import 'package:hooked_up/screen/season/request_page.dart';
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => CreateSeasonEvent());
                  },
                  child: Container(
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
                          OpenSeasonCard(
                            onThreeDotTap: () => showReportBottomSheet(context),
                          ),
                          SizedBox(height: 30.h),
                          OpenSeasonCard(
                            onThreeDotTap: () => showReportBottomSheet(context),
                          ),
                          SizedBox(height: 30.h),
                          OpenSeasonCard(
                            onThreeDotTap: () => showReportBottomSheet(context),
                          ),
                          SizedBox(height: 30.h),
                          OpenSeasonCard(
                            onThreeDotTap: () => showReportBottomSheet(context),
                          ),
                          SizedBox(height: 30.h),
                          OpenSeasonCard(
                            onThreeDotTap: () => showReportBottomSheet(context),
                          ),
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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RequestPage(),
                                      ),
                                    );
                                  },
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
                                hideButton: true,
                                onThreeDotTap: () =>
                                    showEditBottomSheet(context),
                              ),
                              SizedBox(height: 12.h),
                              OpenSeasonCard(
                                eventRequests: true,
                                hideButton: true,
                                onThreeDotTap: () =>
                                    showEditBottomSheet(context),
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

  Future<dynamic> showReportBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Color(0xFFFFFFFC),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 33.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w, top: 8.h),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFF9FA482).withValues(alpha: 0.42),
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
              SizedBox(height: 12.h),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 25.w),
                leading: SvgPicture.asset(
                  'assets/images/icons/report.svg',
                  width: 25.w,
                ),
                title: Text(
                  'Report',
                  style: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  showClosableReportPopup(
                      context: context,
                      title: 'Confirm Report',
                      content:
                          'Are you sure you want to report this user? This action will notify our team for review. Please provide details.',
                      buttonText: 'SUBMIT',
                      onPressed: () {});
                },
              ),
              // SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  Get.back();
                  showClosablePopup(
                      context: context,
                      title: 'Delete Event?',
                      buttonText: 'YES',
                      content: 'Are you sure you want to delete this event?',
                      onPressed: () {
                        Get.back();
                      });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/delete.svg',
                        height: 28.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> showEditBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Color(0xFFFFFFFC),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 33.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w, top: 8.h),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFF9FA482).withValues(alpha: 0.42),
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
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => CreateSeasonEvent());
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/edit.svg',
                        height: 24.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  showClosablePopup(
                      context: context,
                      title: 'Delete Forum?',
                      buttonText: 'YES',
                      content: 'Are you sure you want to delete this forum?',
                      onPressed: () {});
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/delete.svg',
                        height: 28.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        );
      },
    );
  }
}
