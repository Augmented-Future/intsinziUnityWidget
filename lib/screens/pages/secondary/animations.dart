import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/animations_content.dart';
import 'package:globaltrailblazersapp/screens/authentication/auth_page_error.dart';
import 'package:globaltrailblazersapp/screens/pages/secondary/video_portrait_form.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_button.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';
import 'package:shimmer/shimmer.dart';

class AnimationsPageScreen extends StatefulWidget {
  const AnimationsPageScreen({Key? key}) : super(key: key);

  @override
  State<AnimationsPageScreen> createState() => _AnimationsPageScreenState();
}

class _AnimationsPageScreenState extends State<AnimationsPageScreen> {
  Map? data;
  bool isLoading = true;
  List<AnimationsContent>? animationList;

  void getAnimations() async {
    dynamic result = await DatabaseService.fetchAnimations();
    if (result.runtimeType == ErrorException) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AuthPageError(
            statusCode: result.statusCode,
            message: result.errorMessage,
          ),
        ),
      );
    } else {
      setState(() {
        animationList = result;
        isLoading = false;
      });
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
          SliverToBoxAdapter(
            child: isLoading
                ? const CategoryShimmerLoading()
                : const FilterCategoryWidget(),
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
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://cdn.pixabay.com/photo/2022/07/28/23/42/rainbow-7350780_1280.jpg",
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 0, 4),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VideoPortraitForm(
                      animation: _animationsList![index],
                    ),
                  ),
                ),
                icon: const Icon(Icons.play_arrow),
                label: const Text("Play"),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF10B981), elevation: 0.0),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${_animationsList?[index].unit}: ${_animationsList?[index].title}',
            style: const TextStyle(color: blackColor, fontSize: 16),
          ),
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
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}

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
        child: AppBar(
          title: const BackButtonWidget(),
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
        ),
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
