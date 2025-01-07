import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/home/feed_post.dart';
import 'package:hooked_up/components/home/profile_connected.dart';
import 'package:hooked_up/components/popup/add_bucket_item_list.dart';
import 'package:hooked_up/components/profile/bucket_list_item.dart';
import 'package:hooked_up/components/profile/event_card.dart';
import 'package:hooked_up/model/dummy_data.dart';
import 'package:hooked_up/screen/chat/chat_home.dart';
import 'package:hooked_up/screen/create_post/create_post_home.dart';
import 'package:hooked_up/screen/home/activity_feed.dart';
import 'package:hooked_up/screen/profile/my_connections.dart';
import 'package:hooked_up/screen/profile/my_profile.dart';
import 'package:hooked_up/screen/profile/saved_posts.dart';
import 'package:hooked_up/screen/season/open_season.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int _selectedIndex = 0;
  bool _connected = true;

  final Color _selectedColor = const Color(0xFF9FA482);
  final Color _unselectedColor = const Color(0xFFD9D9D9);
  int _currentIndex = 0;

  List<Widget> body = const [
    FeedPost(),
    OpenSeason(),
    SizedBox(),
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

  void _showAddPostBottomSheet() {
    showModalBottomSheet(
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
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create a Post',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFD88F48),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 33.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFF2B361C),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreatePostHome(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/main/camera.svg',
                        height: 24.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Camera',
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
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/main/gallery.svg',
                        height: 28.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Photo Gallery',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFC),
      appBar: AppBar(
        surfaceTintColor: const Color(0xFFFFFFFC),
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
      body: Padding(
        padding: EdgeInsets.only(top: 12.0.h),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 77.h,
                    width: 77.h,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _connected = !_connected;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/explainer/profile.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mary Jackson',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Location, location',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF212221).withAlpha(50),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SavedPosts(),
                                ),
                              );
                            },
                            child: Text(
                              'My saved posts',
                              style: TextStyle(
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 43.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              '10',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Bucket List',
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: const Color(0xFF212221).withAlpha(60),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 29.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyConnections(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '210',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Connections',
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: const Color(0xFF212221).withAlpha(60),
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
            SizedBox(
              height: 17.h,
            ),
            _connected
                ? Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 33.h,
                              width: 173.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFD7D9C9),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icons/chat.svg',
                                    height: 12.h,
                                    width: 12.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'CHAT',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2B361C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Container(
                              height: 33.h,
                              width: 173.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFD7D9C9),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'DISCONNECT',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFF3FAFE),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 40.0.h,
                              right: 51.w,
                              left: 71.w,
                              bottom: 24.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = 0;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/images/icons/profile_post.svg',
                                  colorFilter: ColorFilter.mode(
                                    _selectedIndex == 0
                                        ? _selectedColor
                                        : _unselectedColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = 1;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/images/icons/recommended_events.svg',
                                  colorFilter: ColorFilter.mode(
                                    _selectedIndex == 1
                                        ? _selectedColor
                                        : _unselectedColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = 2;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/images/icons/profile_bucketlist.svg',
                                  colorFilter: ColorFilter.mode(
                                    _selectedIndex == 2
                                        ? _selectedColor
                                        : _unselectedColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_selectedIndex == 0)
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 1.w,
                                mainAxisSpacing: 1.h,
                              ),
                              itemCount: dummyFeedPosts.length,
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  child: Image.asset(
                                    dummyFeedPosts[index].postImage,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          )
                        else if (_selectedIndex == 1)
                          Expanded(
                            child: ListView.separated(
                              itemCount: 8,
                              itemBuilder: (context, index) => EventCard(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 12.h),
                            ),
                          )
                        else
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'My Bucket List',
                                        style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFD88F48),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showAddBucketItemList(
                                              context: context,
                                              title: 'Add Bucket List Item',
                                              buttonText: 'SAVE',
                                              onPressed: () {});
                                        },
                                        child: Container(
                                          height: 48.h,
                                          width: 48.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                            color: Color(0xFFD7D9C9),
                                          ),
                                          child: Icon(Icons.add),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 24.w, right: 24.w),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 24.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                                options: true,
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                                options: true,
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                                options: true,
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              CustomBucketListItem(
                                                title: "Item Title",
                                                desctiption: 'Text description',
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF606C38),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 117.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'CONNECT',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: const Color(0xFFF3FAFE),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                                height: 86.h,
                                width: 86.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD7D9C9),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: SvgPicture.asset(
                                    'assets/images/icons/lock.svg')),
                            Text('data'),
                            Text('data'),
                          ],
                        ),
                      )
                    ],
                  )),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            if (newIndex == 2) {
              _showAddPostBottomSheet();
            } else {
              setState(() {
                _currentIndex = newIndex;
              });
            }
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
