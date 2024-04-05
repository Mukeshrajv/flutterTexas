import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_screen/screens/cart.dart';
import 'package:register_screen/screens/bottomTap.dart';
import 'package:register_screen/screens/loginPage.dart';
import 'package:register_screen/screens/profile.dart';
// import 'package:register_screen/screens/loginPage.dart';
// import 'package:register_screen/screens/profile.dart';
// import 'package:register_screen/screens/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      initialRoute: '/loginPage',
      routes: {
        '/loginPage': (context) => const LoginPage(),
        '/profile': (context) => const Profile(),
        '/home': (context) => const home(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
