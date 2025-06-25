import 'package:flutter/material.dart';
import 'package:food_order_app/features/sign_up/view_model/sign_up_view_model.dart';
import 'package:food_order_app/widgets/Custom_Button.dart';
import 'package:food_order_app/widgets/TextfieldWidget.dart';
import 'package:food_order_app/widgets/tab_switcher.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignupViewModel viewModel = SignupViewModel();
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 1,
              width: double.infinity,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    top: -120,
                    left: -120,
                    child: Container(
                      height: 740,
                      width: 700,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF3D00),
                      ),
                    ),
                  ),

                  // MIDDLE circle
                  Positioned(
                    top: -100,
                    left: -100,
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(
                          127,
                          255,
                          110,
                          97,
                        ), // coral/orange
                      ),
                    ),
                  ),
                  Positioned(
                    top: -80,
                    left: -80,
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(
                          136,
                          255,
                          177,
                          153,
                        ), // deep orange
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 160, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Create your\naccount',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Create an account to start looking \nfor the food you like.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 350),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          TabSwitcher(
                            selectedIndex: _selectedTab,
                            onTabTap: (index) {
                              setState(() {
                                _selectedTab = index;
                              });
                            },
                          ),
                          // Text(
                          //   // _selectedTab == 0 ? 'Sign Up Form Placeholder' : 'Sign In Form Placeholder',
                          //   // style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          // ),
                          const SizedBox(height: 20),
                          TextfieldWidget(
                            controller: viewModel.nameController,
                            hintText: 'Full Name',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 10),
                          TextfieldWidget(
                            controller: viewModel.phoneController,
                            hintText: 'Phone Number',
                            icon: Icons.email,
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 10),
                          TextfieldWidget(
                            controller: viewModel.passwordController,
                            hintText: 'Password',
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                           Row(
                    children: [
                      Checkbox(
                        activeColor: const Color.fromARGB(255, 255, 84, 84),
                        value: viewModel.isChecked,
                        onChanged: (value) {
                          setState(() {
                            viewModel.isChecked = value!;
                          });
                        },
                      ),
                      const Flexible(
                        child: Text.rich(
                          TextSpan(
                            text: "I Agree with ",
                            children: [
                              TextSpan(
                                  text: "Terms of Service",
                                  style: TextStyle(color: Color.fromARGB(255, 255, 84, 84))),
                              TextSpan(text: " and "),
                              TextSpan(
                                  text: "Privacy Policy",
                                   style: TextStyle(color: Color.fromARGB(255, 255, 84, 84))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: "Sign Up",
                    
                    onPressed: () {
                      viewModel.signup(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text("Or sign in with"),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Image.asset("assets/icons/google.png", width: 40, height: 40),
        const SizedBox(width: 20),
        Image.asset("assets/icons/facebook.png", width: 40, height: 40),
        const SizedBox(width: 20),
        Image.asset("assets/icons/apple.png", width: 40, height: 40),
      ],
    ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Already have an account? Sign In",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}