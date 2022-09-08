import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/game_model.dart';

class GamePageAR extends StatefulWidget {
  const GamePageAR({Key? key, required this.game}) : super(key: key);
  final Game game;

  @override
  State<GamePageAR> createState() => _GamePageARState();
}

class _GamePageARState extends State<GamePageAR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:widget.game.url,
        onPageStarted: (url) =>
            showToast(message: "You're now good to play ${widget.game.name}"),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(active: "Games"),
    );
  }
}
