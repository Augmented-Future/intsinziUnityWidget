import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Image.asset(
                  'assets/images/kid.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 40),
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
                  top: 20,
                  bottom: 48,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: const Text(
                        'FORGOT PASSWORD',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Text(
                      "Enter an email that you used in creating account",
                      style: TextStyle(color: grayColor200),
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      autofocus: false,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/mail_box.svg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      highlightColor: Colors.white,
                      splashColor: Colors.red,
                      child: Ink(
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/fullBtn.png"),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Text(
                            'RESET',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
