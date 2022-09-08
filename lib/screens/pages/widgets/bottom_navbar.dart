import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/screens/pages/animations/animations_page.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/books/library_home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/home/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/index.dart';

import '../games/games_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, this.active = ""})
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
      height: 65,
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
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: activeHome ? whiteColor : primaryColor,
                    height: 20,
                    width: 20,
                  ),
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
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AnimationsPageScreen(),
                    ),
                  ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/tv_zone.svg',
                    color: activeAnimations ? whiteColor : primaryColor,
                    height: 20,
                    width: 20,
                  ),
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
                : Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IndexPage(
                        page: LibraryHomePage(),
                        active: "Library",
                      ),
                    ),
                    (route) => false,
                  ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/digital_book.svg',
                    color: activeLibrary ? whiteColor : primaryColor,
                    height: 20,
                    width: 20,
                  ),
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
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GamesPage(),
                    ),
                  ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/gamepad.svg',
                    color: activeGames ? whiteColor : primaryColor,
                    height: 20,
                    width: 20,
                  ),
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
      height: 60,
      width: 80,
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        padding: const EdgeInsets.fromLTRB(5, 0.0, 5, 4),
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
          padding: const EdgeInsets.all(12.5),
          decoration: BoxDecoration(
            color: coolYellow,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset('assets/icons/launch_ar.svg'),
        ),
      ),
    );
  }
}
