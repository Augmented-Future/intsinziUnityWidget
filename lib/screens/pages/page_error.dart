import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/home/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/index.dart';
import 'package:lottie/lottie.dart';

class PageError extends StatelessWidget {
  final int statusCode;
  final String errorMessage, errorDescription;
  final String? helpUrl, lottieAnimationUrl;
  final List<String>? suggestions;
  const PageError(
      {Key? key,
      required this.errorDescription,
      required this.errorMessage,
      required this.statusCode,
      this.helpUrl,
      this.lottieAnimationUrl,
      this.suggestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$statusCode - $errorMessage"),
        elevation: 0.0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Lottie.network(
                  "https://assets7.lottiefiles.com/packages/lf20_j3gumpgp.json"),
            ),
            Text(
              errorDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Go Back",
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  elevation: 0.0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const IndexPage(
              page: HomePage(),
            ),
          ),
        ),
        child: const Icon(Icons.home),
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
    );
  }
}
