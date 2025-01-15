import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/forum/reply_card.dart';
import 'package:hooked_up/utils/colors.dart';

class SingleForum extends StatefulWidget {
  const SingleForum({super.key});

  @override
  State<SingleForum> createState() => _SingleForumState();
}

class _SingleForumState extends State<SingleForum> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: const Color(0xFFFFFFFC),
        backgroundColor: const Color(0xFFFFFFFC),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF9FA482).withAlpha(42),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF2B361C),
              ),
            ),
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
                onPressed: () {},
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
                      Scaffold.of(context).openDrawer(); // Open the drawer
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 22.w, right: 25.w, top: 30.h),
              child: Column(
                children: [
                  // Parent container that adjusts based on its children
                  Container(
                    width: 383.w,
                    // height: screenHeight -
                    //     AppBar().preferredSize.height -
                    //     MediaQuery.of(context).padding.top -
                    //     60.h, // Subtracting appBar height and padding
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 5,
                          color: Color(0xFFF5F5F5),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Content of the forum goes here
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 3,
                                color: Color(0xFFF5F5F5),
                              ),
                              bottom: BorderSide(
                                width: 3,
                                color: Color(0xFFF5F5F5),
                              ),
                              top: BorderSide(
                                width: 3,
                                color: Color(0xFFF5F5F5),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(22.w, 9.h, 17.w, 22.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 31.h,
                                          width: 31.w,
                                          child: CircleAvatar(
                                            backgroundImage: const AssetImage(
                                                'assets/images/explainer/profile2.png'),
                                          ),
                                        ),
                                        SizedBox(width: 13.w),
                                        Text(
                                          ' Sarah Smith',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        Container(
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.greenButton,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          'Category',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color(0xFF000000).withAlpha(37),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '2/03/2024',
                                          style: TextStyle(
                                            fontSize: 9.sp,
                                            color: AppColors.fadedText
                                                .withAlpha(60),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Text(
                                  'Forum Title',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                  "Ipsum dolor sit amet, consectetur adipiscig elit, sed do eiusmod tempor incididunt ut labore et dolore? \n \n omnis iste natus error sit voluptatem accusantium doloremque laudantium \n Totam rem aperiam, eaque!",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 81.h,
                                      width: 101.w,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        child: Image.asset(
                                          'assets/images/main/fishing_pic.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    SizedBox(
                                      height: 81.h,
                                      width: 101.w,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        child: Image.asset(
                                          'assets/images/explainer/profile.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.only(left: 23.w),
                          child: Text(
                            'Replies (233)',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2B361C).withAlpha(56),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        // Make this container expandable with ScrollView
                        Column(
                          children: [
                            ReplyCard(),
                            SizedBox(height: 12.h),
                            ReplyCard(),
                            SizedBox(height: 12.h),
                            ReplyCard(),
                            SizedBox(height: 12.h),
                            ReplyCard(),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  // color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        'assets/images/explainer/profile.png',
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      width: 298.w,
                      height: 58.h,
                      child: FormInputField(
                          labelText: 'Reply now ...', obscureText: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
