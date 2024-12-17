import 'package:flutter/material.dart';

class OpenSeason extends StatefulWidget {
  const OpenSeason({super.key});

  @override
  State<OpenSeason> createState() => _OpenSeasonState();
}

class _OpenSeasonState extends State<OpenSeason> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Season Page'),
      ),
    );
  }
}
