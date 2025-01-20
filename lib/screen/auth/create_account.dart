import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
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
  final _formKey = GlobalKey<FormState>();

  // Future<bool> uploadUserDetailsToDb() async {
  //   try {
  //     DateTime dob = DateTime.parse(_dobController.text.trim());
  //     final data =
  //         await FirebaseFirestore.instance.collection("userDetails").add({
  //       "full_name": _fullNameController.text.trim(),
  //       "user_handle": _userHandle.text.trim(),
  //       "phone_number": _phoneNumber.text.trim(),
  //       "dob": Timestamp.fromDate(dob),
  //       "location": _location.text.trim(),
  //     });
  //     print(data.id);
  //     return true;
  //   } catch (e) {
  //     print("Error uploading user details: $e");
  //     return false;
  //   }
  // }

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

  bool _isDobValid = true;
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 31.h),
                              Text(
                                'Create your Account',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFD88F48),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              FormInputField(
                                controller: _fullNameController,
                                labelText: 'Full Name',
                                obscureText: false,
                                validator: ValidationBuilder()
                                    .maxLength(20, "Maximum Length Reached")
                                    .build(),
                              ),
                              SizedBox(height: 12.h),
                              FormInputField(
                                controller: _userHandle,
                                labelText: 'Handle',
                                obscureText: false,
                                validator: ValidationBuilder()
                                    .maxLength(
                                        10, "Enter less than 10 characters")
                                    .build(),
                              ),
                              SizedBox(height: 12.h),
                              FormInputField(
                                onChanged: (value) {
                                  authController.email.value = value.trim();
                                },
                                labelText: 'Email',
                                obscureText: false,
                                validator: ValidationBuilder()
                                    .email("Enter a valid email")
                                    .maxLength(20, "Maximum length is 20")
                                    .build(),
                              ),
                              SizedBox(height: 12.h),
                              FormInputField(
                                keyboardType: TextInputType.number,
                                controller: _phoneNumber,
                                labelText: 'Phone Number',
                                obscureText: false,
                                validator: ValidationBuilder().phone().build(),
                              ),
                              SizedBox(height: 12.h),
                              GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    validator: (value) {
                                      final error =
                                          ValidationBuilder().build()(value);
                                      setState(() {
                                        _isDobValid = error ==
                                            null; // Update validity state based on validation result
                                      });
                                      return error;
                                    },
                                    controller: _dobController,
                                    decoration: InputDecoration(
                                      labelText: 'Date of Birth',
                                      fillColor: const Color(0xFFF5F5F5),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        borderSide: BorderSide(
                                            color: _isDobValid
                                                ? Colors.white
                                                : Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 18.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              FormInputField(
                                validator: ValidationBuilder().build(),
                                controller: _location,
                                labelText: 'Location',
                                obscureText: false,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 51.h),
                            child: SizedBox(
                              width: double.infinity,
                              child: GreenButton(
                                  text: 'NEXT',
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      // If form is valid, navigate to the next screen
                                      Get.to(() => UploadProfile());
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'Please fix the errors in the form before proceeding.',
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
