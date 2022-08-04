import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupComplete extends StatelessWidget {
  const SignupComplete({Key? key, required this.user}) : super(key: key);
  final UserAccount user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Account created, check your email to verify",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: primaryColor),
            ),
            const SizedBox(height: 20),
            Text("E-mail: ${user.email}"),
            const SizedBox(height: 10),
            Text("First Name: ${user.firstName}"),
            const SizedBox(height: 20),
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
              style:
                  ElevatedButton.styleFrom(primary: coolGreen, elevation: 0.0),
              child: const Text("Verify / Open Gmail App"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                  (route) => false),
              style: ElevatedButton.styleFrom(
                  primary: primaryColor, elevation: 0.0),
              child: const Text("Go to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
