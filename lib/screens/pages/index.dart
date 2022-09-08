import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/controllers/refresh_controller.dart';
import 'package:globaltrailblazersapp/models/notification_model.dart';
import 'package:globaltrailblazersapp/screens/pages/notifications/notification_page.dart';
import 'package:globaltrailblazersapp/screens/pages/profile_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/shimmer_card.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/controllers/grade_controller.dart';
import 'package:globaltrailblazersapp/controllers/user_account_controller.dart';
import '../../shared/funcs.dart';
import 'components/navigation_drawer.dart';
import 'widgets/filter_widget/all_grades_dialog.dart';

class IndexPage extends StatefulWidget {
  final Widget page;
  final String active;
  const IndexPage({Key? key, required this.page, required this.active})
      : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final userController = Get.put(UserAccountController());
  final gradeController = Get.put(GradeController());
  final refreshController = Get.put(RefreshController());
  Widget? _page;

  void _initializeData() async {
    await userController.setUserData();
    if (gradeController.currentUserGrade.value == null) {
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
                  borderRadius: BorderRadius.circular(5),
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                    ),
                  ),
                );
              }),
              const Spacer(),
              Obx(() {
                if (gradeController.currentUserGrade.value != null) {
                  return InkWell(
                    onTap: () => gradeController.grades.isEmpty
                        ? null
                        : showDialog(
                            context: context,
                            builder: (dialogContext) => AllGradesDialog(
                              gradeController: gradeController,
                            ),
                          ),
                    splashColor: whiteColor.withOpacity(0.5),
                    highlightColor: brandYellowColor.withOpacity(0.5),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          color: brandYellowColor,
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          Text(
                            gradeController.currentUserGrade.value!.name,
                            style: const TextStyle(
                                color: primaryColor, fontSize: 14),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const ShimmerCard(width: 80, height: 35);
                }
              }),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationPage(),
                  ),
                ),
                child: Badge(
                  badgeContent: Text(
                    "${notifications.length < 10 ? notifications.length : "9+"}",
                    style: const TextStyle(color: whiteColor, fontSize: 12),
                  ),
                  elevation: 0.0,
                  child: SvgPicture.asset('assets/icons/notification.svg'),
                  position: BadgePosition.topEnd(),
                ),
              ),
              const SizedBox(width: 20),
              Obx(
                () {
                  if (userController.userAccountInfo.value?.avatarUrl != null) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfilePage(
                            user: userController.userAccountInfo.value,
                          ),
                          fullscreenDialog: true,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(30),
                      highlightColor: brandYellowColor,
                      child: Ink(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                          backgroundColor: brandYellowColor,
                          backgroundImage: NetworkImage(
                              userController.userAccountInfo.value!.avatarUrl),
                        ),
                      ),
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
          width: screenWidth(context) * 0.85,
          child: NavigationDrawerWidget(userAccountController: userController),
        ),
        body: Container(
            margin: const EdgeInsets.only(bottom: 80),
            child: SingleChildScrollView(child: _page)),
        backgroundColor: whiteColor,
        bottomNavigationBar: BottomNavigationBarWidget(active: widget.active));
  }
}
