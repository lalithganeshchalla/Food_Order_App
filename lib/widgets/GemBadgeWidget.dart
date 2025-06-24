import 'package:flutter/material.dart';

class GemBadgeWidget extends StatelessWidget {
  final String backgroundImagePath;
  final String overlayImagePath;

  const GemBadgeWidget({
    Key? key,
    required this.backgroundImagePath,
    required this.overlayImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(83, 255, 77, 41),
              image: DecorationImage(
                image: AssetImage(backgroundImagePath),
                fit: BoxFit.none,
              ),
            ),
          ),
          Positioned(
            top: 45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
        
                SizedBox(height: 85), // Add some space between the images
               Image.asset(overlayImagePath,
                  width: 400,
                  height: 300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }}
