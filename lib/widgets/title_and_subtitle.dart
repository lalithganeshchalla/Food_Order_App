import 'package:flutter/material.dart';

class TitleAndSubtitle extends StatelessWidget {
  final String title1;
  final String title2;
  final String subtitle;
  const TitleAndSubtitle({
    super.key,
    required this.title1,
    required this.title2,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title1 == '' ?
        const SizedBox(height: 10,) :
        Text(
          title1,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        title2 == '' ?
        const SizedBox(height: 10,) :
        Text(
          title2,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 252, 64, 31),
          ),
        ),
        subtitle == '' ?
        const SizedBox() :
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
        ),
        
      ],
    );
  }
}