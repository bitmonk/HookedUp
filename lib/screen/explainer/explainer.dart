import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/screen/auth/login.dart';

class ExplainerScreen extends StatefulWidget {
  const ExplainerScreen({super.key});

  @override
  State<ExplainerScreen> createState() => _ExplainerScreenState();
}

class _ExplainerScreenState extends State<ExplainerScreen> {
  final PageController _pageController = PageController();
  int _activePage = 0;
  double _opacity = 0.0;

  final List<String> _pageImages = [
    'assets/images/explainer/asdf.png',
    'assets/images/explainer/bow.jpg',
    'assets/images/explainer/landscape.jpg',
  ];

  final List<Color> _backgroundColors = [
    const Color(0xFF091018),
    const Color(0xFF2B361C).withValues(alpha: 0.77),
    const Color(0xFF2B361C).withValues(alpha: 0.77)
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    _pageController.addListener(() {
      setState(() {
        _activePage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(9, 16, 24, 1),
        child: Stack(
          children: [
            Positioned(
              top: _activePage == 0 ? -380.h : 0,
              left: 0,
              right: 0,
              child: Image.asset(
                _pageImages[_activePage],
                height: _activePage == 0 ? 1100.h : 1.sh,
                width: 1.2.sw,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 90.h),
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 25, 23, 27),
                    width: 354.w,
                    height: 334.h,
                    decoration: BoxDecoration(
                      color: _backgroundColors[_activePage],
                      border: Border.all(
                        color: const Color(0xFF697B89),
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Stack(
                      children: [
                        PageView(
                          controller: _pageController,
                          children: [
                            _buildPage(
                              title:
                                  'Explainer Title - Lorem Ipsum dolor sit amet',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ',
                            ),
                            _buildPage(
                              title:
                                  'Explainer Title - Lorem Ipsum dolor sit amet',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ',
                            ),
                            _buildPage(
                              title:
                                  'Explainer Title - Lorem Ipsum dolor sit amet',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ',
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -15.h,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Padding(
                                padding: EdgeInsets.only(left: 60.w),
                                child: Row(
                                  children: List<Widget>.generate(
                                    3,
                                    (index) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: CircleAvatar(
                                        radius: 6.r,
                                        backgroundColor: _activePage == index
                                            ? const Color(0xFFFEF5CC)
                                                .withValues(alpha: 0.8)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const NewWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: const Color(0xFFD88F48),
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          description,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: Text(
        'Skip',
        style: TextStyle(
          color: const Color(0xFFF5F5F5),
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
