import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/book.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/services/read_book_pdf.dart';

import '../widgets/back_app_bar.dart';

class ReadBookPdfPage extends StatefulWidget {
  const ReadBookPdfPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  State<ReadBookPdfPage> createState() => _ReadBookPdfPageState();
}

class _ReadBookPdfPageState extends State<ReadBookPdfPage> {
  PDFViewController? pdfViewController;
  int? totalPages;
  int? currentPage = 1;
  File? fileBook;
  initBook(String url) async {
    fileBook = await ReadBookPDFService.loadFromNetwork(url);
    if (fileBook != null) setState(() {});
  }

  @override
  void initState() {
    initBook(widget.book.pdfUrl);
    super.initState();
  }

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
                  child: totalPages != null
                      ? Text(
                          "$currentPage of $totalPages",
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: primaryColor,
                          ),
                        )
                      : const Text("Loading..."),
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth(context),
            height: screenHeight(context) * 0.6,
            child: fileBook == null
                ? const Text("File Loading, please wait..")
                : PDFView(
                    filePath: fileBook!.path,
                    swipeHorizontal: true,
                    onRender: (pages) => setState(() => totalPages = pages),
                    onViewCreated: (controller) =>
                        setState(() => pdfViewController = controller),
                    onPageChanged: (page, total) =>
                        setState(() => currentPage = page! + 1),
                  ),
          ),
          if (pdfViewController != null)
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
            ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
