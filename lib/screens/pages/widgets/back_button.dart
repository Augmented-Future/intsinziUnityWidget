import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Ink(
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SvgPicture.asset("assets/icons/back_left.svg"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                      child: SvgPicture.asset(
                        "assets/icons/back_arrow.svg",
                        height: 18.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 25),
                SvgPicture.asset("assets/icons/back_right.svg"),
              ],
            ),
            const Text(
              "Back",
              style: TextStyle(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
