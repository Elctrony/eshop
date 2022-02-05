import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 12),
            SvgPicture.asset(
              'assets/images/name.svg',
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}
