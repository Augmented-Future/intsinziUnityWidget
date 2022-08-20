import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globaltrailblazersapp/screens/pages/games/board_game.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/shop_home_page.dart';

import '../../../constants/colors.dart';
import '../../../models/user.dart';
import '../animations/animations_page.dart';
import '../books/library_home_page.dart';
import '../index.dart';
import '../page_404.dart';
import '../profile_page.dart';
import 'painters.dart';

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
                    if (widget.user?.avatarUrl != null)
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        backgroundImage: NetworkImage(widget.user!.avatarUrl),
                        radius: 30,
                      ),
                    if (widget.user?.avatarUrl == null)
                      const CircleAvatar(
                        backgroundColor: brandYellowColor,
                        radius: 30,
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.user?.firstName} ${widget.user?.lastName}"
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
                direction: const IndexPage(page: LibraryHomePage()),
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
                direction: const IndexPage(page: BoardGame()),
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
                direction: const IndexPage(page: ShoppingHomePage()),
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
              const SizedBox(height: 100),
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
