import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/screens/pages/games/components/fun_facts_view.dart';
import 'package:globaltrailblazersapp/screens/pages/games/components/leaderboard_table.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/fun_facts.dart';

import 'widgets/board_game_button.dart';

class BoardGame extends StatefulWidget {
  const BoardGame({Key? key}) : super(key: key);

  @override
  State<BoardGame> createState() => _BoardGameState();
}

class _BoardGameState extends State<BoardGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: ShadedColorText(
                fontSize: 25,
                text: "Board Game",
              ),
            ),
            const SizedBox(height: 20),
            BoardGameButton(
              onTap: () {},
              splashColor: const Color(0xFFF8F8F8),
              svgName: "assets/images/start_game.svg",
              gradientColors: const [
                Color(0xFFEEDA36),
                Color(0xFFFFBF9D),
              ],
              label: "Start Game",
            ),
            BoardGameButton(
              onTap: () {},
              splashColor: const Color(0xFFD3D3D3),
              svgName: "assets/images/game_guide.svg",
              gradientColors: [
                const Color(0xFF831843).withOpacity(0.8),
                const Color(0xFF926A2D),
                const Color(0xFFF97418),
              ],
              label: "Game Guide",
            ),
            BoardGameButton(
              onTap: () {},
              splashColor: const Color(0xFF64C5EB),
              svgName: "assets/images/leaderboard.svg",
              gradientColors: const [
                Color(0xFF3B82F6),
                Color(0xFF0471A6),
              ],
              label: "Leaderboard",
            ),
            BoardGameButton(
              onTap: () {},
              splashColor: const Color(0xFF64C5EB),
              svgName: "assets/images/recent_players.svg",
              gradientColors: const [
                Color(0xFF3F62BC),
                Color(0xFF3AB4CF),
              ],
              label: "Recent Players",
            ),
            const SizedBox(height: 20),
            const FunFactsWidget(
              text: "Fun Facts",
              textSize: 25,
            ),
            const SizedBox(height: 20),
            const FunFactsView(),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: const Text(
                "Top Winners (Students)",
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
            ),
            const LeaderboardTable(),
          ],
        ),
      ),
      bottomNavigationBar:const BottomNavigationBarWidget(active: "Games"),
    );
  }
}
