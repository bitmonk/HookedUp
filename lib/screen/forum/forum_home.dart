import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/forum/forum_event_card.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/components/popup/report_closable_popup.dart';
import 'package:hooked_up/screen/forum/create_forum.dart';
import 'package:hooked_up/screen/home/activity_feed.dart';
import 'package:hooked_up/utils/colors.dart';

class ForumHome extends StatefulWidget {
  const ForumHome({super.key});

  @override
  State<ForumHome> createState() => _ForumHomeState();
}

class _ForumHomeState extends State<ForumHome> {
  bool myTabIsClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: const Color(0xFFFFFFFC),
        backgroundColor: const Color(0xFFFFFFFC),
        automaticallyImplyLeading: false,
        title: Text(
          'Forum',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFD88F48),
          ),
        ),
        actions: [
          SizedBox(
            height: 48.h,
            width: 48.h,
            child: CircleAvatar(
              backgroundColor: const Color(0xFFD7D9C9),
              child: IconButton(
                iconSize: 22,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityFeed(),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/icons/notification.svg',
                  height: 22.h,
                  width: 21.w,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          SizedBox(
            height: 48.h,
            width: 48.h,
            child: Builder(
              builder: (BuildContext context) {
                return CircleAvatar(
                  backgroundColor: const Color(0xFFD7D9C9),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/icons/hamburger.svg',
                      height: 18.h,
                      width: 23.w,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 24.w),
        ],
      ),
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => CreateForum());
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
            SizedBox(
              height: 12.h,
            ),
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
                            'ALL FORUMS',
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
                            'MY FORUMS',
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
            Expanded(
              child: SingleChildScrollView(
                child: !myTabIsClicked
                    ? Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          ForumEventCard(
                            myEventOptions: false,
                            onTap: () {
                              ShowReportBottomSheet(context);
                            },
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          ForumEventCard(
                            myEventOptions: true,
                            onTap: () {
                              ShowEditBottomSheet(context);
                            },
                          ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> ShowEditBottomSheet(BuildContext context) {
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
                onTap: () {},
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

  Future<dynamic> ShowReportBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxHeight: 430.h,
        maxWidth: double.infinity,
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(),
          child: Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFFFFFC),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 21.0.h, right: 24.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Color(0xFF2B361C),
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      SvgPicture.asset('assets/images/icons/report.svg'),
                      SizedBox(
                        width: 17.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          showClosableReportPopup(
                              context: context,
                              title: 'Confirm Report',
                              content:
                                  'Are you sure you want to report this user? This action will notify our team for review. Please provide details.',
                              buttonText: 'SUBMIT',
                              onPressed: () {});
                        },
                        child: Text(
                          'Report',
                          style: TextStyle(
                            color: const Color(0xFF000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
