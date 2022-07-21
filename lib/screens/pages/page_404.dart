import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  final String message,error;
  const Page404({Key? key, required this.message,required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(error),
      ),
      body: Center(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(message)),
      ),
    );
  }
}
