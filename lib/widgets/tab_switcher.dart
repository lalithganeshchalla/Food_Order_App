import 'package:flutter/material.dart';

class TabSwitcher extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTap;

  const TabSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onTabTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color.fromARGB(207, 252, 203, 193),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Compact width
            children: [
              _tabItem("Sign Up", 0),
              _tabItem("Sign In", 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTabTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
