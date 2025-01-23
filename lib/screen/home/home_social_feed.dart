import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/home/feed_post.dart';
import 'package:hooked_up/components/navigation/custom_drawer.dart';
import 'package:hooked_up/screen/chat/chat_home.dart';
import 'package:hooked_up/screen/create_post/create_post_home.dart';
import 'package:hooked_up/screen/home/activity_feed.dart';
import 'package:hooked_up/screen/profile/my_profile.dart';
import 'package:hooked_up/screen/season/open_season.dart';
import 'package:image_picker/image_picker.dart';

class HomeSocialFeed extends StatefulWidget {
  const HomeSocialFeed({super.key});

  @override
  State<HomeSocialFeed> createState() => _SocialFeedState();
}

class _SocialFeedState extends State<HomeSocialFeed> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  List<Widget> body = const [
    FeedPost(),
    OpenSeason(),
    SizedBox(),
    ChatHome(),
    MyProfile(),
  ];

  // This builds each item for the BottomNavigationBar.
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

  // Method for showing a bottom sheet when the user taps the "add post" button.
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
                  uploadFromCamera();
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
                onTap: () {
                  pickImageFromGallery();
                },
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

  // When the user clicks on a button to upload a photo using the camera.
  Future<void> uploadFromCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        setState(() {
          Get.to(() => CreatePostHome(imagePath: photo.path));
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? galleryPhoto =
        await picker.pickImage(source: ImageSource.gallery);
    if (galleryPhoto != null) {
      setState(() {
        Get.to(
          CreatePostHome(
            imagePath: galleryPhoto.path,
          ),
        );
      });
    }
  }

  String _getTitle() {
    if (_currentIndex == 0) {
      return "Home";
    } else if (_currentIndex == 1) {
      return "Open Season";
    } else if (_currentIndex == 2) {
      return "";
    } else if (_currentIndex == 3) {
      return "Chat";
    } else if (_currentIndex == 4) {
      return "mary-jackson";
    } else {
      return '';
    }
  }

  // Scaffold layout with BottomNavigationBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFFFFFFC),
      appBar: AppBar(
        surfaceTintColor: const Color(0xFFFFFFFC),
        backgroundColor: const Color(0xFFFFFFFC),
        automaticallyImplyLeading: false,
        title: Text(
          _getTitle(),
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
      drawer: CustomDrawer(),
      body: body[_currentIndex], // Display the selected body content
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
