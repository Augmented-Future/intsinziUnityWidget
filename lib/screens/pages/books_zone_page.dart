import 'package:flutter/material.dart';

class BooksZonePage extends StatefulWidget {
  const BooksZonePage({Key? key}) : super(key: key);

  @override
  State<BooksZonePage> createState() => _BooksZonePageState();
}

class _BooksZonePageState extends State<BooksZonePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Books Zone'),
      ],
    );
  }
}
