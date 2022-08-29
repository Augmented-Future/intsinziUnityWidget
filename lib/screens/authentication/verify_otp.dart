import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                const Text(
                  'VERIFY ACCOUNT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Enter OTP we've sent to your email",
                  style: TextStyle(color: grayColor200),
                ),
                const SizedBox(height: 24),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin1) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: softGray,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin2) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: softGray,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin3) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: softGray,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onSaved: (pin4) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: softGray,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 16),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/fullBtn.png"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Text(
                      'SUBMIT',
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
                      'Didn’t get any code?',
                      style: TextStyle(color: grayColor200),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Send again',
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
    );
  }
}
