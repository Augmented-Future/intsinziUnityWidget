import 'package:flutter/material.dart';

class AnimationsPageScreen extends StatefulWidget {
  const AnimationsPageScreen({Key? key}) : super(key: key);

  @override
  State<AnimationsPageScreen> createState() => _AnimationsPageScreenState();
}

class _AnimationsPageScreenState extends State<AnimationsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations Page "),
        elevation: 0.0,
      ),
    );
  }
}
