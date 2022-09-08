import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/controllers/refresh_controller.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/custom_blur_image.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/models/book_model.dart';
import 'package:globaltrailblazersapp/screens/pages/books/read_book_pdf_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_category_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/home_cards_shimmer.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

import '../widgets/back_app_bar.dart';

class DigitalBooksZone extends StatefulWidget {
  const DigitalBooksZone({Key? key}) : super(key: key);

  @override
  State<DigitalBooksZone> createState() => _DigitalBooksZoneState();
}

class _DigitalBooksZoneState extends State<DigitalBooksZone> {
  final refresh = Get.find<RefreshController>();

  List<Book>? books;
  late IsLoading isLoading;
  ErrorException? error;

  getAllBooks() async {
    isLoading = IsLoading.loading;
    dynamic result = await DatabaseService.fetchAllBooks();
    if (result.runtimeType == ErrorException && mounted) {
      setState(() {
        error = result;
        isLoading = IsLoading.failed;
      });
      return;
    } else if (mounted) {
      setState(() {
        books = result;
        isLoading = IsLoading.done;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: Obx(() {
        if (refresh.refreshValue.isTrue) {
          getAllBooks();
          refresh.unrefreshPage();
        }
        return CustomScrollView(
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
            const SliverToBoxAdapter(
              child: FilterCategoryWidget(pageId: 6),
            ),
            if (isLoading == IsLoading.loading)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const HomeCardShimmerWidget(),
                  childCount: 3,
                ),
              )
            else if (isLoading == IsLoading.failed)
              const SliverToBoxAdapter(
                child: Text("Failed here."),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => bookCard(books![index]),
                  childCount: books!.length,
                ),
              ),
          ],
        );
      }),
      bottomNavigationBar: const BottomNavigationBarWidget(
        active: "Library",
      ),
    );
  }

  bookCard(Book book) {
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
                CustomBlurImage(
                  height: screenWidth(context) / 3,
                  imgUrl: book.cover,
                  width: screenWidth(context) / 2.2,
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
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            book.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          book.augmentable
                              ? Icons.volume_up_outlined
                              : Icons.volume_off_outlined,
                          size: 16,
                        ),
                        SizedBox(width: screenWidth(context) / 5)
                      ],
                    ),
                    Text(
                      "Author: ${book.author}",
                      style: const TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReadBookPdfPage(book: book),
                  ),
                ),
                label: const Text("Read"),
                icon: SvgPicture.asset('assets/icons/open_book.svg'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: filterYellow,
                  foregroundColor: primaryColor,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
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
