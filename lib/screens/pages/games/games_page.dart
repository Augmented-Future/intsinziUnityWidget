import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/screens/pages/games/gamepage_ar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/custom_card_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_category_widget.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/grade_controller.dart';
import '../../../controllers/refresh_controller.dart';
import '../../../models/game_model.dart';
import '../components/animation_shimmer_card.dart';
import '../widgets/back_app_bar.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  List<Game>? _games;

  final gradeController = Get.find<GradeController>();
  final refresh = Get.find<RefreshController>();

  late IsLoading isLoading;
  ErrorException? _error;
  void getGames() async {
    isLoading = IsLoading.loading;
    dynamic result = await DatabaseService.fetchGames(
        gradeId: gradeController.currentUserGrade.value?.id ?? 1);
    if (result.runtimeType == ErrorException && mounted) {
      setState(() {
        _error = result;
        isLoading = IsLoading.failed;
      });
    } else if (result.isNotEmpty && mounted) {
      setState(() {
        _games = result;
        isLoading = IsLoading.done;
      });
    } else if (result.isEmpty && mounted) {
      setState(() {
        _error = ErrorException(
            statusCode: 204,
            error: "No Content",
            errorMessage: "No game matching selected category");
        isLoading = IsLoading.failed;
      });
    }
  }

  @override
  void initState() {
    getGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (refresh.refreshValue.value == true) {
        getGames();
        refresh.unrefreshPage();
      }
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(expandedHeight: 300),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: FilterCategoryWidget(pageId: 4),
            ),
            if (isLoading == IsLoading.loading)
              buildLoadingWidget()
            else if (isLoading == IsLoading.failed)
              buildErrorWidget()
            else
              buildGamesWidget(),
          ],
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(
          active: "Games",
        ),
      );
    });
  }

  SliverGrid buildLoadingWidget() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const MyCustomShimmerAnimationsWidget();
        },
        childCount: 8,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  SliverToBoxAdapter buildErrorWidget() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Lottie.asset("assets/lottie/not_found.json"),
          ),
          Text(
            "${_error!.statusCode} (${_error!.error}) - ${_error!.errorMessage}",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => refresh.refreshPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: color100,
              elevation: 0.0,
              shadowColor: Colors.transparent,
              shape: const StadiumBorder(),
            ),
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }

  Widget buildGamesWidget() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCardWidget(
                  cardSize: 200,
                  isGame: true,
                  direction: GamePageAR(
                    game: _games![index],
                  ),
                  img: _games![index].image,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "${_games![index].name} (Unit ${_games![index].chapterId})\n",
                            style: const TextStyle(
                              color: Color(0xFFBE185D),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text:
                                "By Augmented Future ${_games![index].creatorId}",
                            style: const TextStyle(
                              color: blackColor,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          childCount: _games!.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
        ),
      ),
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
