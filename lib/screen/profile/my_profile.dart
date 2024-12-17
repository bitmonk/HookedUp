import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int _selectedIndex = 0;

  final Color _selectedColor = const Color(0xFF9FA482);
  final Color _unselectedColor = const Color(0xFFD9D9D9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFC),
      body: Padding(
        padding: EdgeInsets.only(top: 12.0.h),
        child: SizedBox(
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
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/explainer/profile.png'),
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
                                color: const Color(0xFF212221).withOpacity(0.6),
                              ),
                            ),
                            Text(
                              'My saved posts',
                              style: TextStyle(
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 43.w,
                        ),
                        Column(
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
                                color: const Color(0xFF212221).withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 29.w,
                        ),
                        Column(
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
                                color: const Color(0xFF212221).withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 40.0.h, right: 51.w, left: 71.w, bottom: 24.h),
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
                              : _unselectedColor, // The color you want to apply
                          BlendMode
                              .srcIn, // Ensures that the color is applied to the SVG
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
                              : _unselectedColor, // The color you want to apply
                          BlendMode
                              .srcIn, // Ensures that the color is applied to the SVG
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
                              : _unselectedColor, // The color you want to apply
                          BlendMode
                              .srcIn, // Ensures that the color is applied to the SVG
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 142.h,
                            width: 142.w,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/images/explainer/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          SizedBox(
                            height: 142.h,
                            width: 142.w,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/images/explainer/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          SizedBox(
                            height: 142.h,
                            width: 142.w,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/images/explainer/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 142.h,
                            width: 142.w,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/images/explainer/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          SizedBox(
                            height: 142.h,
                            width: 142.w,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/images/explainer/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          SizedBox(
                            height: 142.h,
                            width: 142.w,
                            child: ClipRRect(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
