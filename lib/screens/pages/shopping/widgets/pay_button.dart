import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/colors.dart';

class PayButton extends StatelessWidget {
  const PayButton({Key? key, required this.price}) : super(key: key);
  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {},
        splashColor: color100.withOpacity(0.5),
        highlightColor: whiteColor.withOpacity(0.2),
        child: Ink(
          decoration: const BoxDecoration(color: primaryColor),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/pay_cash.svg'),
              const SizedBox(width: 10),
              Text(
                " Pay ${price.round()} Rwf",
                style: const TextStyle(
                    color: whiteColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
