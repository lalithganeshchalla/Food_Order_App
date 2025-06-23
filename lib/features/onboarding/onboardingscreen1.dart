
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:food_order_app/widgets/GemBadgeWidget.dart';

class Onboardingscreen1 extends StatefulWidget {
  const Onboardingscreen1({Key? key}) : super(key: key);

  @override
  _Onboardingscreen1State createState() => _Onboardingscreen1State();
}

class _Onboardingscreen1State extends State<Onboardingscreen1> {
  int arcSteps = 1; // Initial arc step (1/3)

  void _incrementArc() {
    setState(() {
      if (arcSteps < 3) {
        arcSteps++;
      } else {
        arcSteps = 1; // Reset after full circle, or navigate next screen
      }
    });
  }

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

            SizedBox(height: 30),

            /// Custom Arc Button with dynamic progress
            ArcButton(
              progressSteps: arcSteps,
              onPressed: _incrementArc,
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

/// Custom Button with Dynamic Arc
class ArcButton extends StatelessWidget {
  final int progressSteps; // 1, 2, or 3
  final VoidCallback onPressed;

  const ArcButton({
    super.key,
    required this.progressSteps,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArcPainter(progressSteps),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepOrange,
          ),
          child: Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
    );
  }
}

/// Draws partial circle based on step count (1 to 3)
class ArcPainter extends CustomPainter {
  final int steps;

  ArcPainter(this.steps);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint arcPaint = Paint()
      ..color = Colors.orange.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
    final Rect arcRect = Rect.fromCircle(center: center, radius: radius - 3);

    // 1 step = 120°, which is 2π / 3 radians
    double sweepAngle = (2 * pi / 3) * steps;

    canvas.drawArc(
      arcRect,
      -pi / 2, // Start from top
      sweepAngle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ArcPainter oldDelegate) =>
      oldDelegate.steps != steps;
}
