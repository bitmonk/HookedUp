import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/controllers/auth_controller.dart';
import 'package:hooked_up/screen/auth/upload_profile.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final authController = Get.put(AuthController());
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userHandle = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _location = TextEditingController();

  Future<bool> uploadUserDetailsToDb() async {
    try {
      DateTime dob = DateTime.parse(_dobController.text.trim());
      final data =
          await FirebaseFirestore.instance.collection("userDetails").add({
        "full_name": _fullNameController.text.trim(),
        "user_handle": _userHandle.text.trim(),
        "phone_number": _phoneNumber.text.trim(),
        "dob": Timestamp.fromDate(dob),
        "location": _location.text.trim(),
      });
      print(data.id);
      return true;
    } catch (e) {
      print("Error uploading user details: $e");
      return false;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        _dobController.text = '${selectedDate.toLocal()}'.split(' ')[0];
        print(_dobController.text);
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
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
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
                      SizedBox(
                        height: 24.h,
                      ),
                      FormInputField(
                          controller: _fullNameController,
                          labelText: 'Full Name',
                          obscureText: false),
                      SizedBox(
                        height: 12.h,
                      ),
                      FormInputField(
                          controller: _userHandle,
                          labelText: 'Handle',
                          obscureText: false),
                      SizedBox(
                        height: 12.h,
                      ),
                      FormInputField(
                          onChanged: (value) {
                            authController.email.value = value.trim();
                            print(
                                'Updated Email: ${authController.email.value}');
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email cannot be empty..';
                            }
                            return null;
                          },
                          labelText: 'Email',
                          obscureText: false),
                      SizedBox(
                        height: 12.h,
                      ),
                      FormInputField(
                          keyboardType: TextInputType.number,
                          controller: _phoneNumber,
                          labelText: 'Phone Number',
                          obscureText: false),
                      SizedBox(
                        height: 12.h,
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _dobController,
                            decoration: InputDecoration(
                              labelText: 'Date of Birth',
                              fillColor: Color(0xFFF5F5F5),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 18.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      FormInputField(
                          controller: _location,
                          labelText: 'Location',
                          obscureText: false),
                      SizedBox(
                        height: 160.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GreenButton(
                            text: 'NEXT',
                            onPressed: () async {
                              bool uploadSuccess =
                                  await uploadUserDetailsToDb();
                              if (uploadSuccess) {
                                Get.snackbar('Success', 'Success',
                                    snackPosition: SnackPosition.TOP);
                                Get.to(() => UploadProfile());
                              }
                            }),
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
