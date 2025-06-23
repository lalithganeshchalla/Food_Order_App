import 'package:flutter/material.dart';

class GemBadgeWidget extends StatelessWidget {
  const GemBadgeWidget({Key? key}) : super(key: key);

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
                image: AssetImage('assets/images/bac.png'),
                fit: BoxFit.none,

                
              ),
            ),
          ),
          Positioned(
            top: 45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
        
                SizedBox(height: 70), // Add some space between the images
               Image.asset("assets/images/dim.png",
                  width: 400,
                  height: 300,
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}