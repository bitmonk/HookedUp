import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/home/feed_post.dart';

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
      //Drawer -->
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      // Feed Page Start -->
      body: const SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FeedPost(),
      ),
      // Feed Page End ***
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
