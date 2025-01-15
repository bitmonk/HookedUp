import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/forum/forum_event_card.dart';
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
                          ),
                          SizedBox(height: 12.h),
                          ForumEventCard(
                            myEventOptions: false,
                          ),
                          SizedBox(height: 12.h),
                          ForumEventCard(
                            myEventOptions: false,
                          ),
                          SizedBox(height: 12.h),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          ForumEventCard(
                            myEventOptions: true,
                          ),
                          SizedBox(height: 12.h),
                          ForumEventCard(
                            myEventOptions: true,
                          ),
                          SizedBox(height: 12.h),
                          ForumEventCard(
                            myEventOptions: true,
                          ),
                          SizedBox(height: 12.h),
                          ForumEventCard(
                            myEventOptions: true,
                          ),
                          SizedBox(height: 12.h),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
