import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/screens/pages/home/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(5),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 15,
                ),
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              splashColor: whiteColor.withOpacity(0.5),
              highlightColor: brandYellowColor.withOpacity(0.5),
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                    color: brandYellowColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  children: const [
                    Text(
                      "Primary 4",
                      style: TextStyle(color: primaryColor, fontSize: 14),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {},
              child: Badge(
                badgeContent: const Text(
                  "9+",
                  style: TextStyle(color: whiteColor, fontSize: 12),
                ),
                elevation: 0.0,
                child: SvgPicture.asset('assets/icons/notification.svg'),
                position: BadgePosition.topEnd(),
              ),
            ),
            const SizedBox(width: 20),
            const CircleAvatar(
              backgroundColor: brandYellowColor,
              child: Icon(
                Icons.person,
                color: whiteColor,
              ),
            ),
          ],
        ),
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      body: Container(
          margin: const EdgeInsets.only(bottom: 80),
          child: const SingleChildScrollView(child: HomePage())),
      backgroundColor: whiteColor,
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
