import 'package:flutter/material.dart';

class GetNotified extends StatefulWidget {
  const GetNotified({super.key});

  @override
  State<GetNotified> createState() => _GetNotifiedState();
}

class _GetNotifiedState extends State<GetNotified> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('notipage'),
      ),
    );
  }
}
