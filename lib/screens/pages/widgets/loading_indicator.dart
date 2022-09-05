import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../shared/colors.dart';

class LinearLoadingIndicator extends StatefulWidget {
  const LinearLoadingIndicator({Key? key, this.colors}) : super(key: key);
  final List<Color>? colors;

  @override
  State<LinearLoadingIndicator> createState() => _LinearLoadingIndicatorState();
}

class _LinearLoadingIndicatorState extends State<LinearLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      child: LoadingIndicator(
        indicatorType: Indicator.lineScaleParty,
        colors: widget.colors ?? [whiteColor],
        strokeWidth: 2,
      ),
    );
  }
}
