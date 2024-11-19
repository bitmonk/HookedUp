import 'package:flutter/material.dart';

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
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  _pageImages[_activePage],
                  height: _activePage == 0
                      ? screenSize.height * 1.1
                      : screenSize.height,
                  width: screenSize.width * 1.2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenSize.height * 0.09),
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      screenSize.width * 0.05,
                      screenSize.height * 0.03,
                      screenSize.width * 0.05,
                      screenSize.height * 0.03,
                    ),
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.4,
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
                              title: 'Explainer Title - Page 1',
                              description:
                                  'This is the description for the first page of the explainer.',
                            ),
                            _buildPage(
                              screenSize,
                              title: 'Explainer Title - Page 2',
                              description:
                                  'This is the description for the second page of the explainer.',
                            ),
                            _buildPage(
                              screenSize,
                              title: 'Explainer Title - Page 3',
                              description:
                                  'This is the description for the third page of the explainer.',
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(
                              3,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: _activePage == index
                                      ? const Color(0xFFFEF5CC).withOpacity(0.8)
                                      : Colors.grey,
                                ),
                              ),
                            ),
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
            fontFamily: 'Manrope',
            fontSize: screenSize.width * 0.045,
            fontWeight: FontWeight.w700,
          ),
          overflow: TextOverflow.visible,
        ),
        SizedBox(height: screenSize.height * 0.03),
        Text(
          description,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Manrope',
            fontSize: screenSize.width * 0.035,
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
