import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _recoveryEmail = TextEditingController();
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
                      controller: _recoveryEmail,
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
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        if (_recoveryEmail.text.contains("@") &&
                            _recoveryEmail.text.toLowerCase().length > 5) {
                          displayBottomSheet(
                              context, _recoveryEmail.text.trim());
                        } else {
                          Fluttertoast.showToast(
                            msg: "Invalid email",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.grey[200],
                            textColor: primaryColor,
                            fontSize: 16.0,
                          );
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
                          'RESET',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
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

  Future<dynamic> displayBottomSheet(BuildContext context, String email) {
    final String domain = email.substring(email.indexOf('@') + 1);

    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        // height: 300,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "We've sent reset link to your email,",
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            Text(
              email,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            const Text(
              " Please check and come back. ",
              style: TextStyle(fontSize: 18.0),
            ),
            domain == 'gmail.com'
                ? TextButton.icon(
                    icon: const Icon(Icons.open_in_browser),
                    onPressed: () async {
                      Uri url = Uri.parse("https://gmail.com");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        Fluttertoast.showToast(
                          msg: "You do not have proper app to open this link. ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.grey[200],
                          textColor: primaryColor,
                          fontSize: 16.0,
                        );
                      }
                    },
                    label: const Text("Open Gmail App"),
                  )
                : TextButton.icon(
                    icon: const Icon(Icons.link),
                    onPressed: () async {
                      Uri url = Uri.parse("https://$domain");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        Fluttertoast.showToast(
                          msg: "You do not have proper app to open this link. ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.grey[200],
                          textColor: primaryColor,
                          fontSize: 16.0,
                        );
                      }
                    },
                    label: Text('Visit https://$domain'),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
                (route) => false,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, elevation: 0.0),
              child: const Text("Go to Login"),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
