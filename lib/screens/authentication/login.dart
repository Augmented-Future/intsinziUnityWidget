import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/authentication/auth_page_error.dart';
import 'package:globaltrailblazersapp/screens/authentication/forgot_pwd.dart';
import 'package:globaltrailblazersapp/screens/authentication/register.dart';
import 'package:globaltrailblazersapp/screens/index.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                      onTap: () {},
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
                              "Login in with Google",
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
                        'LOGIN WITH EMAIL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextField(
                      controller: _email,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                        filled: true,
                        fillColor: softGray,
                        contentPadding: const EdgeInsets.all(0.0),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/mail_box.svg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _password,
                      autofocus: false,
                      obscureText: true,
                      obscuringCharacter: '*',
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                        filled: true,
                        fillColor: softGray,
                        contentPadding: const EdgeInsets.all(0.0),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
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
                      highlightColor: Colors.white,
                      splashColor: Colors.red,
                      onTap: () async {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) =>
                              const BottomSheetLoadingIndicator(),
                        );
                        dynamic result =
                            await AuthService.loginWithEmailAndPassword(
                                _email.text, _password.text);

                        if (result.runtimeType == ErrorException) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AuthPageError(
                                statusCode: result.statusCode,
                                message: result.errorMessage,
                              ),
                            ),
                          );
                        } else {
                          List<String> userData = [
                            result.id.toString(),
                            result.gradeId.toString(),
                            result.email,
                            result.firstName,
                            result.lastName,
                            result.avatarUrl
                          ];
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setStringList("user", userData);
                          if (prefs.getStringList("user") != null &&
                              prefs.getStringList("user") != [] &&
                              await prefs.setBool("signedIn", true)) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const IndexPage(index: 0),
                              ),
                              (route) => false,
                            );
                          }
                        }
                      },
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
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ForgotPasswordScreen())),
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(color: grayColor200),
                      ),
                    ),
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
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: const Text(
                            'Register',
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

class BottomSheetLoadingIndicator extends StatelessWidget {
  const BottomSheetLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      height: 200,
      child: const SizedBox(
        height: 60,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScaleParty,
          colors: [primaryColor, brandYellowColor, coolGreen, color100],
          strokeWidth: 2,
        ),
      ),
    );
  }
}
