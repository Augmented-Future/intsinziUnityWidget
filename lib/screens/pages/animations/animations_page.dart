import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/controllers/grade_controller.dart';
import 'package:globaltrailblazersapp/models/animations_content.dart';
import 'package:globaltrailblazersapp/screens/authentication/auth_page_error.dart';
import 'package:globaltrailblazersapp/screens/pages/animations/video_portrait_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_category_widget.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

import '../components/animation_shimmer_card.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/custom_card_widget.dart';

class AnimationsPageScreen extends StatefulWidget {
  const AnimationsPageScreen({Key? key}) : super(key: key);

  @override
  State<AnimationsPageScreen> createState() => _AnimationsPageScreenState();
}

class _AnimationsPageScreenState extends State<AnimationsPageScreen> {
  Map? data;
  bool isLoading = true;
  List<AnimationsContent>? animationList;
  final gradeController = Get.find<GradeController>();

  void getAnimations() async {
    dynamic result = await DatabaseService.fetchAnimations(gradeId: gradeController.currentUserGrade.value.id);
    if (result.runtimeType == ErrorException) {
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
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(expandedHeight: 300),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: FilterCategoryWidget(pageId: 0, courseId: 5),
          ),
          buildAnimationWidget(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget buildAnimationWidget() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: isLoading
                ? const MyCustomShimmerAnimationsWidget()
                : buildGridCard(index, context, animationList),
          );
        },
        childCount: isLoading ? 8 : animationList?.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  Column buildGridCard(int index, BuildContext context,
      List<AnimationsContent>? _animationsList) {
    return Column(
      children: [
        CustomCardWidget(
          cardSize: 180,
          direction: VideoPortraitForm(animation: animationList![index]),
          img: animationList![index].image,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Unit ${_animationsList?[index].chapterId}: ${_animationsList?[index].title}',
              overflow: TextOverflow.visible,
              style: const TextStyle(color: blackColor, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  const CustomSliverAppBarDelegate({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
      ],
    );
  }

  double appear(double shrinkOffSet) => shrinkOffSet / expandedHeight;
  double disappear(double shrinkOffSet) => 1 - shrinkOffSet / expandedHeight;

  Widget buildAppBar(double shrinkOffSet) => Opacity(
        opacity: appear(shrinkOffSet),
        child: BackAppBar.buildAppbar(),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.asset(
          'assets/images/kezamanzi.png',
          fit: BoxFit.cover,
        ),
      );
  @override
  double get maxExtent => expandedHeight;
  @override
  double get minExtent => kToolbarHeight + 50;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
