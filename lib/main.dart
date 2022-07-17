import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/screens/authentication/auth_wrapper.dart';
import 'package:globaltrailblazersapp/screens/onboarding/intros.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final skipIntro = prefs.getBool('skipIntro') ?? false;

  runApp(MyApp(skipIntro: skipIntro));
}

class MyApp extends StatelessWidget {
  final bool skipIntro;
  const MyApp({Key? key, required this.skipIntro}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: skipIntro ? const AuthWrapper() : const OnBoardingScreen(),
    );
  }
}
