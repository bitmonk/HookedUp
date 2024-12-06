import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSocialFeed extends StatefulWidget {
  const HomeSocialFeed({super.key});

  @override
  State<HomeSocialFeed> createState() => _SocialFeedState();
}

class _SocialFeedState extends State<HomeSocialFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFC),
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
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
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/icons/notification.svg',
                  height: 22.h,
                  width: 21.w,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          SizedBox(
            height: 48.h,
            width: 48.h,
            child: CircleAvatar(
              backgroundColor: const Color(0xFFD7D9C9),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/icons/hamburger.svg',
                  height: 18.h,
                  width: 23.w,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
        ],
      ),
      // Feed Page Start -->
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.green,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 661.h,
              width: double.infinity,
              color: Colors.yellow,
              child: Column(
                children: [
                  // title heading ->
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 35.h,
                          width: 35.h,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/explainer/fishing.png'),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'j.williams',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'Location, location',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color:
                                      const Color(0xFF212221).withOpacity(0.6)),
                            )
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                              'assets/images/icons/three_dots.svg',
                              height: 5.h,
                              width: 19.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 430.h,
                    width: double.infinity,
                    color: Colors.green,
                    child: Image.asset(
                      'assets/images/main/fishing_pic.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 25.h,
                              width: 24.h,
                              child: SvgPicture.asset(
                                'assets/images/icons/heart.svg',
                                height: 25, // Set specific height if needed
                                width: 24,
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            SizedBox(
                              height: 25.h,
                              width: 24.h,
                              child: SvgPicture.asset(
                                'assets/images/icons/comment.svg',
                                height: 25, // Set specific height if needed
                                width: 24,
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            SizedBox(
                              height: 25.h,
                              width: 24.h,
                              child: SvgPicture.asset(
                                'assets/images/icons/share.svg',
                                height: 25, // Set specific height if needed
                                width: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // Feed Page End ***
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFFFFF),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/icons/home_icon.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/icons/calendar.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/icons/add_post.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/icons/chat.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/icons/my_profile.svg'),
            label: '',
          ),
        ],
      ),
    );
  }
}
