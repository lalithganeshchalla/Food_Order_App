import 'package:flutter/material.dart';

class GemBadgeWidget1 extends StatelessWidget {
  final String backgroundImagePath;
  final String overlayImagePath;

  const GemBadgeWidget1({
    Key? key,
    required this.backgroundImagePath,
    required this.overlayImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Positioned(
            top: -220, // Push it up to hide top part
            left: -40, // Gap from left
            right: -40, // Gap from right
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(83, 255, 77, 41),
                image: DecorationImage(
                  image: AssetImage(backgroundImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Image.asset(overlayImagePath, width: 400, height: 300),
          ),
        ],
      ),
    );
  }
}
