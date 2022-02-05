import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationWidget extends StatelessWidget {
  late int i;
  BottomNavigationWidget(index, {Key? key}) : super(key: key) {
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
            onPressed: () => print('Home'),
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              color: i == 0 ? selectedIconColor : iconColor,
              height: 25,
              fit: BoxFit.fitHeight,
            ),
          ),
          IconButton(
            onPressed: () => print('Search'),
            icon: SvgPicture.asset(
              'assets/images/search.svg',
              color: i == 1 ? selectedIconColor : iconColor,
              height: 25,
              fit: BoxFit.fitHeight,
            ),
          ),
          Transform.translate(
            offset: const Offset(0.0, -30.0),
            child: CircleAvatar(
              child: SvgPicture.asset(
                'assets/images/scan.svg',
                width: 35,
                fit: BoxFit.fitWidth,
              ),
              backgroundColor: Color.fromRGBO(249, 108, 5, 1),
              radius: 40,
            ),
          ),
          IconButton(
            onPressed: () => print('Favorite'),
            icon: SvgPicture.asset(
              'assets/images/favorite.svg',
              color: i == 2 ? selectedIconColor : iconColor,
              height: 25,
              fit: BoxFit.fitHeight,
            ),
          ),
          IconButton(
            onPressed: () => print('Person'),
            icon: SvgPicture.asset(
              'assets/images/person.svg',
              color: i == 3 ? selectedIconColor : iconColor,
              height: 25,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
