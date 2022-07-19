import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/books_zone_page.dart';
import 'package:globaltrailblazersapp/screens/pages/games_zone_page.dart';
import 'package:globaltrailblazersapp/screens/pages/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/tv_zone_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String? _selectedCategory;
  int currentIndex = 0;

  final List _pages = [
    const HomePage(),
    const TvZonePage(),
    const BooksZonePage(),
    const GamesZonePage(),
  ];
  var categories = [
    "Primary 4",
    "Primary 5",
    "Primary 6",
    "Cormics",
    "Mathematics"
  ];

  @override
  void initState() {
    _selectedCategory = "Primary 4";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset('assets/icons/menu.svg'),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (_) => Dialog(
                backgroundColor: whiteColor,
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(categories[index]),
                      );
                    }),
              ),
            ),
            child: Chip(
              label: Text(
                _selectedCategory!,
                style: const TextStyle(color: primaryColor),
              ),
              deleteIcon: const Icon(Icons.arrow_drop_down),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              onDeleted: () {},
              backgroundColor: const Color(0xFFEEDA36),
            ),
          ),
          const SizedBox(width: 20),
          Badge(
            badgeContent: const Text(
              "9+",
              style: TextStyle(color: whiteColor, fontSize: 12),
            ),
            elevation: 0.0,
            child: SvgPicture.asset('assets/icons/notification.svg'),
            position: BadgePosition.topEnd(),
          ),
          const SizedBox(width: 20),
          const CircleAvatar(
            backgroundColor: primaryColor,
            backgroundImage: AssetImage('assets/images/Avatar.jpeg'),
            radius: 25,
          ),
        ]),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _pages[currentIndex],
      backgroundColor: whiteColor,
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
            color: brandYellowColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => setState(() => currentIndex = 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.home,
                        size: 24,
                        color: currentIndex == 0 ? whiteColor : primaryColor),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 14,
                          color: currentIndex == 0 ? whiteColor : primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
            GestureDetector(
              onTap: () => setState(() => currentIndex = 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.play_circle_fill,
                        size: 24,
                        color: currentIndex == 1 ? whiteColor : primaryColor),
                    const SizedBox(height: 3),
                    Text(
                      "TV",
                      style: TextStyle(
                          fontSize: 14,
                          color: currentIndex == 1 ? whiteColor : primaryColor),
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
              onTap: () => setState(() => currentIndex = 2),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.book,
                        size: 24,
                        color: currentIndex == 2 ? whiteColor : primaryColor),
                    Text(
                      "Books",
                      style: TextStyle(
                          fontSize: 14,
                          color: currentIndex == 2 ? whiteColor : primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => currentIndex = 3),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.gamepad,
                        size: 24,
                        color: currentIndex == 3 ? whiteColor : primaryColor),
                    Text(
                      "Games",
                      style: TextStyle(
                          fontSize: 14,
                          color: currentIndex == 3 ? whiteColor : primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
