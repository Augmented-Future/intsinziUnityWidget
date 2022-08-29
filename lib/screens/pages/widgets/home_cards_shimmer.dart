import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/colors.dart';
import '../../../shared/funcs.dart';

class HomeCardShimmerWidget extends StatelessWidget {
  const HomeCardShimmerWidget({Key? key, this.fullWidth}) : super(key: key);
  final bool? fullWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          fullWidth == true ? screenWidth(context) : screenWidth(context) * 0.7,
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 110,
              height: 110,
              margin: const EdgeInsets.fromLTRB(10, 10, 5, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 28,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: whiteColor,
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 28,
                    width: 85,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: whiteColor,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
