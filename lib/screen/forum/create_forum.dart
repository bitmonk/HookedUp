import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/home/heading_text_orange.dart';
import 'package:hooked_up/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

class CreateForum extends StatefulWidget {
  const CreateForum({super.key});

  @override
  State<CreateForum> createState() => _CreateForumState();
}

class _CreateForumState extends State<CreateForum> {
  // File? _selectedImage;
  List<File> selectedImages = [];

  Future<void> _selectForumPics() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null) {
      setState(() {
        selectedImages.addAll(images.map((image) => File(image.path)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(selectedImages);
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45.w),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadTextOrange(title: 'Create New Forum'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      FormInputField(
                          labelText: 'Forum Title', obscureText: false),
                      SizedBox(height: 12.h),
                      Container(
                        height: 371.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 18.h),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Forum Description',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            maxLines: null,
                            expands: true,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Category',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF212221),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18.h, horizontal: 24.w),
                          fillColor: const Color(0xFFF5F5F5),
                          filled: true,
                          suffixIcon: Icon(Icons.arrow_forward_rounded,
                              color: const Color(0xFF212221), size: 20.sp),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: selectedImages.isNotEmpty ? null : 58.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Expanded(
                          child: SingleChildScrollView(
                            scrollDirection:
                                Axis.horizontal, // Allow horizontal scrolling
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                selectedImages.isEmpty
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          left: 24.w,
                                        ),
                                        child: Text('Add Media',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                            )),
                                      )
                                    : SizedBox.shrink(),
                                Wrap(
                                  children: [
                                    ...selectedImages.map(
                                      (imageFile) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w, vertical: 10.h),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 84.w,
                                              height: 68.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.file(
                                                  imageFile,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 4.h,
                                              right: 4.w,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedImages.remove(
                                                        imageFile); // Remove image
                                                  });
                                                },
                                                child: Container(
                                                  width: 24.w,
                                                  height: 24.h,
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 16.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                selectedImages.isEmpty
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                      )
                                    : SizedBox.shrink(),
                                GestureDetector(
                                  onTap: () {
                                    _selectForumPics();
                                  },
                                  child: Container(
                                    height: 48.h,
                                    width: 48.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: Color(0xFFD7D9C9),
                                    ),
                                    child: Icon(
                                      Icons.add_rounded,
                                      size: 24.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 56.h),
                child: SizedBox(
                  width: double.infinity,
                  child: GreenButton(text: 'SHARE', onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
