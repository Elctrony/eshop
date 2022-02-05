import 'package:eshop/utils/colors.dart';
import '../widgets/bottom_navigation.dart';
import 'package:eshop/widgets/item_card.dart';
import 'package:eshop/widgets/mini_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProducts extends StatelessWidget {
  MyProducts({Key? key}) : super(key: key);
  final listItem = [
    {'name': 'Fuji X-Pro3', 'path': 'assets/images/product1.png', 'price': 399},
    {'name': 'Fuji X-Pro3', 'path': 'assets/images/product2.png', 'price': 99},
    {'name': 'Fuji X-Pro3', 'path': 'assets/images/product1.png', 'price': 399},
    {'name': 'Fuji X-Pro3', 'path': 'assets/images/product2.png', 'price': 399},
    {'name': 'Fuji X-Pro3', 'path': 'assets/images/product1.png', 'price': 399},
    {'name': 'Fuji X-Pro3', 'path': 'assets/images/product2.png', 'price': 399},
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
              const ItemCard(),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 4),
                  itemCount: listItem.length,
                  itemBuilder: (ctx, index) => MiniItemCard(
                    name: listItem[index]['name'],
                    path: listItem[index]['path'],
                    price: listItem[index]['price'],
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
