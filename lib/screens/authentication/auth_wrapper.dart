import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';
import 'package:globaltrailblazersapp/screens/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool? isSignedIn;

  checkAuthChanges() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isSignedIn = prefs.getBool("signedIn") ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthChanges();
  }

  @override
  Widget build(BuildContext context) {
    return isSignedIn ?? false
        ? const IndexPage(index: 0)
        : const LoginScreen();
  }
}
