import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/finish_register.dart';
import 'package:globaltrailblazersapp/screens/login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const curriculumns = [
    'Rwand Calcirrum',
    'America Calcirrum',
    'USA Calcirrum'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(32),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/register.png"),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 170, top: 120),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 170),
                child: const Text(
                  'To get customized  courses',
                  style: TextStyle(
                    fontSize: 10,
                    color: grayColor,
                  ),
                ),
              ),
              const SizedBox(height: 120),
              TextField(
                autofocus: false,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'Full name',
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
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Flexible(
                  child: TextField(
                    autofocus: false,
                    enabled: false,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Choose Curriculum',
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
                ),
                const SizedBox(width: 4),
                DropdownButton<String>(
                  items: curriculumns.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ]),
              const SizedBox(height: 10),
              TextField(
                autofocus: false,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'School name',
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
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: false,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'Grade',
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
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: false,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'Gender',
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
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: false,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'Age',
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
                        builder: (context) => const FinishRegisterScreen()),
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
                    color: brandYellowColor,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: primaryColor,
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
                    'Already have an account?',
                    style: TextStyle(color: grayColor200),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: grayColor200, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
