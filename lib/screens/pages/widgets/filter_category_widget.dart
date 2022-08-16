import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/filter_category.dart';
import 'package:shimmer/shimmer.dart';

class FilterCategoryWidget extends StatefulWidget {
  final bool? shopFilter;
  final int pageId, gradeId;
  final int? typeId, courseId;

  const FilterCategoryWidget(
      {Key? key,
      this.shopFilter,
      this.typeId,
      this.courseId,
      required this.pageId,
      required this.gradeId})
      : super(key: key);

  @override
  State<FilterCategoryWidget> createState() => _FilterCategoryWidgetState();
}

class _FilterCategoryWidgetState extends State<FilterCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
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
              ChipButtonFilter(
                text: getContent(widget.pageId).content,
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) {
                    return buildContentModal(context);
                  },
                ),
              ),
            ],
          ),
          if (widget.shopFilter == null || widget.shopFilter == false)
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
                ChipButtonFilter(text: "English", onPressed: () {}),
              ],
            ),
          if (widget.shopFilter == true)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/la_chalkboard-teacher.svg",
                      width: 15.0,
                    ),
                    const Text(" Type")
                  ],
                ),
                ChipButtonFilter(
                  text: "Printable",
                  onPressed: () {},
                ),
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
              ChipButtonFilter(
                text: "Primary 4",
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Dialog buildContentModal(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Container(
        height: appPages.length > 7
            ? screenHeight(context) * 0.4
            : 58.0 * appPages.length,
        width: screenWidth(context),
        color: Colors.white,
        child: ListView.builder(
          itemCount: appPages.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (appPages[index].pageId == widget.pageId) {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => appPages[index].page,
                  ),
                );
              }
            },
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 35),
                  decoration: BoxDecoration(
                    color: appPages[index].pageId == widget.pageId
                        ? filterYellow.withOpacity(0.8)
                        : whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appPages[index].content,
                        style:
                            const TextStyle(color: primaryColor, fontSize: 18),
                      ),
                      if (appPages[index].pageId == widget.pageId)
                        SvgPicture.asset(
                          'assets/icons/white_checkmark.svg',
                          color: primaryColor,
                          width: 20,
                        ),
                    ],
                  ),
                ),
                if (index != appPages.length - 1)
                  Divider(
                    height: 1.0,
                    color: blackColor.withOpacity(0.2),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChipButtonFilter extends StatelessWidget {
  const ChipButtonFilter(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onPressed,
        highlightColor: coolYellow,
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              color: const Color(0xFFFBBF24),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
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
