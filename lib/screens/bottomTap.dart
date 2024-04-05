import 'package:flutter/material.dart';
import 'package:register_screen/screens/cart.dart';

import 'package:register_screen/screens/profile.dart';
import 'package:register_screen/screens/home.dart';

void main() {
  runApp(const home());
}

int selectedIndex = 0;

final List<BottomNavigationBarItem> navItems = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
  const BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Cart'),
  const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Profile'),
];

final List<Widget> screen = [RegisterPage(), CartPage(), Profile()];

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screen[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: navItems,
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
