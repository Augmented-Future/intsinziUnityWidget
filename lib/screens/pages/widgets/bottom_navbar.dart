import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  void initState() {
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
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/home.svg',
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
                const Text(
                  "Home",
                  style: TextStyle(fontSize: 12, color: primaryColor),
                ),
              ],
            ),
          ),
          Container(),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/tv_zone.svg',
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
                const Text(
                  "Animations",
                  style: TextStyle(fontSize: 12, color: primaryColor),
                ),
              ],
            ),
          ),
          Container(),
          GestureDetector(
            onTap: () {
              //Launch AR
            },
            child: const MiddleItem(),
          ),
          Container(),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/digital_book.svg',
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
                const Text(
                  "Library",
                  style: TextStyle(fontSize: 12, color: primaryColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/gamepad.svg',
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
                const Text(
                  "Games Zone",
                  style: TextStyle(fontSize: 12, color: primaryColor),
                ),
              ],
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
