import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/custom_radio_button.dart';
import 'package:hooked_up/components/cutom_check_box.dart';
import 'package:hooked_up/components/green_button.dart';

class HereForPage extends StatefulWidget {
  const HereForPage({super.key});

  @override
  State<HereForPage> createState() => _HereForPageState();
}

class _HereForPageState extends State<HereForPage> {
  String? _selectedOption = 'Option 1';
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
                          color: const Color(0xFF9FA482).withOpacity(0.42),
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
                          'I am here for ...',
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
                          'Select the option that suits you best.',
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
                      CustomCheckBox(
                          value: 'Option 1',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Grey Nomad'),
                      CustomCheckBox(
                          value: 'Option 2',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Travelling Family'),
                      CustomCheckBox(
                          value: 'Option 3',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Solo'),
                      CustomCheckBox(
                          value: 'Option 4',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Party of 2'),
                      CustomCheckBox(
                          value: 'Option 5',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Staying Locally'),
                      SizedBox(
                        height: 240.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GreenButton(text: 'NEXT', onPressed: () {}),
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
