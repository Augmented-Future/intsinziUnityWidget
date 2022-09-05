import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/colors.dart';

class ShimmerCard extends StatefulWidget {
  const ShimmerCard({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;

  @override
  State<ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: whiteColor,
        ),
      ),
    );
  }
}
