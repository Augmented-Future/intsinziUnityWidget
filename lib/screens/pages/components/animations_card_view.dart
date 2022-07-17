import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/models/trailbrazer.dart';

class AnimationsCardView extends StatefulWidget {
  const AnimationsCardView({Key? key}) : super(key: key);

  @override
  _AnimationsCardViewState createState() => _AnimationsCardViewState();
}

class _AnimationsCardViewState extends State<AnimationsCardView> {
  final List<Trailbrazer> _items = [
    Trailbrazer('Trailbrazers 1', 'Chapter 3,', 'Mathematics', '28 March 2022',
        'Adekunle Gold'),
    Trailbrazer('Trailbrazers 1', 'Chapter 3,', 'Kinyarwanda', '28 March 2022',
        'Adekunle Gold'),
    Trailbrazer('Trailbrazers 1', 'Chapter 3,', 'English', '28 March 2022',
        'Adekunle Gold'),
    Trailbrazer('Trailbrazers 1', 'Chapter 3,', 'Science', '28 March 2022',
        'Adekunle Gold'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text(
                  "TV Zone",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Row(children: [
                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      child: const Text(
                        'Free',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(color: Colors.red),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: const Text(
                      'View All',
                      style: TextStyle(color: primaryColor),
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          side: const BorderSide(color: brandYellowColor),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(brandYellowColor),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ItemBuilder(
                        items: _items,
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
    required List<Trailbrazer> items,
    required this.index,
  })  : _items = items,
        super(key: key);

  final List<Trailbrazer> _items;
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
                    side: const BorderSide(color: colorGreen),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(colorGreen),
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
                _items[index].courseName + ', ' + _items[index].chapter,
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
