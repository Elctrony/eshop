import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/back.svg',
                  width: 25,
                ),
                const Expanded(child: SizedBox()),
                const Text('Confirmation',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                const Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(height: 80),
            CircleAvatar(
              radius: 88,
              child: SvgPicture.asset('assets/images/check.svg'),
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Your order is Completed',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Sit back and relax. Your express package is arriving in 1 days',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              width: size.width,
              height: 55,
              child: MaterialButton(
                elevation: 0.0,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey, width: 1.0)),
                color: Colors.white,
                child: Text(
                  'Go to Home',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: size.width,
              height: 55,
              child: MaterialButton(
                onPressed: () {},
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color.fromRGBO(249, 108, 5, 1),
                child: Text(
                  'Track Your Order',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
