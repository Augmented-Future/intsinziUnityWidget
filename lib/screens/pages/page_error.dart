import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/home/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/index.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(context) / 2.5,
                width: screenWidth(context) - 50,
                child: Lottie.asset("assets/lottie/not_found.json"),
              ),
              const SizedBox(height: 50),
              Text(
                errorDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Go Back",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const IndexPage(
              page: HomePage(),
              active: "Home",
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
