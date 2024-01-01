import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

import 'package:shop_app_flutter/providers/cart_provider.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'titi',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow.shade200,
            primary: Colors.yellow.shade600,
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              fontSize: 50,
              height: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
