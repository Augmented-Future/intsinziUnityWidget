import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/controllers/grade_controller.dart';
import 'package:globaltrailblazersapp/controllers/refresh_controller.dart';
import 'package:globaltrailblazersapp/models/filter_category.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/all_grades_dialog.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_list_dialog_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/shimmer_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/course_controller.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/funcs.dart';

class FilterCategoryWidget extends StatefulWidget {
  final bool? shopFilter;
  final int pageId;
  final int? typeId;

  const FilterCategoryWidget({
    Key? key,
    this.shopFilter,
    this.typeId,
    required this.pageId,
  }) : super(key: key);

  @override
  State<FilterCategoryWidget> createState() => _FilterCategoryWidgetState();
}

class _FilterCategoryWidgetState extends State<FilterCategoryWidget> {
  final gradeController = Get.find<GradeController>();
  final refresh = Get.find<RefreshController>();
  final courseController = Get.put(CourseController());

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
                courseController.obx(
                  (courses) => ChipButtonFilter(
                    text: capitalizeFirstLetter(
                        courseController.selectedCourse.value!.abbreviation),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: SizedBox(
                              height: courses!.length > 7
                                  ? screenHeight(context) * 0.4
                                  : 58.0 * courses.length,
                              child: ListView.builder(
                                itemCount: courses.length,
                                itemBuilder: (context, index) {
                                  bool active = courses[index].id ==
                                      courseController.selectedCourse.value!.id;
                                  return FilterDialogTile(
                                      active: active,
                                      isLast: index == courses.length - 1,
                                      text: courses[index].name,
                                      onClick: () {
                                        Navigator.pop(context);
                                        if (active) return;
                                        courseController.selectedCourse.value =
                                            courses[index];
                                        setState(() {});
                                        refresh.refreshPage();
                                      });
                                },
                              ),
                            ),
                          );
                        }),
                  ),
                  onLoading: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const ShimmerCard(width: 100, height: 35),
                  ),
                  onEmpty: ChipButtonFilter(
                    text: "No Courses",
                    onPressed: () => showToast(message: "No courses available"),
                  ),
                  onError: (error) => ChipButtonFilter(
                    text: "No Course",
                    onPressed: () => showToast(
                      message: "Error happened, $error",
                    ),
                  ),
                ),
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
                  text: getProductType(widget.typeId).name,
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
              Obx(
                () => ChipButtonFilter(
                  text: gradeController.currentUserGrade.value!.name,
                  onPressed: () => gradeController.grades.isEmpty
                      ? null
                      : showDialog(
                          context: context,
                          builder: (dialogContext) => AllGradesDialog(
                            gradeController: gradeController,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Dialog buildContentModal(BuildContext context) {
    appPages.sort((a, b) => a.content.compareTo(b.content));
    return Dialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: appPages.length > 7
            ? screenHeight(context) * 0.4
            : 58.0 * appPages.length,
        child: ListView.builder(
          itemCount: appPages.length,
          itemBuilder: (context, index) {
            bool active = appPages[index].pageId == widget.pageId;
            return FilterDialogTile(
                active: active,
                isLast: index == appPages.length - 1,
                text: appPages[index].content,
                onClick: () {
                  Navigator.pop(context);
                  if (active) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => appPages[index].page),
                  );
                });
          },
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
