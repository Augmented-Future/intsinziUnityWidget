import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/colors.dart';
import '../components/painters.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {Key? key,
      required double cardSize,
      required this.direction,
      this.isGame,
      required this.img})
      : _cardSize = cardSize,
        super(key: key);

  final double _cardSize;
  final Widget direction;
  final String img;
  final bool? isGame;

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
            if (isGame == true)
              Container(
                height: _cardSize - 50,
                width: _cardSize - 75,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: Image.network(
                      img,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            else
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: _cardSize * 0.33,
                backgroundImage: NetworkImage(img),
              )
          ],
        ),
        Positioned(
          left: isGame == true ? _cardSize * 0.25 : 14,
          bottom: isGame == true ? 12 : 8,
          child: PlayButton(
            cardSize: _cardSize,
            direction: direction,
            icon: isGame == true
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: SvgPicture.asset(
                      'assets/icons/gamepad.svg',
                      height: 18,
                      color: whiteColor,
                    ),
                  )
                : const Icon(
                    Icons.play_arrow,
                    color: whiteColor,
                  ),
          ),
        )
      ],
    );
  }
}

class PlayButton extends StatefulWidget {
  const PlayButton(
      {Key? key,
      required double cardSize,
      required this.direction,
      required this.icon})
      : _cardSize = cardSize,
        super(key: key);

  final double _cardSize;
  final Widget direction, icon;

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
        width: widget._cardSize * 0.5,
        child: Row(
          children: [
            widget.icon,
            const Text(
              "Play",
              style: TextStyle(color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
