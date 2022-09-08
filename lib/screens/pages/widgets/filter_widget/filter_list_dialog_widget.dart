import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/funcs.dart';

class FilterDialogTile extends StatefulWidget {
  const FilterDialogTile(
      {Key? key,
      required this.active,
      required this.isLast,
      required this.text,
      required this.onClick})
      : super(key: key);
  final bool active;
  final bool isLast;
  final String text;
  final VoidCallback onClick;

  @override
  State<FilterDialogTile> createState() => _FilterDialogTileState();
}

class _FilterDialogTileState extends State<FilterDialogTile> {
  final BorderRadius _radius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onClick,
          splashColor: widget.active ? whiteColor.withOpacity(0.5) : null,
          borderRadius: _radius,
          child: Ink(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 35),
            width: screenWidth(context),
            decoration: BoxDecoration(
                color: widget.active ? filterYellow.withOpacity(0.8) : null,
                borderRadius: _radius),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(color: primaryColor, fontSize: 16),
                ),
                if (widget.active)
                  SvgPicture.asset(
                    'assets/icons/white_checkmark.svg',
                    color: primaryColor,
                    width: 20,
                  )
              ],
            ),
          ),
        ),
        if (!widget.isLast)
          Divider(
            height: 1.0,
            color: blackColor.withOpacity(0.2),
          )
      ],
    );
  }
}
