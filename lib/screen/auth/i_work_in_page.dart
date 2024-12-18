import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/custom_radio_button.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/screen/auth/choose_interest.dart';

class IWorkInPage extends StatefulWidget {
  const IWorkInPage({super.key});

  @override
  State<IWorkInPage> createState() => _IWorkInPageState();
}

class _IWorkInPageState extends State<IWorkInPage> {
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
                          'I work in ...',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFD88F48),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
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
                        height: 14.h,
                      ),
                      CustomRadioButton(
                          value: 'Option 1',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Trade'),
                      CustomRadioButton(
                          value: 'Option 2',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Corporate Professional'),
                      CustomRadioButton(
                          value: 'Option 3',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Retired'),
                      CustomRadioButton(
                          value: 'Option 4',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Healthcare'),
                      CustomRadioButton(
                          value: 'Option 5',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Engineer'),
                      CustomRadioButton(
                          value: 'Option 6',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Tech'),
                      CustomRadioButton(
                          value: 'Option 7',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Education'),
                      CustomRadioButton(
                          value: 'Option 8',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Self Employed'),
                      CustomRadioButton(
                          value: 'Option 9',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Hospitality'),
                      CustomRadioButton(
                          value: 'Option 10',
                          groupValue: _selectedOption ?? '',
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          label: 'Other'),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GreenButton(
                            text: 'NEXT',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ChooseInterest()));
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
