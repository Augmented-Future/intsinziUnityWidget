import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/models/avatar.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';

class SignupComplete extends StatelessWidget {
  const SignupComplete({Key? key, required this.user, required this.avatar})
      : super(key: key);
  final UserAccount user;
  final Avatar avatar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email),
            Text(user.firstName),
            Text(avatar.url),
            Text(avatar.name),
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
