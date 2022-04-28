import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';

class TipTwoCardPageView extends StatefulWidget {
  const TipTwoCardPageView({Key? key}) : super(key: key);

  @override
  _TipTwoCardPageViewState createState() => _TipTwoCardPageViewState();
}

class _TipTwoCardPageViewState extends State<TipTwoCardPageView> {
  final List<Item> _items = [
    Item('No word in the dictionary rhyme with the word orange.', color100),
    Item('Number four is the only one with the same amount of letters.',
        brandYellowColor),
    Item('C', Colors.green),
    Item('D', Colors.purple),
    Item('E', Colors.blue),
    Item('F', Colors.pink),
    Item('G', Colors.orange)
  ];
  final PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 0);
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        _page = _pageController.page!;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(32),
            width: double.infinity,
            child: const Text(
              'Daily Tips',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorPurple,
              ),
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              controller: _pageController,
              itemCount: _items.length ~/ 2 + _items.length % 2,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                          child: ItemBuilder(items: _items, index: index * 2)),
                      Expanded(
                          child: index * 2 + 1 >= _items.length
                              ? const SizedBox()
                              : ItemBuilder(
                                  items: _items, index: index * 2 + 1)),
                    ],
                  ),
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < _items.length ~/ 2 + _items.length % 2; i++)
              Container(
                margin: const EdgeInsets.all(2),
                width: _page - i > 1 || _page - i < -1 ? 12 : 29,
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
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      height: 200,
      padding: const EdgeInsets.only(left: 8, right: 8),
      color: _items[index].color,
      child: Center(
          child: Text(
        _items[index].title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      )),
    );
  }
}

class Item {
  final String title;
  final Color color;

  Item(this.title, this.color);
}
