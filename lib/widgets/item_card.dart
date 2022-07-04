import 'dart:math';

import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCard extends StatelessWidget {
  ItemCard({Key? key, required this.item,required this.color}) : super(key: key);

  Map item = {};
  final List<Map<String, dynamic>> listItem = [
    {
      'title': 'Apple Watch',
      'img': 'assets/images/apple.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 59.99,
    },
    {
      'title': 'IPhone',
      'img': 'assets/images/iphone.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 1059.99,
    },
    {
      'title': 'Air jorden',
      'img': 'assets/images/airjorden.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 79.99,
    },
    {
      'title': 'Airpods',
      'img': 'assets/images/airpod_product.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 64.99,
    },
    {
      'title': 'Amazon Speakre',
      'img': 'assets/images/amazon.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 159.99,
    },
    {
      'title': 'Google shirt',
      'img': 'assets/images/tshirt.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 29.99,
    },
    {
      'title': 'Speaker',
      'img': 'assets/images/product3.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 39.99,
    }
  ];
  final color;
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
              color: color,
              child: SizedBox(
                width: 90,
                child: Image.asset(
                  item['img'],
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
            children: [
              Text(
                item['title'],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              Text(
                item['description'],
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                overflow: TextOverflow.clip,
              ),
              Text(
                '\$${item['price']}',
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
