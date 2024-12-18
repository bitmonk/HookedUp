import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/custom_checkbox_multiple.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/screen/auth/travel_interest.dart';

class ChooseInterest extends StatefulWidget {
  const ChooseInterest({super.key});

  @override
  State<ChooseInterest> createState() => _ChooseInterestState();
}

class _ChooseInterestState extends State<ChooseInterest> {
  final List<String> _selectedOptions = [];

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
                          'Choose your interests',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFD88F48),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 80.w),
                        child: Text(
                          'Select the options that suit you best.',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 14.sp,
                            height: 1.36,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      // Use CustomCheckBox for each interest
                      CustomCheckBoxMultiple(
                        value: 'Option 1',
                        isChecked: _selectedOptions.contains(
                            'Option 1'), // Check if this option is selected
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _selectedOptions.add('Option 1');
                            } else {
                              _selectedOptions.remove('Option 1');
                            }
                          });
                        },
                        label: 'Fishing',
                      ),
                      CustomCheckBoxMultiple(
                        value: 'Option 2',
                        isChecked: _selectedOptions.contains('Option 2'),
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _selectedOptions.add('Option 2');
                            } else {
                              _selectedOptions.remove('Option 2');
                            }
                          });
                        },
                        label: 'Hunting',
                      ),
                      CustomCheckBoxMultiple(
                        value: 'Option 3',
                        isChecked: _selectedOptions.contains('Option 3'),
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _selectedOptions.add('Option 3');
                            } else {
                              _selectedOptions.remove('Option 3');
                            }
                          });
                        },
                        label: 'Camping',
                      ),
                      CustomCheckBoxMultiple(
                        value: 'Option 4',
                        isChecked: _selectedOptions.contains('Option 4'),
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _selectedOptions.add('Option 4');
                            } else {
                              _selectedOptions.remove('Option 4');
                            }
                          });
                        },
                        label: 'Caravanning',
                      ),
                      CustomCheckBoxMultiple(
                        value: 'Option 5',
                        isChecked: _selectedOptions.contains('Option 5'),
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _selectedOptions.add('Option 5');
                            } else {
                              _selectedOptions.remove('Option 5');
                            }
                          });
                        },
                        label: 'Other',
                      ),
                      SizedBox(
                        height: 240.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GreenButton(
                          text: 'NEXT',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TravelInterest(),
                              ),
                            );
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
