import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/grade.dart';
import 'package:globaltrailblazersapp/models/user.dart';
import 'package:globaltrailblazersapp/screens/pages/books_zone_page.dart';
import 'package:globaltrailblazersapp/screens/pages/components/painters.dart';
import 'package:globaltrailblazersapp/screens/pages/games_zone_page.dart';
import 'package:globaltrailblazersapp/screens/pages/home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/page_404.dart';
import 'package:globaltrailblazersapp/screens/pages/profile_page.dart';
import 'package:globaltrailblazersapp/screens/pages/secondary/animations.dart';
import 'package:globaltrailblazersapp/screens/pages/tv_zone_page.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexPage extends StatefulWidget {
  final int index;
  const IndexPage({Key? key, required this.index}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Grade? _selectedGrade;
  int? currentIndex;
  UserAccount? _userAccount;

  final List _pages = [
    const HomePage(), //0
    const TvZonePage(), //1
    const BooksZonePage(), //2
    const GamesZonePage(), //3
  ];
  List<Grade>? grades;
  void _setUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String>? userString = prefs.getStringList("user");
      dynamic grade =
          await DatabaseService.fetchOneGrade(int.parse(userString![1]));
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
    } catch (e) {
      print("Something went wrong $e");
    }
  }

  void _getAllGrades() async {
    dynamic result = await DatabaseService.fetchAllGrades();
    if (result.runtimeType != ErrorException) {
      setState(() {
        grades = result;
      });
    } else {}
  }

  @override
  void initState() {
    currentIndex = widget.index;
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
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: SvgPicture.asset('assets/icons/menu.svg'),
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
                    child: Chip(
                      label: Text(
                        _selectedGrade!.name,
                        style: const TextStyle(color: primaryColor),
                      ),
                      deleteIcon: const Icon(Icons.arrow_drop_down),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onDeleted: () {},
                      backgroundColor: const Color(0xFFEEDA36),
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: SizedBox(
        width: screenWidth(context) * 0.95,
        child: NavigationDrawerWidget(user: _userAccount),
      ),
      body: _pages[currentIndex!],
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
              onTap: () => setState(() => currentIndex = 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.home,
                        size: 24,
                        color: currentIndex == 0 ? whiteColor : primaryColor),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 14,
                          color: currentIndex == 0 ? whiteColor : primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
            GestureDetector(
              onTap: () => setState(() => currentIndex = 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.play_circle_fill,
                        size: 24,
                        color: currentIndex == 1 ? whiteColor : primaryColor),
                    const SizedBox(height: 3),
                    Text(
                      "TV",
                      style: TextStyle(
                          fontSize: 14,
                          color: currentIndex == 1 ? whiteColor : primaryColor),
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
              onTap: () => setState(() => currentIndex = 2),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.book,
                        size: 24,
                        color: currentIndex == 2 ? whiteColor : primaryColor),
                    Text(
                      "Books",
                      style: TextStyle(
                          fontSize: 14,
                          color: currentIndex == 2 ? whiteColor : primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => currentIndex = 3),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.gamepad,
                        size: 24,
                        color: currentIndex == 3 ? whiteColor : primaryColor),
                    Text(
                      "Games",
                      style: TextStyle(
                          fontSize: 14,
                          color: currentIndex == 3 ? whiteColor : primaryColor),
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

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key, required this.user})
      : super(key: key);
  final UserAccount? user;
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final LinearGradient _gradient = const LinearGradient(colors: <Color>[
    whiteColor,
    whiteColor,
    Color(0xFFFEB326),
    whiteColor,
    Color(0xFFFEB326),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: <Widget>[
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(),
                    CircleAvatar(
                      backgroundColor: primaryColor,
                      backgroundImage:
                          NetworkImage("${widget.user?.avatarUrl}"),
                      radius: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.user?.firstName} ${widget.user?.lastName}",
                          style: const TextStyle(
                              color: Color(0xFFEA580C), fontSize: 16),
                        ),
                        const SizedBox(height: 3),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProfilePage(user: widget.user),
                              ),
                            );
                          },
                          child: Ink(
                            child: const Text(
                              'View profile',
                              style: TextStyle(
                                  color: Color(0xFFC4C4C4),
                                  decoration: TextDecoration.underline,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      splashColor: whiteColor,
                      highlightColor: brandYellowColor.withOpacity(0.5),
                      child: Ink(
                        padding: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: SvgPicture.asset('assets/icons/close.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              buildMenuItem(
                text: "Animations",
                direction: const AnimationsPageScreen(),
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: AnimationsCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/animation_tile.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Library",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: LibraryCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/library.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Games",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: GamesCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/game.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Board Game",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: BoardCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/gameboard.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Tutors",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: TutorsCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/tutors.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Sakwe Sakwe",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: SakweSakweCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/sakwesakwe.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Imigani",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: ImiganiCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/sakwesakwe.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Safe Guarding Tips",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: SafeGuardingCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/safe.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Past papers",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: PastPapersCustomPainter(
                      colorHere: const Color(0xFFEF4444)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/pastpapers.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Assesments",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: PastPapersCustomPainter(
                      colorHere: const Color(0xFF3B82F6)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/pastpapers.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Shop",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: PastPapersCustomPainter(
                      colorHere: const Color(0xFFD96980)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/shopping-cart.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Messaging",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: PastPapersCustomPainter(
                      colorHere: const Color(0xFF672ED6)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/messaging.png'),
                  ),
                ),
              ),
              buildMenuItem(
                text: "Support",
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: PastPapersCustomPainter(
                      colorHere: const Color(0xFFEF4444)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/help.png'),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
          Container(
            color: whiteColor,
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF581C87),
                    Color(0xFF831843),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/switch_ar.png'),
                  ShaderMask(
                    shaderCallback: (Rect rect) {
                      return _gradient.createShader(rect);
                    },
                    child: const Text(
                      'Switch to Augmented Reality',
                      style: TextStyle(color: whiteColor, fontSize: 15.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required CustomPaint leading, Widget? direction}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: leading,
        onTap: () {
          if (direction != null) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => direction),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Page404(
                  message: "Page Not Found!",
                  error: "Error 404",
                ),
              ),
            );
          }
        },
        title: Text(text),
      ),
    );
  }
}
