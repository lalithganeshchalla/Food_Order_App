
import 'package:flutter/material.dart';
import 'package:food_order_app/widgets/GemBadgeWidget.dart';

class Onboardingscreen1 extends StatefulWidget {
  const Onboardingscreen1({Key? key}) : super(key: key);

  @override
  _Onboardingscreen1State createState() => _Onboardingscreen1State();
}

class _Onboardingscreen1State extends State<Onboardingscreen1> {
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
            SizedBox(height: 30),
            const GemBadgeWidget(backgroundImagePath: "assets\images\bac.png", overlayImagePath: "assets\images\Foods3.png"), // Make sure you define this
            SizedBox(height: 30),

            /// Welcome Text Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.all(20),
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
                  children: [
                    Text(
                      'Welcome to',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Craft My Plate.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Craft My Plate’s exclusive rewards program – made for foodies who love to host.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),

            /// Navigation Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 10, color: Colors.deepOrange),
                SizedBox(width: 5),
                Icon(Icons.circle_outlined, size: 10, color: Colors.deepOrange),
                SizedBox(width: 5),
                Icon(Icons.circle_outlined, size: 10, color: Colors.deepOrange),
              ],
            ),

            SizedBox(height: 20),

            /// Next Button
            FloatingActionButton(
              onPressed: () {
                // Next screen logic here
              },
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
