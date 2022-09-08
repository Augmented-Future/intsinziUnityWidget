import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBlurImage extends StatelessWidget {
  const CustomBlurImage(
      {Key? key,
      required this.height,
      required this.imgUrl,
      required this.width})
      : super(key: key);
  final String imgUrl;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Image.network(imgUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
