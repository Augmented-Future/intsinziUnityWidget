import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/augmented_world_model.dart';
import 'package:globaltrailblazersapp/models/game_model.dart';
import 'package:globaltrailblazersapp/screens/pages/games/gamepage_ar.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_category_widget.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/custom_card_widget.dart';

class AugmentedWorldPage extends StatefulWidget {
  const AugmentedWorldPage({Key? key}) : super(key: key);

  @override
  State<AugmentedWorldPage> createState() => _AugmentedWorldPageState();
}

class _AugmentedWorldPageState extends State<AugmentedWorldPage> {
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
            child: FilterCategoryWidget(pageId: 9, courseId: 5),
          ),
          buildAugmentedWorldWidget(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget buildAugmentedWorldWidget() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: buildGridCard(index, context, augmentedWorldItems),
          );
        },
        childCount: augmentedWorldItems.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  Column buildGridCard(int index, BuildContext context,
      List<AugmentedWorldItem> _augmentedWorldItems) {
    return Column(
      children: [
        CustomCardWidget(
          cardSize: 180,
          direction: GamePageAR(
            game: Game(
                id: augmentedWorldItems[index].id.toString(),
                name: augmentedWorldItems[index].name,
                courseId: augmentedWorldItems[index].courseId,
                curriculumId: augmentedWorldItems[index].curriculumId,
                gradeId: augmentedWorldItems[index].gradeId,
                creatorId: augmentedWorldItems[index].creatorId,
                chapterId: augmentedWorldItems[index].chapterId,
                image: augmentedWorldItems[index].image,
                url: augmentedWorldItems[index].url,
                slug: augmentedWorldItems[index].slug),
          ),
          img: _augmentedWorldItems[index].image,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Unit ${_augmentedWorldItems[index].chapterId}: ${_augmentedWorldItems[index].name}',
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
  double get minExtent => kToolbarHeight + 30;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
