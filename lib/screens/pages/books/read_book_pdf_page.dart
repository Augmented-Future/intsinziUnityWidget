import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/shimmer_card.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/models/book_model.dart';
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
    if (fileBook != null && mounted) setState(() {});
  }

  @override
  void initState() {
    initBook(widget.book.pdf);
    super.initState();
  }

  @override
  void dispose() {
    //audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.book.name,
                      style: const TextStyle(fontSize: 20, color: primaryColor),
                    ),
                  ),
                  totalPages != null
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration:
                              const BoxDecoration(color: Color(0xFFF8F8F8)),
                          child: Text(
                            "$currentPage of $totalPages",
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: primaryColor,
                            ),
                          ),
                        )
                      : const ShimmerCard(width: 120, height: 30),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * 0.6,
              child: fileBook == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(color: primaryColor),
                          SizedBox(height: 15),
                          Text("Book Loading, please wait.."),
                        ],
                      ),
                    )
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
            SvgPicture.asset('assets/icons/mic_record.svg'),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        active: "Library",
      ),
    );
  }
}
