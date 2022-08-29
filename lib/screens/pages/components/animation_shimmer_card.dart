import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/colors.dart';

class MyCustomShimmerAnimationsWidget extends StatelessWidget {
  const MyCustomShimmerAnimationsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 200,
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 200,
            height: 33,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
