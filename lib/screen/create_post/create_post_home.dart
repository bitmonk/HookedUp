import 'package:flutter/material.dart';

class CreatePostHome extends StatefulWidget {
  const CreatePostHome({super.key});

  @override
  State<CreatePostHome> createState() => _CreatePostHomeState();
}

class _CreatePostHomeState extends State<CreatePostHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Create post homepage..'),
      ),
    );
  }
}
