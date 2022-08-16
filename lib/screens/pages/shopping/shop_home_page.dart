import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/screens/pages/games/components/fun_facts_view.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/shopping_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/fun_facts.dart';

import 'product_list_view.dart';

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({Key? key}) : super(key: key);

  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShadedColorText(fontSize: 30, text: "Shop"),
        Container(
          margin: const EdgeInsets.all(25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/boy.jpg'),
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SvgPicture.asset('assets/images/double_ring.svg'),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Get learning materials delivered at your doorsteps or print for yoursels now.",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        SvgPicture.asset('assets/images/double_ring.svg')
                      ],
                    ),
                    const SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const ShoppingPage()),
                        style: ElevatedButton.styleFrom(
                          primary: filterYellow,
                          shadowColor: whiteColor,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Get started",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 15),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset('assets/icons/forward_arrow.svg')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Text(
              "        Arrivals!!   ".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: coolGreen,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "New".toUpperCase(),
                style: const TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        ProductListView(products: productsList),
        const FunFactsWidget(text: "General Knowledge"),
        const FunFactsView()
      ],
    );
  }
}
