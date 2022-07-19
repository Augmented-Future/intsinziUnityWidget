import 'package:flutter/material.dart';

class TvZonePage extends StatefulWidget {
  const TvZonePage({Key? key}) : super(key: key);

  @override
  State<TvZonePage> createState() => _TvZonePageState();
}

class _TvZonePageState extends State<TvZonePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('TV Zone'),
      ],
    );
  }
}
