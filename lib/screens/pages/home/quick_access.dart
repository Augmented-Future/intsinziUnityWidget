import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/quick_access_item.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuickAccessView extends StatefulWidget {
  const QuickAccessView({Key? key}) : super(key: key);

  @override
  _QuickAccessViewState createState() => _QuickAccessViewState();
}

class _QuickAccessViewState extends State<QuickAccessView> {
  final List<QuickAccessItem> _items = List.of(quickAccessItems);

  final PageController _pageController = PageController(viewportFraction: 0.8);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        _currentPage = _pageController.page!;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
              controller: _pageController,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: _items[index].color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Image.asset(_items[index].imgUrl)),
                      Expanded(
                        flex: 2,
                        child: Text(
                          _items[index].text,
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: whiteColor, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: _currentPage.toInt(),
              count: _items.length,
              effect: ExpandingDotsEffect(
                radius: 3.5,
                dotColor: primaryColor.withOpacity(0.5),
                activeDotColor: primaryColor,
                dotHeight: 5,
                dotWidth: 15,
                expansionFactor: 1.8,
              ),
            ),
          ),
        )
      ],
    );
  }
}
