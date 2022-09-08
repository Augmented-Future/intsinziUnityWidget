import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globaltrailblazersapp/controllers/user_account_controller.dart';
import 'package:globaltrailblazersapp/screens/pages/augmented/augmented_page.dart';
import 'package:globaltrailblazersapp/screens/pages/games/board_game.dart';
import 'package:globaltrailblazersapp/screens/pages/games/games_page.dart';
import 'package:globaltrailblazersapp/screens/pages/pastpapers/pastpapers_page.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/shop_home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/support_page.dart';

import '../../../shared/colors.dart';
import '../../../models/user_model.dart';
import '../animations/animations_page.dart';
import '../books/library_home_page.dart';
import '../index.dart';
import '../error_page.dart';
import '../profile_page.dart';
import '../tutors/tutor_homepage.dart';
import 'painters.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key, required this.userAccountController})
      : super(key: key);
  final UserAccountController userAccountController;
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  late UserAccount? _userAccount;
  @override
  void initState() {
    _userAccount = widget.userAccountController.userAccountInfo.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: <Widget>[
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    if (_userAccount?.avatarUrl != null)
                      CircleAvatar(
                        backgroundColor: brandYellowColor,
                        backgroundImage: NetworkImage(_userAccount!.avatarUrl),
                        radius: 30,
                      ),
                    if (_userAccount?.avatarUrl == null)
                      const CircleAvatar(
                        backgroundColor: brandYellowColor,
                        radius: 30,
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_userAccount?.firstName} ${_userAccount?.lastName}"
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Color(0xFFEA580C), fontSize: 16),
                          ),
                          const SizedBox(height: 3),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ProfilePage(user: _userAccount),
                                ),
                              );
                            },
                            child: Ink(
                              child: const Text(
                                'View profile',
                                style: TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    decoration: TextDecoration.underline,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const CircleAvatar(
                        backgroundColor: primaryColor,
                        foregroundColor: whiteColor,
                        radius: 16,
                        child: Icon(
                          Icons.close,
                          size: 22,
                        ),
                      ),
                    )
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
                direction: const IndexPage(
                  page: LibraryHomePage(),
                  active: "Library",
                ),
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
                direction: const GamesPage(),
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
                direction: const BoardGame(),
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
                direction: const IndexPage(
                  page: TutorHomePage(),
                  active: "",
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
                text: "Augmented World",
                direction: const AugmentedWorldPage(),
                leading: CustomPaint(
                  size: Size(40, (40 * 1).toDouble()),
                  painter: LibraryCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                        height: 23,
                        width: 23,
                        child: SvgPicture.asset('assets/icons/launch_ar.svg')),
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
                direction: const PastPapersPage(),
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
                direction: const IndexPage(
                  page: ShoppingHomePage(),
                  active: "",
                ),
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
                direction: const SupportPage(),
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
              const SizedBox(height: 80),
            ],
          ),
          Container(
            color: whiteColor,
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                  Expanded(
                    child: ShaderMask(
                      shaderCallback: (Rect rect) => const LinearGradient(
                        colors: <Color>[brandYellowColor, whiteColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(rect),
                      child: const Text(
                        'Switch to Augmented Reality',
                        style: TextStyle(color: whiteColor, fontSize: 15.0),
                      ),
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
                builder: (_) => const PageError(
                    errorDescription:
                        "The page you're looking for is under maintainance, Intsinzi App is currently being updated. Visit another page.",
                    errorMessage: "Page not found",
                    statusCode: 404),
              ),
            );
          }
        },
        title: Text(text),
      ),
    );
  }
}
