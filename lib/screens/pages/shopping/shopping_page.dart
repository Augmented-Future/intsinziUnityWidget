import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/product_card_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_category_widget.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
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
                  gradeId: 2,
                  contentId: 1,
                  typeId: 2,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProductCard(
                  size: 200,
                  product: productsList[index],
                );
              },
              childCount: productsList.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
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
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: primaryColor, width: 2.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "0",
            style: TextStyle(fontSize: 15, color: primaryColor),
          ),
          SvgPicture.asset('assets/icons/cart.svg'),
        ],
      ),
    );
  }
}
