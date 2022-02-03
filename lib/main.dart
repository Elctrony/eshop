import 'package:eshop/screens/Category_screen.dart';
import 'package:eshop/screens/home_screen.dart';
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
        primaryColor: Color.fromRGBO(249, 108, 5, 1),
        fontFamily: 'cera-pro',
        primarySwatch: primaryColor,
      ),
      home: CategoryScreen(),
      routes: {'/home': (_) => HomeScreen()},
    );
  }
}
