import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/controllers/grade_controller.dart';
import 'package:globaltrailblazersapp/models/animations_content.dart';
import 'package:globaltrailblazersapp/screens/authentication/auth_page_error.dart';
import 'package:globaltrailblazersapp/screens/pages/animations/animations_page.dart';
import 'package:globaltrailblazersapp/screens/pages/animations/video_portrait_page.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

import '../../widgets/custom_card_widget.dart';
import '../../widgets/home_cards_shimmer.dart';

class AnimationsCardView extends StatefulWidget {
  const AnimationsCardView({Key? key}) : super(key: key);

  @override
  _AnimationsCardViewState createState() => _AnimationsCardViewState();
}

class _AnimationsCardViewState extends State<AnimationsCardView> {
  List<AnimationsContent>? animationList;
  IsLoading isLoading = IsLoading.loading;
  final gradeController = Get.find<GradeController>();

  void getAnimations() async {
    isLoading = IsLoading.loading;
    dynamic result = await DatabaseService.fetchAnimations(
        gradeId: gradeController.currentUserGrade.value.id);
    if (result.runtimeType == ErrorException) {
      isLoading = IsLoading.error;
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AuthPageError(
              statusCode: result.statusCode,
              message: result.errorMessage,
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        setState(() {
          animationList = result;
          isLoading = IsLoading.done;
        });
      }
    }
  }

  @override
  void initState() {
    getAnimations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Animations Zone",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: coolGreen,
                ),
                child: const Text(
                  'Free',
                  style: TextStyle(color: whiteColor, fontSize: 8),
                ),
              ),
              ElevatedButton(
                child: const Text(
                  'View All',
                  style: TextStyle(color: primaryColor),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_context) => const AnimationsPageScreen(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: coolYellow,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: animationList?.length ?? 2,
              itemBuilder: (context, index) {
                if (isLoading == IsLoading.loading) {
                  return const HomeCardShimmerWidget();
                } else {
                  return Container(
                    width: screenWidth(context) * 0.8,
                    margin: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        CustomCardWidget(
                          cardSize: 160,
                          direction: VideoPortraitForm(
                              animation: animationList![index]),
                          img: animationList![index].image,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  animationList![index].title,
                                  style: const TextStyle(
                                    color: darkPink,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  " Unit ${animationList?[index].chapterId}, Course ${animationList?[index].courseId}",
                                  style: const TextStyle(color: darkPink),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/time_sharp.svg'),
                                    const SizedBox(width: 5),
                                    Text(
                                        "${animationList![index].createdAt.day} ${months[animationList![index].createdAt.month - 1]} ${animationList![index].createdAt.year}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/user_outlined.svg'),
                                    const SizedBox(width: 5),
                                    Text(animationList![index].creatorId),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }
}
