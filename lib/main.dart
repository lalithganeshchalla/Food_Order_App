import 'package:flutter/material.dart';
import 'package:food_order_app/features/onboarding/onboardingscreen1.dart';
import 'package:food_order_app/features/onboarding/onboardingscreen3.dart';
import 'package:food_order_app/features/otp/view/otp_screen.dart';
import 'package:food_order_app/features/sign_up/view/sign_up_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const Onboardingscreen1(),
      // home: Onboardingscreen3()
      // home: const SignUpView(),
       home: const OtpScreen()
    );
  }
}


