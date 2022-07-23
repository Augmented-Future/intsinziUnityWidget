import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/index.dart';

class Page404 extends StatelessWidget {
  final String message, error;
  const Page404({Key? key, required this.message, required this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(error),
        elevation: 0.0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              message,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const IndexPage(index: 0),
          ),
        ),
        child: const Icon(Icons.home),
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
    );
  }
}
