import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';

class BoardGameButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color splashColor;
  final List<Color> gradientColors;
  final String svgName;
  final String label;
  const BoardGameButton(
      {Key? key,
      required this.onTap,
      required this.splashColor,
      required this.svgName,
      required this.gradientColors,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        splashColor: splashColor.withOpacity(0.4),
        child: Ink(
          width: screenWidth(context),
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: gradientColors,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(svgName),
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
