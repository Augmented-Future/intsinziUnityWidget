import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../components/painters.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {Key? key,
      required double cardSize,
      required this.direction,
      required this.img})
      : _cardSize = cardSize,
        super(key: key);

  final double _cardSize;
  final Widget direction;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: _cardSize,
              height: _cardSize - 40,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFFFBBF24),
                borderRadius: BorderRadius.circular(12.5),
              ),
              child: CustomPaint(
                painter: InsideCardShapePainter(),
              ),
            ),
            CircleAvatar(
              backgroundColor: grayColor200,
              radius: _cardSize * 0.33,
              backgroundImage: NetworkImage(img),
            )
          ],
        ),
        PlayButton(cardSize: _cardSize, direction: direction)
      ],
    );
  }
}

class PlayButton extends StatefulWidget {
  const PlayButton(
      {Key? key, required double cardSize, required this.direction})
      : _cardSize = cardSize,
        super(key: key);

  final double _cardSize;
  final Widget direction;

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => clicked = true);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => widget.direction));
      },
      child: Container(
        decoration: BoxDecoration(
          color: clicked ? const Color(0xFFAD6359) : coolGreen,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        margin: const EdgeInsets.only(left: 14, bottom: 8),
        width: widget._cardSize * 0.5,
        child: Row(
          children: const [
            Icon(
              Icons.play_arrow,
              color: whiteColor,
            ),
            Text(
              "Play",
              style: TextStyle(color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
