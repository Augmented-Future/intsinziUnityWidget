import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/books/audio_books.dart';
import 'package:globaltrailblazersapp/screens/pages/books/digital_books.dart';

class LibraryHomePage extends StatefulWidget {
  const LibraryHomePage({Key? key}) : super(key: key);

  @override
  State<LibraryHomePage> createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
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
              'Library',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: 200,
                decoration: const BoxDecoration(
                  color: coolYellow,
                ),
                child: Image.asset('assets/images/read_books.png'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Access to knowledge",
                        style: TextStyle(
                            color: Color(0xFFFF7359),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "We Help you find the best tutor in various courses for free",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Find and contact the best tutors according to your needs schedule your lesson with your tutor or",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Get.to(() => const DigitalBooksZone()),
              highlightColor: brandYellowColor.withOpacity(0.6),
              splashColor: coolYellow,
              borderRadius: BorderRadius.circular(18),
              child: Ink(
                padding: const EdgeInsets.all(18),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/digital_book.svg'),
                    const SizedBox(height: 3),
                    const Text(
                      "Digital \n Books",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () => Get.to(() => const AudioBooksZone()),
              highlightColor: brandYellowColor.withOpacity(0.6),
              splashColor: coolYellow,
              borderRadius: BorderRadius.circular(18),
              child: Ink(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/audio_book.svg'),
                    const SizedBox(height: 3),
                    const Text(
                      "Audio \n Books",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
