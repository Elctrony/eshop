import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiniItemCard extends StatelessWidget {
  const MiniItemCard(
      {Key? key,
      @required this.name,
      @required this.path,
      @required this.price})
      : super(key: key);
  final name;
  final path;
  final price;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(0.0),
      height: 180,
      width: 150,
      child: Column(
        children: [
          ClipRRect(
            child: Container(
              color: const Color.fromRGBO(208, 227, 250, 1),
              child: Image.asset(
                path,
                fit: BoxFit.fitHeight,
                scale: 1,
                width: 150,
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '\$$price',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/favorite.svg'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
