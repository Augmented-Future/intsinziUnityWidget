import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';

class TipTwoCardPageView extends StatefulWidget {
  const TipTwoCardPageView({Key? key}) : super(key: key);

  @override
  _TipTwoCardPageViewState createState() => _TipTwoCardPageViewState();
}

class _TipTwoCardPageViewState extends State<TipTwoCardPageView> {
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
        Container(
          decoration: BoxDecoration(
              color: grayColor200.withOpacity(0.15),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Coucou, \nWelcome back to the\nhome of engaging\nlearning",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              Column(
                children: [
                  const Text("Tutoring"),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 2),
                    decoration: const BoxDecoration(color: whiteColor),
                    child: const Text("3"),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorPurple,
            ),
          ),
        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < _items.length; i++)
              Container(
                margin: const EdgeInsets.all(2),
                width: _currentPage == i ? 29 : 12,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryBlack,
                ),
              )
          ],
        )
      ],
    );
  }
}

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({
    Key? key,
    required List<Item> items,
    required this.index,
  })  : _items = items,
        super(key: key);

  final List<Item> _items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: _items[index].color,
      ),
      child: Row(
        children: [
          Image.asset('assets/images/keza.png'),
          Expanded(
            child: Text(
              _items[index].title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String title;
  final Color color;

  Item(this.title, this.color);
}
