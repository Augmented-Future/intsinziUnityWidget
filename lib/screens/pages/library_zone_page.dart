import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/book.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/payment_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_button.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_category_widget.dart';
import 'package:globaltrailblazersapp/services/auth_service.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

class LibraryZonePage extends StatefulWidget {
  const LibraryZonePage({Key? key}) : super(key: key);

  @override
  State<LibraryZonePage> createState() => _LibraryZonePageState();
}

class _LibraryZonePageState extends State<LibraryZonePage> {
  List<Book>? _books;
  void _getAllBooks() async {
    dynamic result = await DatabaseService.fetchAllBooks();
    if (result.runtimeType == ErrorException) {
    } else {
      setState(() {
        _books = result;
      });
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
      appBar: AppBar(
        title: const BackButtonWidget(),
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 80,
        centerTitle: false,
      ),
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
                const FilterCategoryWidget(),
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
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PaymentPage(),
                    ),
                  ),
                  child:const Text("Pay"),
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
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Text(book.title),
    );
  }
}
