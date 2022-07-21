import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';
import 'package:globaltrailblazersapp/screens/index.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final bool isSignedIn = true;
  @override
  Widget build(BuildContext context) {
    return isSignedIn ? const IndexPage(index: 0) : const LoginScreen();
  }
}
