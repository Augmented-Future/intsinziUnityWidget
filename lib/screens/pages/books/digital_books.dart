import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/book.dart';
import 'package:globaltrailblazersapp/screens/pages/books/pdf_view_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_category_widget.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';
import 'package:globaltrailblazersapp/services/pdf_service.dart';

import '../widgets/back_app_bar.dart';

class DigitalBooksZone extends StatefulWidget {
  const DigitalBooksZone({Key? key}) : super(key: key);

  @override
  State<DigitalBooksZone> createState() => _DigitalBooksZoneState();
}

class _DigitalBooksZoneState extends State<DigitalBooksZone> {
  List<Book>? _books;
  void _getAllBooks() async {
    dynamic result = await DatabaseService.fetchAllBooks();
    if (result.runtimeType == ErrorException) {
    } else {
      if (mounted) setState(() => _books = result);
    }
  }

  @override
  void initState() {
    super.initState();
    _getAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight(context) / 4.6,
            backgroundColor: whiteColor,
            leading: Container(),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  color: brandYellowColor,
                  image: DecorationImage(
                    image: AssetImage('assets/images/laptop_library.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF193059).withOpacity(0.3),
                  ),
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(colors: <Color>[
                        Color(0xFFFEB326),
                        Color(0xFFF0F0F0),
                        Color(0xFFFEB326)
                      ]).createShader(rect);
                    },
                    child: const Text(
                      "Augmented library of your learning contents",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 12),
                const FilterCategoryWidget(
                  gradeId: 1,
                  pageId: 6,
                  courseId: 1,
                ),
                const SizedBox(height: 12),
                _books == null
                    ? const Center(
                        child: Text(
                          "Loading, Please wait..",
                          style: TextStyle(fontSize: 18.0, color: grayColor),
                        ),
                      )
                    : Column(
                        children:
                            _books!.map((book) => bookCard(book)).toList(),
                      ),
                // ElevatedButton(
                //   onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => const PaymentPage(),
                //     ),
                //   ),
                //   child: const Text("Pay"),
                // ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget bookCard(Book book) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: const BoxDecoration(
        color: whiteColor,
      ),
      width: screenWidth(context),
      child: Column(
        children: [
          Container(
            color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/laptop_library.png',
                  width: 200,
                  height: 120,
                  fit: BoxFit.fill,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(6.5),
                    child: Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when is loading cool",
                      style: TextStyle(color: whiteColor, fontSize: 16.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("The ABCS of Rwanda"),
                      const SizedBox(width: 20),
                      SvgPicture.asset("assets/icons/aug.svg"),
                      const SizedBox(width: 10),
                      SvgPicture.asset("assets/icons/sound.svg"),
                    ],
                  ),
                  const Text("Author: ImagineWePub."),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  const url =
                      "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf";
                  final file = await PDFService.loadNetwork(url);
                  openPDF(context, file);
                },
                label: const Text(
                  "Read",
                  style: TextStyle(color: primaryColor),
                ),
                icon: SvgPicture.asset('assets/icons/open_book.svg'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFBBF24),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
}
