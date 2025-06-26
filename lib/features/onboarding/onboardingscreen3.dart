import 'package:flutter/material.dart';
import 'package:food_order_app/features/sign_up/view/sign_up_view.dart';
import 'package:food_order_app/widgets/DotIndicators.dart';
import 'package:food_order_app/widgets/GemBadgeWidget.dart';

class Onboardingscreen3 extends StatelessWidget {
  Onboardingscreen3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 20),
            const GemBadgeWidget(backgroundImagePath: "assets/images/bac.png", overlayImagePath: "assets/images/dim.png"),
             SizedBox(height: 20),

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
                      'Level Up',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'With Every Order.',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Silver, Gold, and Platinum tiers give you exclusive perks. The more you order, the better the rewards!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpView()));
              },
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.arrow_forward, color: Colors.white),
              
            ),
            SizedBox(height: 20),
            DotIndicator(controller: dummyController, count: 3)
          ]

      ),
      ),
    );
  }
}