import 'package:flutter/material.dart';
import 'package:food_order_app/features/onboarding/onboardingscreen3.dart';
import 'package:food_order_app/widgets/DotIndicators.dart';

import 'package:food_order_app/widgets/gemwidget1.dart';

class Onboardingscreen2 extends StatefulWidget {
  const Onboardingscreen2({Key? key}) : super(key: key);

  @override
  _Onboardingscreen2State createState() => _Onboardingscreen2State();
}

class _Onboardingscreen2State extends State<Onboardingscreen2> {
  final PageController dummyController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(Icons.arrow_back),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            const GemBadgeWidget1(
              backgroundImagePath: "assets/images/bac.png",
              overlayImagePath: "assets/images/Gift.png",
            ), // Make sure
            /// Welcome Text Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 320, // Fixed width
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'Earn Points.',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Get Rewarded.',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Get 10 points for every ₹100 \n spent. Unlock free items,\n discounts, cashback, and more!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),

            /// Next Button
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboardingscreen3()),
                );
              },
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
            SizedBox(height: 20),
            DotIndicator(controller: dummyController, count: 3),
          ],
        ),
      ),
    );
  }
}
