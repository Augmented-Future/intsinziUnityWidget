import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/pastpaper_model.dart';
import 'package:globaltrailblazersapp/models/product_model.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/widgets/share_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';

class PaperDetails extends StatefulWidget {
  const PaperDetails({Key? key, required this.pastPaper}) : super(key: key);
  final PastPaper pastPaper;

  @override
  State<PaperDetails> createState() => _PaperDetailsState();
}

class _PaperDetailsState extends State<PaperDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${widget.pastPaper.name.toUpperCase()} (${widget.pastPaper.year})",
                      style: const TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download,
                      color: colorPurple,
                    ),
                  ),
                ],
              ),
              Container(
                color: grayColor200,
                height: screenHeight(context) * 0.7,
              ),
              ShareWidget(
                product: productsList[0],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
