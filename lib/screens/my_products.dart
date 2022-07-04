import 'dart:math';

import 'package:eshop/utils/colors.dart';
import '../widgets/bottom_navigation.dart';
import 'package:eshop/widgets/item_card.dart';
import 'package:eshop/widgets/mini_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProducts extends StatelessWidget {
  MyProducts({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> listItem = [
    {
      'title': 'Apple Watch',
      'img': 'assets/images/apple.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 59.99,
      'isFavourite': true,
    },
    {
      'title': 'IPhone',
      'img': 'assets/images/iphone.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 1059.99,
      'isFavourite': true,
    },
    {
      'title': 'Air jorden',
      'img': 'assets/images/airjorden.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 79.99,
      'isFavourite': true,
    },
    {
      'title': 'Airpods',
      'img': 'assets/images/airpod_product.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 64.99,
      'isFavourite': true,
    },
    {
      'title': 'Amazon Speaker',
      'img': 'assets/images/amazon.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 159.99,
      'isFavourite': false,
    },
    {
      'title': 'Google shirt',
      'img': 'assets/images/tshirt.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 29.99,
      'isFavourite': true,
    },
    {
      'title': 'Speaker',
      'img': 'assets/images/product3.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 39.99,
      'isFavourite': true,
    }
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/images/back.svg',
                  ),
                  const Text(
                    'Your Product',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  SvgPicture.asset(
                    'assets/images/more.svg',
                  ),
                ],
              ),
              const SizedBox(height: 18),
              ItemCard(
                item: listItem[0],
                  color:
                  colorAvaliable[2]
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 4),
                  itemCount: listItem.length,
                  itemBuilder: (ctx, index) => MiniItemCard(
                    name: listItem[index]['title'],
                    path: listItem[index]['img'],
                    price: listItem[index]['price'],
                    isFavourite: listItem[index]['isFavourite'],
                    color:
                        colorAvaliable[index%colorAvaliable.length],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(1),
    );
  }
}
