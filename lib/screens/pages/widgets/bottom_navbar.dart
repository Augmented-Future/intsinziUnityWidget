import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/books/library_home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/games/games_zone_page.dart';
import 'package:globaltrailblazersapp/screens/pages/home/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/index.dart';
import 'package:globaltrailblazersapp/screens/pages/tv_zone_page.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

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
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const IndexPage(
                  page: HomePage(),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: const [
                  Icon(Icons.home, size: 20, color: primaryColor),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 12, color: primaryColor),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const IndexPage(
                  page: TvZonePage(),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: const [
                  Icon(Icons.play_circle_fill, size: 20, color: primaryColor),
                  Text(
                    "TV",
                    style: TextStyle(fontSize: 12, color: primaryColor),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          Container(
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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
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
                margin:
                    const EdgeInsets.only(bottom: 2.5, right: 2.5, left: 2.5),
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
          ),
          Container(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const IndexPage(
                  page: LibraryHomePage(),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: const [
                  Icon(Icons.book, size: 20, color: primaryColor),
                  Text(
                    "Books",
                    style: TextStyle(fontSize: 12, color: primaryColor),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const IndexPage(
                  page: GamesZonePage(),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: const [
                  Icon(Icons.gamepad, size: 20, color: primaryColor),
                  Text(
                    "Games",
                    style: TextStyle(fontSize: 12, color: primaryColor),
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
