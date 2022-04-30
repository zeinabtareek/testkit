import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key, this.pageController, this.count})
      : super(key: key);
  final PageController? pageController;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SmoothPageIndicator(
          controller: pageController!,
          count: count!,
          effect:  WormEffect(
              dotHeight: 10,
              dotWidth: 13,
              activeDotColor: K.mainColor,
              dotColor: K.whiteColor), // your preferred effect
        ),
      ),
    );
  }
}
