import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/screens/pages/tutors/tutors_page.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';

import '../../../shared/colors.dart';

class TutorHomePage extends StatefulWidget {
  const TutorHomePage({Key? key}) : super(key: key);

  @override
  State<TutorHomePage> createState() => _TutorHomePageState();
}

class _TutorHomePageState extends State<TutorHomePage> {
  double coolYellowHeight = 275;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ShaderMask(
              shaderCallback: (Rect rect) => const LinearGradient(
                colors: <Color>[
                  Color(0xFFAF5858),
                  Color(0xFFE84D8A),
                  Color(0xFFE84D8A),
                  Color(0xFFE84D8A),
                  Color(0xFFFEB326),
                  Color(0xFFFEB326),
                ],
              ).createShader(rect),
              child: const Text(
                'Looking for a tutor?',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            color: coolYellow,
                            height: coolYellowHeight,
                            width: screenWidth(context) * 0.5,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: whiteColor,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50),
                                Image.asset('assets/images/self_edu.png'),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: whiteColor.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(
                                        Icons.thumb_up,
                                        size: 12,
                                        color: Color(0xFFFF7359),
                                      ),
                                      Text(
                                        "92% Positive Feedback",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFFF7359)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1, 5),
                                  color: grayColor200,
                                  blurRadius: 15,
                                )
                              ],
                            ),
                            width: screenWidth(context) * 0.5,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/crown.svg'),
                                              const Expanded(
                                                child:
                                                    Text("Mathematics Tutor"),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.verified,
                                                color: coolGreen,
                                                size: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "John Mayers",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 40,
                                      color: grayColor200,
                                      child: Image.asset(
                                        'assets/images/rwanda.png',
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.timer,
                                            size: 20,
                                            color: color100,
                                          ),
                                          SizedBox(width: 3),
                                          Expanded(
                                            child: Text(
                                              "Taught 20+ hours",
                                              style: TextStyle(fontSize: 12.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: const [
                                          CircleAvatar(
                                            radius: 9,
                                            backgroundColor: color100,
                                            child: Text(
                                              "\$",
                                              style: TextStyle(
                                                  fontSize: 10.5,
                                                  color: whiteColor),
                                            ),
                                          ),
                                          SizedBox(width: 3),
                                          Expanded(
                                            child: Text(
                                              "10000 FRW/Hr",
                                              style: TextStyle(fontSize: 12.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: coolYellowHeight - 16,
                        right: 11.5,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0xFFF97316),
                          child: SvgPicture.asset(
                            'assets/icons/send.svg',
                            width: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Find your perfect tutor",
                          style: TextStyle(
                              color: Color(0xFFFF7359),
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                            "We Help you find the best tutor in various courses for free \n\nFind and contact the best tutors according to your needs schedule your lesson with your tutor or coach from your dashboard"),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  Text(
                                    "100k+",
                                    style: TextStyle(
                                      color: Color(0xFFBE185D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Tutors",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: const [
                                  Text(
                                    "100+",
                                    style: TextStyle(
                                      color: Color(0xFFBE185D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Students",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: const [
                                  Text(
                                    "900+",
                                    style: TextStyle(
                                      color: Color(0xFFBE185D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Courses",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 60,
                left: screenWidth(context) / 2.8,
                child: SvgPicture.asset('assets/icons/find_dir.svg'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  onPressed: () => Get.to(() => const TutorsPage()),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: primaryColor,
                  ),
                  label: const Text(
                    "Get started",
                    style: TextStyle(color: primaryColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: filterYellow,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    shadowColor: Colors.transparent,
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Learn more"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  shadowColor: Colors.transparent,
                  shape: const StadiumBorder(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("TOP RATED TUTORS"),
        ],
      ),
    );
  }
}
