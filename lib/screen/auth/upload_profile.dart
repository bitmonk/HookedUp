import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/screen/auth/phone_verification.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({super.key});

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  File? _selectedImage;
  Future<void> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFF9FA482).withValues(alpha: 0.42),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF2B361C),
                        ),
                      ),
                    ),
                    title: SvgPicture.asset(
                      'assets/images/splash/logo.svg',
                      height: 54.h,
                      width: 52.w,
                    ),
                    centerTitle: true,
                  ),
                ),
                SizedBox(height: 31.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Create your Account',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFD88F48),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.w),
                        child: Text(
                          'Upload a profile picture to complete your account. You can update this at any time.',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 73.h, bottom: 270.h),
                            child: Container(
                              height: 217.h,
                              width: 217.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFCFD4D9),
                                shape: BoxShape.circle,
                                image: _selectedImage != null
                                    ? DecorationImage(
                                        image: FileImage(_selectedImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: _selectedImage == null
                                    ? Text(
                                        'MJ',
                                        style: TextStyle(
                                            fontSize: 90.sp,
                                            color: const Color(0xFFFFFFFF)),
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80.h,
                            right: 15.w,
                            child: GestureDetector(
                              onTap: () {
                                uploadImage();
                                print('clicked!');
                              },
                              child: Container(
                                height: 48.h,
                                width: 48.h,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFD7D9C9),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GreenButton(
                          text: 'NEXT',
                          onPressed: () {
                            Get.to(() => PhoneVerification());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
