import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/animations_content.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Animations Zone",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              child: const Text(
                'Free',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: coolGreen,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            ElevatedButton(
              child: const Text(
                'View All',
                style: TextStyle(color: primaryColor),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: coolYellow,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
          ],
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
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/Avatar.jpeg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow),
                            label: const Text("Play"),
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF10B981),
                                elevation: 0.0),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Trailblazers 1",
                              style: TextStyle(
                                color: darkPink,
                              ),
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              "Chapter 3, Mathematics",
                              style: TextStyle(color: darkPink),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/time_sharp.svg'),
                                const SizedBox(width: 5),
                                const Text("28 March 2018"),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/user_outlined.svg'),
                                const SizedBox(width: 5),
                                const Text("Adenkule Gold"),
                              ],
                            ),
                          ],
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
