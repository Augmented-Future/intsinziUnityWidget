import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/screens/authentication/auth_page_error.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';
import 'package:globaltrailblazersapp/screens/authentication/signup_complete.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool agreed = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final signInWithGoogleController = Get.put(AuthService());
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
                  'assets/images/avatar4.png',
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
                  top: 10,
                  bottom: 48,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        signInWithGoogleController.loginWithGoogleCredentials();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/gmail.svg',
                              height: 30,
                            ),
                            const Text(
                              "Register with Google",
                              style: TextStyle(color: blackColor, fontSize: 18),
                            ),
                            Container()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: const Text(
                        'REGISTER WITH EMAIL',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Obx(() {
                      if (signInWithGoogleController.googleAccount.value ==
                          null) {
                        return Column(
                          children: [
                            TextField(
                              controller: _firstName,
                              cursorColor: primaryColor,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: 'First name',
                                hintStyle:
                                    const TextStyle(color: Color(0xFFbdc6cf)),
                                filled: true,
                                fillColor: softGray,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                      'assets/icons/user_icon.svg'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _email,
                              cursorColor: primaryColor,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle:
                                    const TextStyle(color: Color(0xFFbdc6cf)),
                                filled: true,
                                fillColor: softGray,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                      'assets/icons/mail_box.svg'),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Container(
                              width: screenWidth(context),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: softGray,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/user_icon.svg',
                                    width: 35,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    signInWithGoogleController
                                            .googleAccount.value?.displayName ??
                                        "",
                                    style: const TextStyle(color: grayColor),
                                  ),
                                ],
                              ),
                            ),
                           const SizedBox(height: 10),
                            Container(
                              width: screenWidth(context),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: softGray,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/mail_box.svg'),
                                  const SizedBox(width: 8),
                                  Text(
                                    signInWithGoogleController
                                            .googleAccount.value?.email ??
                                        "",
                                    style: const TextStyle(color: grayColor),
                                  ),
                                ],
                              ),
                            ),
                           const SizedBox(height: 6),
                            const Text(
                              "One more step, Add your password.👇",
                              style:
                                  TextStyle(color: whiteColor, fontSize: 16.0),
                            )
                          ],
                        );
                      }
                    }),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      obscuringCharacter: '*',
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
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/padlock.svg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) =>
                              const BottomSheetLoadingIndicator(),
                        );
                        dynamic result =
                            await AuthService.registerWithEmailAndPassword(
                                signInWithGoogleController
                                        .googleAccount.value?.email ??
                                    _email.text,
                                _password.text,
                                signInWithGoogleController
                                        .googleAccount.value?.displayName ??
                                    _firstName.text);
                        if (result.runtimeType == ErrorException) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AuthPageError(
                                  statusCode: result.statusCode,
                                  message: result.errorMessage),
                            ),
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignupComplete(user: result),
                              ),
                              ((route) => false));
                        }
                      },
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
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => agreed = !agreed),
                            child: agreed
                                ? SvgPicture.asset(
                                    'assets/icons/check_box.svg',
                                    height: 25,
                                  )
                                : SvgPicture.asset(
                                    'assets/icons/unchecked_box.svg',
                                    height: 25,
                                  ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "By sign in up you agree to the Terms and conditions and Privacy policy",
                              style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have account?',
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
                                color: grayColor200,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
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
