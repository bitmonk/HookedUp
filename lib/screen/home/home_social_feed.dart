import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/home/feed_post.dart';
import 'package:hooked_up/screen/auth/login.dart';
import 'package:hooked_up/screen/chat/chat_home.dart';
import 'package:hooked_up/screen/create_post/create_post_home.dart';
import 'package:hooked_up/screen/profile/my_profile.dart';
import 'package:hooked_up/screen/season/open_season.dart';

class HomeSocialFeed extends StatefulWidget {
  const HomeSocialFeed({super.key});

  @override
  State<HomeSocialFeed> createState() => _SocialFeedState();
}

class _SocialFeedState extends State<HomeSocialFeed> {
  int _currentIndex = 0;

  List<Widget> body = const [
    FeedPost(),
    OpenSeason(),
    CreatePostHome(),
    ChatHome(),
    MyProfile(),
  ];

  BottomNavigationBarItem _buildNavItem(String iconPath, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: _currentIndex == index
              ? const Color(0xFFD7D9C9)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(9.w),
        child: SvgPicture.asset(
          iconPath,
          height: 32.h,
          width: 32.w,
        ),
      ),
      label: '',
    );
  }

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
      drawer: Drawer(
        width: 385.w,
        backgroundColor: const Color(0xFF2B361C),
        child: Stack(
          children: [
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
                          color: const Color(0xFF9FA482).withValues(alpha: 0.6),
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
            Positioned(
              bottom: 0.h,
              left: 0.w,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icons/logo2.svg',
                    height: 213.h,
                    width: 206.w,
                  ),
                  SizedBox(width: 10.w),
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
                        color: const Color(0xFFFFFFFF).withValues(alpha: 0.53),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFFFFF),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            _buildNavItem('assets/images/icons/home_icon.svg', 0),
            _buildNavItem('assets/images/icons/calendar.svg', 1),
            _buildNavItem('assets/images/icons/add_post.svg', 2),
            _buildNavItem('assets/images/icons/chat.svg', 3),
            _buildNavItem('assets/images/icons/my_profile.svg', 4),
          ],
        ),
      ),
    );
  }
}
