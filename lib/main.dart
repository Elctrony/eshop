import 'package:eshop/screens/all_product.dart';
import 'package:eshop/screens/category_screen.dart';
import 'package:eshop/screens/home_screen.dart';
import 'package:eshop/screens/my_products.dart';
import 'package:eshop/screens/product_details.dart';
import 'package:eshop/screens/splash_screen.dart';
import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(249, 108, 5, 1),
        fontFamily: 'cera-pro',
        primarySwatch: primaryColor,
      ),
      home: AllProduct(),
      routes: {
        '/home': (_) => HomeScreen(),
        '/category': (_) => CategoryScreen(),
      },
    );
  }
}
