import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  late int i;
  BottomWidget(index, {Key? key}) : super(key: key) {
    i = index;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home_outlined,
              color: i == 0 ? selectedIconColor : iconColor,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: i == 1 ? selectedIconColor : iconColor,
              size: 35,
            ),
          ),
          Transform.translate(
            offset: const Offset(0.0, -30.0),
            child: CircleAvatar(
              child: Image.asset(
                'assets/images/Vector.png',
                width: 35,
                fit: BoxFit.fitWidth,
              ),
              backgroundColor: Color.fromRGBO(249, 108, 5, 1),
              radius: 40,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: i == 2 ? selectedIconColor : iconColor,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
              color: i == 3 ? selectedIconColor : iconColor,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
