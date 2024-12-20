import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/profile/bucket_list_item.dart';
import 'package:hooked_up/model/dummy_data.dart';

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
                              color: const Color(0xFF212221).withOpacity(0.5),
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
                        _selectedIndex == 0 ? _selectedColor : _unselectedColor,
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
                        _selectedIndex == 1 ? _selectedColor : _unselectedColor,
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
                        _selectedIndex == 2 ? _selectedColor : _unselectedColor,
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
              const Text('data')
            else
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w),
                      child: SizedBox(
                        // height: 38.h,
                        width: double.infinity,
                        // color: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'My Bucket List',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFD88F48),
                                  ),
                                ),
                                Container(
                                  height: 48.h,
                                  width: 48.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    color: Color(0xFFD7D9C9),
                                  ),
                                  child: Icon(Icons.add),
                                )
                              ],
                            ),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
