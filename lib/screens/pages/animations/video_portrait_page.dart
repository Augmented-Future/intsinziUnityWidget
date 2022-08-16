import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/models/animations_content.dart';
import 'package:globaltrailblazersapp/screens/pages/home/tip_two_card_view.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';

import '../widgets/fun_facts.dart';

class VideoPortraitForm extends StatefulWidget {
  const VideoPortraitForm({Key? key, required this.animation})
      : super(key: key);
  final AnimationsContent animation;

  @override
  State<VideoPortraitForm> createState() => _VideoPortraitFormState();
}

class _VideoPortraitFormState extends State<VideoPortraitForm> {
  final List<Item> _items = [
    Item(
        'Learn with me the touristic sites of Rwanda in The ABCs of Rwanda book',
        color100),
    Item('Number four is the only one with the same amount of letters.',
        brandYellowColor),
    Item('No word in the dictionary rhyme with the word orange.', Colors.green),
  ];

  final PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 0, keepPage: true);

  //About video player
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  String? videoUrl;
  @override
  void initState() {
    super.initState();

    videoUrl = widget.animation.video;

    videoPlayerController = VideoPlayerController.network(videoUrl!)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        exitFullscreenOnEnd: true,
      ),
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                decoration: const BoxDecoration(color: whiteColor),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: brandYellowColor,
                    ),
                    CustomVideoPlayer(
                      customVideoPlayerController: _customVideoPlayerController,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/icons/like.svg'),
                    SvgPicture.asset('assets/icons/comment.svg'),
                    SvgPicture.asset('assets/icons/share.svg'),
                  ],
                ),
              ),
              const FunFactsWidget(
                text: "Best Learning Tips",
                leadingSvgName: 'assets/images/best_learning_tips.svg',
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: ItemBuilder(items: _items, index: index),
                          ),
                        ],
                      );
                    }),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/game_zone.svg',
                    alignment: Alignment.center,
                    width: 40,
                  ),
                  label: const Text(
                    'PRACTICE',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: const Color(0xFFFBBF24),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
