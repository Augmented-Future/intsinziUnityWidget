import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthPageError extends StatelessWidget {
  const AuthPageError(
      {Key? key, required this.statusCode, required this.message})
      : super(key: key);
  final int statusCode;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$statusCode ($message)",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, elevation: 0.0),
              child: const Text("Retry"),
            ),
            if (statusCode == 401)
              ElevatedButton(
                onPressed: () async {
                  Uri url = Uri.parse("https://gmail.com");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    Fluttertoast.showToast(
                        msg: "We can not open Gmail App for now.");
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: coolGreen, elevation: 0.0),
                child: const Text("Verify / Open Gmail App"),
              ),
          ],
        ),
      ),
    );
  }
}
