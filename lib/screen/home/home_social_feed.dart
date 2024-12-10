import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/home/feed_post.dart';
import 'package:hooked_up/screen/auth/login.dart';

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
              child: Builder(builder: (BuildContext context) {
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
              })),
          SizedBox(
            width: 24.w,
          ),
        ],
      ),
      drawer: Drawer(
        width: 385.w,
        backgroundColor: const Color(0xFF2B361C),
        child: Stack(
          children: [
            // Main content of the drawer
            ListView(
              padding: EdgeInsets.zero,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 74.0.h, left: 24.w),
                      child: Container(
                        height: 41.h,
                        width: 41.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9FA482).withOpacity(0.42),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 25.h,
                          color: const Color(0xFF2B361C),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.h),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        title: Text(
                          'Home',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(
                          'Forums',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(
                          'Link Connections',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(
                          'Settings',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Stacked logo positioned at the bottom left
            Positioned(
              bottom: 0.h, // Distance from the bottom of the drawer
              left: 0.w, // Distance from the left of the drawer
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icons/logo2.svg',
                    height: 213.h, // Adjust logo height
                    width: 206.w, // Adjust logo width
                  ),
                  SizedBox(width: 10.w), // Space between logo and button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Log Out',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFFFFFF).withOpacity(0.53),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FeedPost(),
      ),
      bottomNavigationBar: SizedBox(
        height: 75.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFFFFF),
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
      ),
    );
  }
}
