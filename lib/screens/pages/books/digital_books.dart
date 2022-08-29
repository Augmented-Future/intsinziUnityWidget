import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/models/book.dart';
import 'package:globaltrailblazersapp/screens/pages/books/read_book_pdf_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_category_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/home_cards_shimmer.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

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
                  pageId: 6,
                  courseId: 1,
                ),
                const SizedBox(height: 12),
                _books == null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: const [
                            HomeCardShimmerWidget(fullWidth: true),
                            HomeCardShimmerWidget(fullWidth: true),
                          ],
                        ),
                      )
                    : Column(
                        children:
                            _books!.map((bookA) => bookCard(bookA)).toList(),
                      ),
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
                Image.network(
                  book.cover,
                  width: 200,
                  height: 120,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.5),
                    child: Text(
                      book.description,
                      style: const TextStyle(color: whiteColor, fontSize: 16.0),
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
                      Text(book.title),
                      const SizedBox(width: 20),
                      SvgPicture.asset("assets/icons/aug.svg"),
                      const SizedBox(width: 10),
                      SvgPicture.asset("assets/icons/sound.svg"),
                    ],
                  ),
                  Text("Author: ${book.author}"),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () => Get.to(() => ReadBookPdfPage(book: book)),
                label:
                    const Text("Read", style: TextStyle(color: primaryColor)),
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
}
