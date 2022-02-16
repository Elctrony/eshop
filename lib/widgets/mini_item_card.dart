import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiniItemCard extends StatelessWidget {
  MiniItemCard(
      {Key? key,
      @required this.name,
      @required this.path,
      @required this.price,
      this.isFavourite = false,
      this.color})
      : super(key: key);
  final name;
  final path;
  final price;
  bool isFavourite;
  final color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(0.0),
      height: 180,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              child: Container(
                color: color ?? colorAvaliable[3],
                child: Image.asset(
                  path,
                  fit: BoxFit.scaleDown,
                  width: size.width,
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    )
                  ],
                ),
                StatefulBuilder(builder: (context, setState) {
                  return IconButton(
                      onPressed: () {
                        setState((() => isFavourite = !isFavourite));
                      },
                      icon: SvgPicture.asset(isFavourite
                          ? 'assets/images/favourite_active.svg'
                          : 'assets/images/favorite.svg'));
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
