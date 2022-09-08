import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/models/pastpaper_model.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_category_widget.dart';

import '../../../models/cormic_model.dart';
import '../pastpapers/paper_details.dart';

class CormicsPage extends StatefulWidget {
  const CormicsPage({Key? key}) : super(key: key);

  @override
  State<CormicsPage> createState() => _CormicsPageState();
}

class _CormicsPageState extends State<CormicsPage> {
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
                      image: AssetImage('assets/images/cool_old.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const FilterCategoryWidget(pageId: 10, courseId: 1),
                const SizedBox(height: 5),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: coolYellow,
                        height: (screenWidth(context) / 2) - 80,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PaperDetails(
                                pastPaper: PastPaper(
                                    id: cormics[index].id,
                                    cover: cormics[index].cover,
                                    name: cormics[index].name,
                                    pdf: cormics[index].pdf,
                                    courseId: cormics[index].courseId,
                                    curriculumId: cormics[index].curriculumId,
                                    gradeId: cormics[index].gradeId,
                                    slug: cormics[index].slug,
                                    year: cormics[index]
                                        .createdAt
                                        .year
                                        .toString()),
                              ),
                            ),
                          ),
                          child: Image.network(
                            cormics[index].cover,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        cormics[index].name,
                                        style: const TextStyle(fontSize: 15.5),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/currency.svg",
                                          height: 14,
                                        ),
                                        Text(
                                            " ${cormics[index].price.toInt()} RWF"),
                                      ],
                                    ),
                                  ],
                                ),
                                const Text(
                                  "By Augmented Future",
                                  style: TextStyle(
                                      fontSize: 14, color: colorPurple),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: cormics.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          )
        ],
      ),
      backgroundColor: whiteColor,
      bottomNavigationBar: const BottomNavigationBarWidget(
        active: "",
      ),
    );
  }
}
