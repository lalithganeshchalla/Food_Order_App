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
            const SizedBox(height: 30),

            const GemBadgeWidget(
              backgroundImagePath: 'assets/images/bac.png',
              overlayImagePath: 'assets/images/dim.png',
            ),
            const SizedBox(height: 50),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: TitleAndSubtitle(
                  title1: 'Level Up',
                  title2: 'With Every Order',
                  subtitle:
                      'Silver, Gold, and Platinum tiers give you exclusive perks. The more you order, the better the rewards!',
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 252, 64, 31),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 30),
            DotIndicator(controller: dummyController, count: 3),
          ],
        ),
      ),
    );
  }
}