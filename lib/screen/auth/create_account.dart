import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/controllers/auth_controller.dart';
import 'package:hooked_up/screen/auth/upload_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(email);
  }

  // Helper method to validate phone number (basic check)
  bool isValidPhoneNumber(String phone) {
    final RegExp phoneRegex = RegExp(r"^\d{10}$");
    return phoneRegex.hasMatch(phone);
  }

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: Transform.translate(
            offset: Offset(24.w, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 41.h,
                width: 41.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF9FA482).withAlpha(42),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF2B361C),
                ),
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
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
                        SizedBox(height: 24.h),

                        // Full Name Field
                        FormInputField(
                          controller: _fullNameController,
                          labelText: 'Full Name',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Full Name cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),

                        // Handle Field
                        FormInputField(
                          controller: _userHandle,
                          labelText: 'Handle',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Handle cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),

                        // Email Field
                        FormInputField(
                          onChanged: (value) {
                            authController.email.value = value.trim();
                            print(
                                'Updated Email: ${authController.email.value}');
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email cannot be empty';
                            }
                            if (!isValidEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          labelText: 'Email',
                          obscureText: false,
                        ),
                        SizedBox(height: 12.h),

                        // Phone Number Field
                        FormInputField(
                          keyboardType: TextInputType.number,
                          controller: _phoneNumber,
                          labelText: 'Phone Number',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone Number cannot be empty';
                            }
                            if (!isValidPhoneNumber(value)) {
                              return 'Please enter a valid phone number (10 digits)';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),

                        // Date of Birth Field
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Date of Birth cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),

                        // Location Field
                        FormInputField(
                          controller: _location,
                          labelText: 'Location',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Location cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 160.h),

                        // Submit Button
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GreenButton(
                      text: 'NEXT',
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          bool uploadSuccess = await uploadUserDetailsToDb();
                          if (uploadSuccess) {
                            Get.snackbar('Success', 'Success',
                                snackPosition: SnackPosition.TOP);
                            Get.to(() => UploadProfile());
                          }
                        } else {
                          Get.snackbar(
                              'Error', 'Please fill in all fields correctly',
                              snackPosition: SnackPosition.TOP);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
