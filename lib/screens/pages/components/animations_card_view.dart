import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/animations_content.dart';
import 'package:globaltrailblazersapp/screens/pages/secondary/animations.dart';
import 'package:globaltrailblazersapp/screens/pages/secondary/video_portrait_form.dart';

class AnimationsCardView extends StatefulWidget {
  const AnimationsCardView({Key? key}) : super(key: key);

  @override
  _AnimationsCardViewState createState() => _AnimationsCardViewState();
}

class _AnimationsCardViewState extends State<AnimationsCardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Animations Zone",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: coolGreen,
                ),
                child: const Text(
                  'Free',
                  style: TextStyle(color: whiteColor, fontSize: 8),
                ),
              ),
              ElevatedButton(
                child: const Text(
                  'View All',
                  style: TextStyle(color: primaryColor),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_context) => const AnimationsPageScreen(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: coolYellow,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: animations.length,
              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth(context) * 0.8,
                  margin: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: ((screenWidth(context) * 0.6) / 2) + 20,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFD97706),
                                  Color(0xFFFBBF24),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      animations[index].featuredImage),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => VideoPortraitForm(
                                  animation: animations[index],
                                ),
                              ),
                            ),
                            icon: const Icon(Icons.play_arrow),
                            label: const Text("Play"),
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF10B981),
                                elevation: 0.0),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                animations[index].title,
                                style: const TextStyle(
                                  color: darkPink,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                " ${animations[index].unit}, ${animations[index].course}",
                                style: const TextStyle(color: darkPink),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/time_sharp.svg'),
                                  const SizedBox(width: 5),
                                  const Text('28 July 2018'),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/user_outlined.svg'),
                                  const SizedBox(width: 5),
                                  Text(animations[index].contentCreator),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
