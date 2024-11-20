import 'package:flutter/material.dart';
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
    const Color(0xFF2B361C).withOpacity(0.77),
    const Color(0xFF2B361C).withOpacity(0.77)
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
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(9, 16, 24, 1),
        child: Stack(
          children: [
            Positioned(
              top: _activePage == 0 ? -screenSize.height * 0.38 : 0,
              left: 0,
              right: 0,
              child: Image.asset(
                _pageImages[_activePage],
                height: _activePage == 0
                    ? screenSize.height * 1.1
                    : screenSize.height,
                width: screenSize.width * 1.2,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenSize.height * 0.09),
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      screenSize.width * 0.05,
                      screenSize.height * 0.03,
                      screenSize.width * 0.05,
                      screenSize.height * 0.03,
                    ),
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.42,
                    decoration: BoxDecoration(
                      color: _backgroundColors[_activePage],
                      border: Border.all(
                        color: const Color(0xFF697B89),
                      ),
                      borderRadius:
                          BorderRadius.circular(screenSize.width * 0.05),
                    ),
                    child: Stack(
                      children: [
                        PageView(
                          controller: _pageController,
                          children: [
                            _buildPage(
                              screenSize,
                              title:
                                  'Explainer Title - Lorem Ipsum dolor sit amet',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ',
                            ),
                            _buildPage(
                              screenSize,
                              title:
                                  'Explainer Title - Lorem Ipsum dolor sit amet',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ',
                            ),
                            _buildPage(
                              screenSize,
                              title:
                                  'Explainer Title - Lorem Ipsum dolor sit amet',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ',
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -15,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Keeps the dots and button at opposite ends
                            children: [
                              // Empty widget to push the dots towards the right
                              Container(),

                              // Dots moved towards the right
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenSize.width *
                                        0.16), // Increased left padding to move dots right
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .end, // Align dots to the far right
                                  children: List<Widget>.generate(
                                    3,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: CircleAvatar(
                                        radius: 6,
                                        backgroundColor: _activePage == index
                                            ? const Color(0xFFFEF5CC)
                                                .withOpacity(0.8)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Skip button remains on the far right
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                child: Text(
                                  'Skip', // Button text
                                  style: TextStyle(
                                    color: const Color(0xFFF5F5F5),
                                    fontSize: screenSize.width *
                                        0.04, // Font size adjusted based on screen width
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(Size screenSize,
      {required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: const Color(0xFFD88F48),
            fontSize: screenSize.width * 0.050,
            fontWeight: FontWeight.w700,
          ),
          overflow: TextOverflow.visible,
        ),
        SizedBox(height: screenSize.height * 0.03),
        Text(
          description,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSize.width * 0.035,
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
