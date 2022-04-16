import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/verify_phone.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: FractionalOffset.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  'assets/images/avatar4.png',
                  width: 600,
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                  top: 48,
                  bottom: 48,
                ),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    autofocus: false,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                      filled: true,
                      fillColor: softGray,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    autofocus: false,
                    obscureText: true,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                      filled: true,
                      fillColor: softGray,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyPhoneScreen()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 48,
                        right: 48,
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/fullBtn.png"),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have account?',
                        style: TextStyle(color: grayColor200),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: grayColor200, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
