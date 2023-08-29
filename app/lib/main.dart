import 'package:flutter/material.dart';
import 'package:fluttered/pages/cart_page.dart';
import 'models/shop.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => IntroPage(),
        '/menupage': (context) => MenuPage(),
             '/cartpage': (context) => CartPage(),

      },
    );
  }
}
