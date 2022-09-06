import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/screens/pages/animations/animations_page.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/books/library_home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/home/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/index.dart';

import '../games/games_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, required this.active})
      : super(key: key);
  final String active;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late bool activeHome;
  late bool activeAnimations;
  late bool activeLibrary;
  late bool activeGames;
  @override
  void initState() {
    activeHome = widget.active == "Home";
    activeAnimations = widget.active == "Animations";
    activeLibrary = widget.active == "Library";
    activeGames = widget.active == "Games";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
          color: brandYellowColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => activeHome
                ? null
                : Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IndexPage(
                        page: HomePage(),
                        active: "Home",
                      ),
                    ),
                    (route) => false,
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Icon(Icons.home,
                      size: 20, color: activeHome ? whiteColor : primaryColor),
                  Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 12,
                        color: activeHome ? whiteColor : primaryColor),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          GestureDetector(
            onTap: () => activeAnimations
                ? null
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AnimationsPageScreen(),
                    ),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Icon(Icons.play_circle_fill,
                      size: 20,
                      color: activeAnimations ? whiteColor : primaryColor),
                  Text(
                    "Animations",
                    style: TextStyle(
                        fontSize: 12,
                        color: activeAnimations ? whiteColor : primaryColor),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          const MiddleItem(),
          Container(),
          GestureDetector(
            onTap: () => activeLibrary
                ? null
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IndexPage(
                        page: LibraryHomePage(),
                        active: "Library",
                      ),
                    ),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Icon(Icons.book,
                      size: 20,
                      color: activeLibrary ? whiteColor : primaryColor),
                  Text(
                    "Library",
                    style: TextStyle(
                        fontSize: 12,
                        color: activeLibrary ? whiteColor : primaryColor),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => activeGames
                ? null
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GamesPage(),
                    ),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Icon(Icons.gamepad,
                      size: 20, color: activeGames ? whiteColor : primaryColor),
                  Text(
                    "Games Zone",
                    style: TextStyle(
                        fontSize: 12,
                        color: activeGames ? whiteColor : primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MiddleItem extends StatelessWidget {
  const MiddleItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0.0, 10, 10),
        padding: const EdgeInsets.fromLTRB(5, 0.0, 5, 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: primaryColor,
                offset: Offset(-2.5, 2.5),
                spreadRadius: 0,
                blurRadius: 0),
            BoxShadow(
                color: primaryColor,
                offset: Offset(2.5, 2.5),
                spreadRadius: 0,
                blurRadius: 0),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 2.5, right: 2.5, left: 2.5),
          width: 25,
          height: 25,
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: coolYellow,
            borderRadius: BorderRadius.circular(60),
          ),
          child: SvgPicture.asset('assets/icons/launch_ar.svg'),
        ),
      ),
    );
  }
}
