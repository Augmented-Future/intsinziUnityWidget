import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/grade.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:globaltrailblazersapp/screens/pages/books/library_home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/games/games_zone_page.dart';
import 'package:globaltrailblazersapp/screens/pages/home/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/tv_zone_page.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/cart_controller.dart';
import 'components/navigation_drawer.dart';

class IndexPage extends StatefulWidget {
  final Widget page;
  const IndexPage({Key? key, required this.page}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
    final cartController = Get.put(CartController());
  Grade? _selectedGrade;
  UserAccount? _userAccount;
  Widget? _page;

  List<Grade>? grades;
  void _setUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String>? userString = prefs.getStringList("user");
      dynamic grade =
          await DatabaseService.fetchOneGrade(int.parse(userString![1]));

      if (mounted) {
        setState(() {
          _userAccount = UserAccount(
            id: int.parse(userString[0]),
            email: userString[2],
            firstName: userString[3],
            lastName: userString[4],
            avatarUrl: userString[5],
            gradeId: int.parse(userString[1]),
          );
          if (grade != null) {
            _selectedGrade = grade;
          } else {
            _selectedGrade = Grade(
              id: "null",
              name: "No category",
              curriculumnId: "null",
            );
          }
        });
      }
    } catch (e) {
      // print("Something went wrong $e");
    }
  }

  void _getAllGrades() async {
    dynamic result = await DatabaseService.fetchAllGrades();
    if (result.runtimeType != ErrorException) {
      if (mounted) {
        setState(() {
          grades = result;
        });
      }
    } else {}
  }

  @override
  void initState() {
    _page = widget.page;
    _selectedGrade = Grade(
      id: "null",
      name: "Loading..",
      curriculumnId: "null",
    );
    _setUserData();
    _getAllGrades();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
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
          grades == null
              ? Container()
              : InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        height: 280,
                        child: ListView.builder(
                            itemCount: grades?.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Center(
                                        child: Text(
                                      grades![index].name,
                                      style:
                                          const TextStyle(color: primaryColor),
                                    )),
                                    onTap: () {
                                      setState(() =>
                                          _selectedGrade = grades![index]);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const Divider(
                                    height: 0.0,
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
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
                        Text(
                          _selectedGrade!.name,
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
          CircleAvatar(
            backgroundColor: brandYellowColor,
            backgroundImage: _userAccount?.avatarUrl != null
                ? NetworkImage(_userAccount?.avatarUrl ?? "")
                : const NetworkImage(
                    "https://t4.ftcdn.net/jpg/02/29/75/83/240_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg",
                  ),
            radius: 25,
          ),
        ]),
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      drawer: SizedBox(
        width: screenWidth(context) * 0.95,
        child: NavigationDrawerWidget(user: _userAccount),
      ),
      body: SingleChildScrollView(child: _page),
      backgroundColor: whiteColor,
      bottomNavigationBar: Container(
        height: 100,
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
                      size: 24,
                      color: _page.toString() == const HomePage().toString()
                          ? whiteColor
                          : primaryColor,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 14,
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
                      size: 24,
                      color: _page.toString() == const TvZonePage().toString()
                          ? whiteColor
                          : primaryColor,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "TV",
                      style: TextStyle(
                        fontSize: 14,
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
            Container(
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
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
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
                  margin:
                      const EdgeInsets.only(bottom: 2.5, right: 2.5, left: 2.5),
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
            ),
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
                        fontSize: 14,
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
                      size: 24,
                      color:
                          _page.toString() == const GamesZonePage().toString()
                              ? whiteColor
                              : primaryColor,
                    ),
                    Text(
                      "Games",
                      style: TextStyle(
                        fontSize: 14,
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
