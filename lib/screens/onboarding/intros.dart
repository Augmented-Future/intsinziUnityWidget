import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';
import 'package:globaltrailblazersapp/screens/onboarding/vars.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _index = 0;

  void _nextTip() async {
    if (_index >= 2) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('skipIntro', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      setState(() {
        _index++;
      });
    }
  }

  Color _getColor(index) {
    if (_index == index) {
      return Colors.white;
    }
    return grayColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.bottomCenter,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
          color: bodyBackgrounds[_index],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: _nextTip,
                child: Ink(
                  padding: const EdgeInsets.fromLTRB(12, 15, 25, 0),
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                        color: skipColors[_index],
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  avatars[_index],
                  width: 600,
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 130),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bottomColors[_index],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                  top: 48,
                  bottom: 48,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        texts[_index][0],
                        style: TextStyle(color: textColors[_index]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        texts[_index][1],
                        style: TextStyle(color: textColors[_index]),
                      ),
                    ),
                    Text(
                      texts[_index][2],
                      style: TextStyle(color: textColors[_index]),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 48, bottom: 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => _index = 0),
                            child: Container(
                              height: 6,
                              width: _index == 0 ? 31 : 14,
                              decoration: BoxDecoration(
                                color: _getColor(0),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () => setState(() => _index = 1),
                            child: Container(
                              height: 6,
                              width: _index == 1 ? 31 : 14,
                              decoration: BoxDecoration(
                                color:
                                    _index == 1 ? primaryColor : _getColor(1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () => setState(() => _index = 2),
                            child: Container(
                              height: 6,
                              width: _index == 2 ? 31 : 14,
                              decoration: BoxDecoration(
                                color: _getColor(2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _nextTip,
                      child: Container(
                        alignment: Alignment.center,
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/${goBackgrounds[_index]}"),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          'GO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: goColors[_index]),
                        ),
                      ),
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
