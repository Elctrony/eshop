import 'package:eshop/screens/all_product.dart';
import 'package:eshop/screens/cart_screen.dart';
import 'package:eshop/screens/category_screen.dart';
import 'package:eshop/screens/checkout_screen.dart';
import 'package:eshop/screens/confirmation_screen.dart';
import 'package:eshop/screens/favourite_screen.dart';
import 'package:eshop/screens/home_screen.dart';
import 'package:eshop/screens/my_products.dart';
import 'package:eshop/screens/order_tracking.dart';
import 'package:eshop/screens/product_details.dart';
import 'package:eshop/screens/signup_screen.dart';
import 'package:eshop/screens/splash_screen.dart';
import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  RootApp({Key? key}) : super(key: key);
  final screens = [
    '/home',
    '/category',
    '/cart',
    '/all',
    '/checkout',
    '/confirmation',
    '/favourite',
    '/my-product',
    '/tracking',
    '/details',
    '/sign-up',
    '/splash'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(249, 108, 5, 1),
        fontFamily: 'cera-pro',
        primarySwatch: primaryColor,
      ),
      home: NavigationScreen(screens),
      routes: {
        '/home': (_) => HomeScreen(),
        '/category': (_) => CategoryScreen(),
        '/cart': (_) => CartScreen(),
        '/all': (_) => AllProduct(),
        '/checkout': (_) => CheckOut(),
        '/confirmation': (_) => ConfirmationScreen(),
        '/favourite': (_) => FavouriteScreen(),
        '/my-product': (_) => MyProducts(),
        '/tracking': (_) => OrderTrackingScreen(),
        '/details': (_) => ProductDetails(),
        '/sign-up': (_) => SignupScreen(),
        '/splash': (_) => SplashScreen(),
      },
    );
  }
}

class NavigationScreen extends StatelessWidget{
  final screens;
  NavigationScreen(this.screens);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) => ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(screens[index]);
          },
          child: Text('${screens[index]}'),
        ),
        itemCount: screens.length,
      ),
    );  }

}