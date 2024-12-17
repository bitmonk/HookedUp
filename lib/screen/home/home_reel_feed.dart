import 'package:flutter/material.dart';

class HomeReelFeed extends StatefulWidget {
  const HomeReelFeed({super.key});

  @override
  State<HomeReelFeed> createState() => _HomeReelFeedState();
}

class _HomeReelFeedState extends State<HomeReelFeed> {
  @override
  Widget build(BuildContext context) {
    PageController reelsController = PageController(initialPage: 0);
    List<Widget> reels = [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[400],
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow[400],
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.green[400],
      ),
    ];

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: reelsController,
        children: reels,
      ),
    );
  }
}
