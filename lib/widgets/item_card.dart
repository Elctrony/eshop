import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Container(
              height: 120,
              color: const Color.fromRGBO(255, 222, 155, 1),
              child: SizedBox(
                width: 90,
                child: Image.asset(
                  'assets/images/tshirt.png',
                ),
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Nike Air Zoom',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              Text(
                'Reinvigorate your stride with the Nike Air Zoom Pegasus 37',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                overflow: TextOverflow.clip,
              ),
              Text(
                '\$60',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ],
          )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/favorite.svg'))
        ],
      ),
    );
  }
}
