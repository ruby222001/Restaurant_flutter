import 'package:flutter/material.dart';
import 'package:fluttered/pages/cart_page.dart';
import 'package:fluttered/pages/khalti_page.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
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
    return KhaltiScope(
      publicKey: 'test_public_key_a8784225e92a488e9a9f6878bf0eb418',

      builder: (context, navKey) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const IntroPage(),
          navigatorKey: navKey,
          localizationsDelegates: const [KhaltiLocalizations.delegate],
          routes: {
            '/intropage': (context) => const IntroPage(),
            '/menupage': (context) =>const  MenuPage(),
                 '/cartpage': (context) =>const CartPage(),
                 '/khaltipage': (context) =>const KhaltiPage(),

          },
        );
      }, 
    );
  }
}
