import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const DotIndicator({
    Key? key,
    required this.controller,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: const WormEffect(
        dotHeight: 12,
        dotWidth: 12,
        spacing: 8,
        activeDotColor: Color(0xFFFC401F),
        dotColor: Colors.grey,
      ),
    );
  }
}
