import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';

import '../widgets/back_app_bar.dart';

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({Key? key, required this.file}) : super(key: key);
  final File file;

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    //final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';
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
                const Text(
                  "Amazi n'umuriro",
                  style: TextStyle(fontSize: 20, color: primaryColor),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
                  child: Text(
                    text,
                    style: const TextStyle(
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
            child: PDFView(
              filePath: widget.file.path,
              swipeHorizontal: true,
              onRender: (pages) => setState(() {
                this.pages = pages!;
              }),
              onViewCreated: (controller) => setState(() {
                this.controller = controller;
              }),
              onPageChanged: (indexPage, _) => setState(() {
                this.indexPage = indexPage!;
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  final page = indexPage == 0 ? pages - 1 : indexPage - 1;
                  controller.setPage(page);
                },
                icon: const Icon(Icons.chevron_left),
              ),
              IconButton(
                onPressed: () {
                  final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                  controller.setPage(page);
                },
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
