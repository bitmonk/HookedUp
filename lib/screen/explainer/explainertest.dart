import 'package:flutter/material.dart';

class ExplainerTest extends StatefulWidget {
  const ExplainerTest({super.key});

  @override
  State<ExplainerTest> createState() => _ExplainerTestState();
}

class _ExplainerTestState extends State<ExplainerTest> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300, // Square dimensions
          height: 350, // Slightly taller to accommodate indicators
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2), // Optional border
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _activePage = page;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _pages[index % _pages.length];
                  },
                ),
              ),
              // const SizedBox(height: 10), // Spacing between page and dots
              Container(
                color: Colors
                    .transparent, // Make the container holding indicators transparent
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: _activePage == index
                              ? Colors.amber // Active indicator color
                              : Colors.grey, // Inactive indicator color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 10), // Spacing below the dots
            ],
          ),
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: const Text(
        'Green Page',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      child: const Text(
        'Yellow Page',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: const Text(
        'Red Page',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
