import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:shimmer/shimmer.dart';

class FilterCategoryWidget extends StatelessWidget {
  const FilterCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "Filter",
          style: TextStyle(fontSize: 18.0),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/ic_baseline-play-lesson.svg",
                  width: 15.0,
                ),
                const Text(" Content")
              ],
            ),
            Chip(
              label: const Text("Cormics"),
              deleteIcon: const Icon(Icons.arrow_drop_down),
              onDeleted: () {},
              backgroundColor: const Color(0xFFFBBF24),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/la_chalkboard-teacher.svg",
                  width: 15.0,
                ),
                const Text(" Course")
              ],
            ),
            Chip(
              label: const Text("Math"),
              deleteIcon: const Icon(Icons.arrow_drop_down),
              onDeleted: () {},
              backgroundColor: const Color(0xFFFBBF24),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/maki_school.svg",
                  width: 15.0,
                ),
                const Text(" Grade")
              ],
            ),
            Chip(
              label: const Text("Primary 4"),
              deleteIcon: const Icon(Icons.arrow_drop_down),
              onDeleted: () {},
              backgroundColor: const Color(0xFFFBBF24),
            )
          ],
        ),
      ],
    );
  }
}

class CategoryShimmerLoading extends StatelessWidget {
  const CategoryShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: screenWidth(context) / 5,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteColor,
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: screenWidth(context) / 4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteColor,
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: screenWidth(context) / 4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteColor,
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: screenWidth(context) / 4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
