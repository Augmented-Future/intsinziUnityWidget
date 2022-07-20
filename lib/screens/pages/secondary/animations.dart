import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        title: Text("Animations Page. "),
      ),
    );
  }
}
