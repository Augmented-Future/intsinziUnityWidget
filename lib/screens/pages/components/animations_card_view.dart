import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/models/animations_content.dart';

class AnimationsCardView extends StatefulWidget {
  const AnimationsCardView({Key? key}) : super(key: key);

  @override
  _AnimationsCardViewState createState() => _AnimationsCardViewState();
}

class _AnimationsCardViewState extends State<AnimationsCardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Animations Zone",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              child: const Text(
                'Free',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: coolGreen,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            ElevatedButton(
              child: const Text(
                'View All',
                style: TextStyle(color: primaryColor),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: coolYellow,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: animations.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ItemBuilder(
                        items: animations,
                        index: index,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({
    Key? key,
    required List<AnimationsContent> items,
    required this.index,
  })  : _items = items,
        super(key: key);

  final List<AnimationsContent> _items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      height: 200,
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          Container(
            alignment: FractionalOffset.bottomCenter,
            height: 200,
            width: 200,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/avatar4.png"),
                fit: BoxFit.cover,
              ),
              color: Colors.white,
            ),
            child: ElevatedButton(
              child: const Text(
                'Play',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    side: const BorderSide(color: coolGreen),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(coolGreen),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                _items[index].title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              Text(
                _items[index].title + ', ' + _items[index].unit,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
