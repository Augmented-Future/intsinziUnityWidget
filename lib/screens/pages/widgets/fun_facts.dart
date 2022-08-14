import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';

class ShadedColorText extends StatelessWidget {
  final double fontSize;
  final String text;
  const ShadedColorText({Key? key, required this.fontSize, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) => const LinearGradient(
        colors: <Color>[
          Color(0xFF7F58AF),
          Color(0xFF64C5EB),
          Color(0xFFE84D8A),
          Color(0xFFFEB326)
        ],
      ).createShader(rect),
      child: Text(
        text,
        style: TextStyle(
            color: whiteColor, fontSize: fontSize, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class FunFactsWidget extends StatelessWidget {
  final String text;
  final String? leadingSvgName;
  final double? textSize;
  const FunFactsWidget(
      {Key? key, required this.text, this.leadingSvgName, this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(leadingSvgName ?? "assets/images/brain.svg"),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ShadedColorText(text: text, fontSize: textSize ?? 20),
        ),
        SvgPicture.asset('assets/images/bulb.svg')
      ],
    );
  }
}
