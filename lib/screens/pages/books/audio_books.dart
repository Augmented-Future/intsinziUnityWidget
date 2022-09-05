import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/audio_book_model.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_category_widget.dart';

import 'widgets/audio_book_tile.dart';

class AudioBooksZone extends StatefulWidget {
  const AudioBooksZone({Key? key}) : super(key: key);

  @override
  State<AudioBooksZone> createState() => _AudioBooksZoneState();
}

class _AudioBooksZoneState extends State<AudioBooksZone> {
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
                      "Amazing audio books to enhance your learning",
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
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 12),
                const FilterCategoryWidget(pageId: 5),
                Container(
                  color: Colors.grey.shade200.withOpacity(0.7),
                  height: 160,
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://images.unsplash.com/photo-1558979107-4a08e5c24281?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
                        width: (screenWidth(context) - 40) * 0.45,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Description",
                            style: TextStyle(color: primaryColor, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return  AudioBookTile(book:audioBooks[index]);
            }, childCount: audioBooks.length),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      backgroundColor: whiteColor,
    );
  }
}
