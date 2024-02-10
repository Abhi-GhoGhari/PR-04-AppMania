import 'package:flutter/material.dart';
import 'package:pr_appmania/utils/route_utils.dart';
import 'package:pr_appmania/view/screen/cart_page.dart';
import 'package:pr_appmania/view/screen/detial_page.dart';
import 'package:pr_appmania/view/screen/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homepage: (context) => const HomePage(),
        MyRoutes.detiaalpage: (context) => const DetialPage(),
        MyRoutes.cartpage: (context) => const CartPage(),
      },
    );
  }
}
