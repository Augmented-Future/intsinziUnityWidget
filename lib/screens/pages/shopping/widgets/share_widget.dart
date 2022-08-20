import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Share"),
          SvgPicture.asset('assets/icons/twitter.svg'),
          SvgPicture.asset('assets/icons/tsap.svg', height: 38),
          SvgPicture.asset('assets/icons/fb.svg'),
        ],
      ),
    );
  }
}
