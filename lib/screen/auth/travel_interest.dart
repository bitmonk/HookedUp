import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/custom_checkbox_multiple.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/screen/subscription/select_plan.dart';

class TravelInterest extends StatefulWidget {
  const TravelInterest({super.key});

  @override
  State<TravelInterest> createState() => _TravelInterestState();
}

class _TravelInterestState extends State<TravelInterest> {
  final List<String> _selectedOptions = []; // A list to store selected options

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
                          'Select Travel Interests',
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
                        label: 'New South Wales (NSW) ',
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
                        label: 'Victoria (VIC)',
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
                        label: 'Queensland (QLD) ',
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
                        label: 'South Australia (SA)',
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
                        label: 'Western Australia (WA)',
                      ),
                      CustomCheckBoxMultiple(
                        value: 'Option 6',
                        isChecked: _selectedOptions.contains('Option 6'),
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _selectedOptions.add('Option 6');
                            } else {
                              _selectedOptions.remove('Option 6');
                            }
                          });
                        },
                        label: 'Tasmania (TAS)',
                      ),
                      CustomCheckBoxMultiple(
                        value: 'Option 7',
                        isChecked: _selectedOptions.contains('Option 7'),
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _selectedOptions.add('Option 7');
                            } else {
                              _selectedOptions.remove('Option 7');
                            }
                          });
                        },
                        label: 'Australian Capital Territory (ACT)',
                      ),
                      CustomCheckBoxMultiple(
                        value: 'Option 8',
                        isChecked: _selectedOptions.contains('Option 8'),
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _selectedOptions.add('Option 8');
                            } else {
                              _selectedOptions.remove('Option 8');
                            }
                          });
                        },
                        label: 'Northern Territory (NT)',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GreenButton(
                          text: 'NEXT',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SelectPlan()),
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
