import 'package:flutter/material.dart';
import 'package:food_order_app/widgets/GemBadgeWidget.dart';
import 'package:food_order_app/widgets/title_and_subtitle.dart';
import 'package:food_order_app/widgets/DotIndicators.dart'; // custom dot indicator widget

class Onboardingscreen3 extends StatelessWidget {
  Onboardingscreen3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Dummy controller for DotIndicator just to render dots (currentIndex = 2)
    final PageController dummyController = PageController(initialPage: 2);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 30),
          onPressed: null,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            const GemBadgeWidget(backgroundImagePath: "assets/images/bac.png", overlayImagePath: "assets/images/dim.png")
          ]

      ),
      ),
    );
  }
}