import 'package:flutter/material.dart';

class GamesZonePage extends StatefulWidget {
  const GamesZonePage({Key? key}) : super(key: key);

  @override
  State<GamesZonePage> createState() => _GamesZonePageState();
}

class _GamesZonePageState extends State<GamesZonePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Games Zone'),
      ],
    );
  }
}
