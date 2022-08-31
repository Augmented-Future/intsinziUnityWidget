import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/screens/pages/page_error.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/components/product_card_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/shopping_cart_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_category_widget.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

import '../components/animation_shimmer_card.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Product>? _productsList;
  bool isLoading = true;
  void getProducts() async {
    dynamic result = await DatabaseService.fetchAllProducts();
    if (result.runtimeType == ErrorException) {
      if (mounted) {
        ErrorException error = result;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PageError(
              errorDescription: error.errorMessage,
              errorMessage: "Failed to get products",
              statusCode: error.statusCode,
              suggestions: const [
                "Try again later",
                "Check your internet connection!"
              ],
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        setState(() {
          _productsList = result;
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: screenWidth(context),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/baby.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const FilterCategoryWidget(
                  shopFilter: true,
                  pageId: 1,
                  typeId: 2,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return isLoading
                    ? const MyCustomShimmerAnimationsWidget()
                    : ProductCard(
                        size: 170,
                        product: _productsList![index],
                      );
              },
              childCount: isLoading ? 4 : _productsList!.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          )
        ],
      ),
      backgroundColor: whiteColor,
      floatingActionButton: buildCartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget buildCartButton() {
    return GestureDetector(
      onTap: () => Get.to(() => const ShoppingCartPage()),
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: primaryColor, width: 2.0),
        ),
        child: SvgPicture.asset('assets/icons/cart.svg'),
      ),
    );
  }
}
