import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/home/heading_text_orange.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                  color: const Color(0xFF9FA482).withValues(alpha: 0.42),
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
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 23.w),
                child: Row(
                  children: [
                    HeadTextOrange(title: 'Edit Profile'),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 217.h,
                    width: 217.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFCFD4D9),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF101828).withAlpha(3),
                          spreadRadius: -2,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                        BoxShadow(
                          color: Color(0xFF101828).withAlpha(92),
                          spreadRadius: -4,
                          blurRadius: 16,
                          offset: Offset(0, 12),
                        )
                      ],
                      border: Border.all(
                        width: 4.w,
                        color: Color(0xFFFFFFFF),
                      ),
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
                  Positioned(
                    top: 5.h,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 24.h, left: 45.w, right: 44.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          Column(
                            children: [
                              FormInputField(
                                  labelText: 'Full Name', obscureText: false),
                              SizedBox(
                                height: 12.h,
                              ),
                              FormInputField(
                                  labelText: 'Handle', obscureText: false),
                              SizedBox(
                                height: 12.h,
                              ),
                              FormInputField(
                                  labelText: 'Email', obscureText: false),
                              SizedBox(
                                height: 12.h,
                              ),
                              FormInputField(
                                  labelText: 'Phone Number',
                                  obscureText: false),
                              SizedBox(
                                height: 12.h,
                              ),
                              FormInputField(
                                  labelText: 'Date of Birth',
                                  obscureText: false),
                              SizedBox(
                                height: 12.h,
                              ),
                              FormInputField(
                                  labelText: 'Location', obscureText: false),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 42.h, left: 45.w, right: 44.w),
                child: SizedBox(
                  width: double.infinity,
                  child: GreenButton(
                      text: 'SAVE',
                      onPressed: () {
                        showClosablePopup(
                            context: context,
                            title: 'Changes saved!',
                            buttonText: 'OKAY',
                            content:
                                'Your profile inforamtion has been updated successfully.',
                            onPressed: () {
                              Get.back();
                            });
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
