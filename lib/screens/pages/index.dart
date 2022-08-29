import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/controllers/grade_controller.dart';
import 'package:globaltrailblazersapp/controllers/user_account_controller.dart';
import 'package:globaltrailblazersapp/models/grade.dart';
import 'package:globaltrailblazersapp/screens/pages/books/library_home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/games/games_zone_page.dart';
import 'package:globaltrailblazersapp/screens/pages/home/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/tv_zone_page.dart';
import '../../shared/funcs.dart';
import 'components/navigation_drawer.dart';
import 'widgets/all_grades_dialog.dart';

class IndexPage extends StatefulWidget {
  final Widget page;
  const IndexPage({Key? key, required this.page}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final userController = Get.put(UserAccountController());
  final gradeController = Get.put(GradeController());
  Widget? _page;

  void _initializeData() async {
    await userController.setUserData();
    if (gradeController.currentUserGrade.value == noGrade) {
      await gradeController
          .gettingOneGrade(userController.userAccountInfo.value!.gradeId);
    }
    await gradeController.gettingAllGrades();
  }

  @override
  void initState() {
    _page = widget.page;
    _initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Builder(builder: (context) {
              return InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                  ),
                ),
              );
            }),
            const Spacer(),
            InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (dialogContext) =>
                    AllGradesDialog(gradeController: gradeController),
              ),
              splashColor: whiteColor.withOpacity(0.5),
              highlightColor: brandYellowColor.withOpacity(0.5),
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                    color: brandYellowColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  children: [
                    Obx(
                      () => Text(
                        gradeController.currentUserGrade.value.name,
                        style:
                            const TextStyle(color: primaryColor, fontSize: 14),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            Badge(
              badgeContent: const Text(
                "9+",
                style: TextStyle(color: whiteColor, fontSize: 12),
              ),
              elevation: 0.0,
              child: SvgPicture.asset('assets/icons/notification.svg'),
              position: BadgePosition.topEnd(),
            ),
            const SizedBox(width: 20),
            Obx(
              () {
                if (userController.userAccountInfo.value?.avatarUrl != null) {
                  return CircleAvatar(
                    backgroundColor: brandYellowColor,
                    backgroundImage: NetworkImage(
                        userController.userAccountInfo.value!.avatarUrl),
                  );
                } else {
                  return const CircleAvatar(
                    backgroundColor: brandYellowColor,
                    child: Icon(
                      Icons.person,
                      color: whiteColor,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      drawer: SizedBox(
        width: screenWidth(context) * 0.95,
        child: NavigationDrawerWidget(userAccountController: userController),
      ),
      body: Container(
          margin: const EdgeInsets.only(bottom: 80),
          child: SingleChildScrollView(child: _page)),
      backgroundColor: whiteColor,
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            color: brandYellowColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => setState(() => _page = const HomePage()),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      size: 20,
                      color: _page.toString() == const HomePage().toString()
                          ? whiteColor
                          : primaryColor,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 12,
                        color: _page.toString() == const HomePage().toString()
                            ? whiteColor
                            : primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
            GestureDetector(
              onTap: () => setState(() => _page = const TvZonePage()),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(
                      Icons.play_circle_fill,
                      size: 20,
                      color: _page.toString() == const TvZonePage().toString()
                          ? whiteColor
                          : primaryColor,
                    ),
                    Text(
                      "TV",
                      style: TextStyle(
                        fontSize: 12,
                        color: _page.toString() == const TvZonePage().toString()
                            ? whiteColor
                            : primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
            const MiddleItem(),
            Container(),
            GestureDetector(
              onTap: () => setState(() => _page = const LibraryHomePage()),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(
                      Icons.book,
                      size: 24,
                      color:
                          _page.toString() == const LibraryHomePage().toString()
                              ? whiteColor
                              : primaryColor,
                    ),
                    Text(
                      "Books",
                      style: TextStyle(
                        fontSize: 12,
                        color: _page.toString() ==
                                const LibraryHomePage().toString()
                            ? whiteColor
                            : primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _page = const GamesZonePage()),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(
                      Icons.gamepad,
                      size: 20,
                      color:
                          _page.toString() == const GamesZonePage().toString()
                              ? whiteColor
                              : primaryColor,
                    ),
                    Text(
                      "Games",
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            _page.toString() == const GamesZonePage().toString()
                                ? whiteColor
                                : primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiddleItem extends StatelessWidget {
  const MiddleItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0.0, 10, 10),
        padding: const EdgeInsets.fromLTRB(5, 0.0, 5, 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: primaryColor,
                offset: Offset(-2.5, 2.5),
                spreadRadius: 0,
                blurRadius: 0),
            BoxShadow(
                color: primaryColor,
                offset: Offset(2.5, 2.5),
                spreadRadius: 0,
                blurRadius: 0),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 2.5, right: 2.5, left: 2.5),
          width: 25,
          height: 25,
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: coolYellow,
            borderRadius: BorderRadius.circular(60),
          ),
          child: SvgPicture.asset('assets/icons/launch_ar.svg'),
        ),
      ),
    );
  }
}
