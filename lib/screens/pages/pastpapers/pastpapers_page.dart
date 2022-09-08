import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/pastpaper_model.dart';
import 'package:globaltrailblazersapp/screens/pages/pastpapers/paper_details.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_category_widget.dart';

class PastPapersPage extends StatefulWidget {
  const PastPapersPage({Key? key}) : super(key: key);

  @override
  State<PastPapersPage> createState() => _PastPapersPageState();
}

class _PastPapersPageState extends State<PastPapersPage> {
  @override
  void initState() {
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
                      image: AssetImage('assets/images/pen_boy.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const FilterCategoryWidget(pageId: 8),
                const SizedBox(height: 5),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(1),
                        color: coolYellow,
                        height: (screenWidth(context) / 2) - 45,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PaperDetails(
                                pastPaper: pastPapers[index],
                              ),
                            ),
                          ),
                          child: Image.network(
                            pastPapers[index].cover,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          child: Text(
                            "${pastPapers[index].name} (${pastPapers[index].year})",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: pastPapers.length,
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
