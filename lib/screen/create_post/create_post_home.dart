import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/home/my_bucket_list_item.dart';
import 'package:hooked_up/components/home/tag_connection.dart';
import 'package:hooked_up/utils/colors.dart';

class CreatePostHome extends StatefulWidget {
  const CreatePostHome({super.key});

  @override
  State<CreatePostHome> createState() => _CreatePostHomeState();
}

class _CreatePostHomeState extends State<CreatePostHome> {
  bool _isChecked = false;
  void _showBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Color(0xFFFFFFFC),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Bucket List',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFD88F48),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 31.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                SizedBox(height: 12.h),
                MyBucketListItem(
                  isSelected: false,
                ),
                // Add more content for the bottom sheet here if needed
              ],
            ),
          );
        });
      },
    );
  }

  // void _showConnectionsBottomSheet() {
  //   showModalBottomSheet(
  //     backgroundColor: Color(0xFFFFFFFC),
  //     context: context,
  //     isScrollControlled: true,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
  //     ),
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (BuildContext context, setState) {
  //           return Padding(
  //             padding: EdgeInsets.all(16.w),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'My Connections',
  //                       style: TextStyle(
  //                         fontSize: 22.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: Color(0xFFD88F48),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 31.h),
  //                 // Wrap the list of items inside a SingleChildScrollView or ListView
  //                 Expanded(
  //                   child: SingleChildScrollView(
  //                     child: Column(
  //                       children: List.generate(10, (index) {
  //                         return Padding(
  //                           padding: EdgeInsets.only(bottom: 12.h),
  //                           child:
  //                               TagConnection(), // Replace with actual connection widget
  //                         );
  //                       }),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: 12.h),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 38.h,
            left: 24.w,
            right: 42.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 41.h,
                  width: 41.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF2B361C),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create a Post",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFD88F48),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        'assets/images/explainer/profile.png',
                        height: 272.h,
                        width: 340.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      height: 116.h,
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Create a caption...',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF212221),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 24.w),
                          fillColor: const Color(0xFFF5F5F5),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 58.h,
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Location',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF212221),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 24.w),
                          fillColor: const Color(0xFFF5F5F5),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 58.h,
                      child: GestureDetector(
                        onTap: () {
                          // _showConnectionsBottomSheet();
                        },
                        child: TextField(
                          enabled: false,
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Tag people',
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xFF212221),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 24.w),
                            fillColor: const Color(0xFFF5F5F5),
                            filled: true,
                            suffixIcon: Icon(Icons.arrow_forward_rounded,
                                color: const Color(0xFF212221), size: 20.sp),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 11.w),
                            child: Text(
                              "Mark as Bucket List",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet();
                              setState(() {
                                _isChecked = true;
                              });
                            },
                            child: Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: _isChecked
                                    ? const Color(0xFF606C38)
                                    : Color(0xFF606C38),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFF606C38),
                                  width: 2,
                                ),
                              ),
                              child: _isChecked
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16.w,
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Center(
                        child: SizedBox(
                            width: double.infinity,
                            child:
                                GreenButton(text: "SHARE", onPressed: () {})))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
