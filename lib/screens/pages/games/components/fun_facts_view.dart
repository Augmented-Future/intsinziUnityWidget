import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/models/fun_fact.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FunFactsView extends StatefulWidget {
  const FunFactsView({Key? key}) : super(key: key);

  @override
  State<FunFactsView> createState() => _FunFactsViewState();
}

class _FunFactsViewState extends State<FunFactsView> {
  int activeIndex = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: funFacts.length,
          itemBuilder: (context, index, realIndex) {
            final singleFunFact = funFacts[index];
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: singleFunFact.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    singleFunFact.text,
                    style: const TextStyle(
                      color: whiteColor,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: const EdgeInsets.only(top: 24, left: 5),
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    singleFunFact.badgeSvgIcon,
                    color: singleFunFact.color,
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
              height: 200,
              initialPage: 0,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() => activeIndex = index);
              }),
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: funFacts.length,
          onDotClicked: (index) => _carouselController.animateToPage(index),
          effect: ExpandingDotsEffect(
            radius: 5,
            dotColor: primaryColor.withOpacity(0.5),
            activeDotColor: primaryColor,
            dotHeight: 10,
            dotWidth: 20,
            expansionFactor: 2.5,
          ),
        ),
      ],
    );
  }
}
