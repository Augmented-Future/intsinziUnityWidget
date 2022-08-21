import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/book.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';

import '../widgets/back_app_bar.dart';

class ReadBookPdfPage extends StatefulWidget {
  const ReadBookPdfPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  State<ReadBookPdfPage> createState() => _ReadBookPdfPageState();
}

class _ReadBookPdfPageState extends State<ReadBookPdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.book.title,
                    style: const TextStyle(fontSize: 20, color: primaryColor),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
                  child: const Text(
                    "1 of 5",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth(context),
            height: screenHeight(context) * 0.6,
            child: const Text("The page should be displayed here."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
