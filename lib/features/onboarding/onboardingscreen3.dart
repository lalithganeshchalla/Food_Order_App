import 'package:flutter/material.dart';
import 'package:food_order_app/widgets/GemBadgeWidget.dart';

class Onboardingscreen3 extends StatefulWidget {
  const Onboardingscreen3({Key? key}) : super(key: key);

  @override
  _Onboardingscreen3State createState() => _Onboardingscreen3State();
}

class _Onboardingscreen3State extends State<Onboardingscreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(Icons.arrow_back),
      ),
      
      body: Center(
        child: Column(
          
          children: [
            SizedBox(height: 30),
            const GemBadgeWidget()
          ]

      ),
      ),
    );
  }
}
