import 'dart:math';
import 'dart:math';
import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class OrderTrackingScreen extends StatelessWidget {
  final List<String> _items = [
    'Pending',
    'Shipping',
    'Canceled Order',
    'Completed Orders',
  ];

  int _index = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/back.svg',
                  width: 25,
                ),
                const Expanded(child: SizedBox()),
                const Text('Order Tracking',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                const Expanded(child: SizedBox()),
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    'assets/images/profile.png',
                  ),
                )
              ],
            ),
          ),
          StatefulBuilder(builder: (context, setState) {
            return SizedBox(
              width: size.width,
              height: 35,
              child: ListView.builder(
                  itemCount: _items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => TextButton(
                      onPressed: () {
                        pageController.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                        setState(() => _index = index);
                      },
                      child: Text(
                        _items[index],
                        style: TextStyle(
                            color: _index == index
                                ? Colors.orange[600]
                                : Colors.grey,
                            fontSize: 16),
                      )))),
            );
          }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  PendingList(),
                  ShippingList(),
                  CanceledList(),
                  DeliveredList(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class PendingList extends StatelessWidget {
  PendingList({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          listItem.removeAt(index);

          print(listItem);
        },
        key: UniqueKey(),
        secondaryBackground: Container(
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25)),
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/delete.svg',
                  width: 30,
                )
              ],
            )),
        background: Container(
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25)),
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/delete.svg',
                  width: 30,
                )
              ],
            )),
        child: Container(
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  height: 100,
                  color:
                      colorAvaliable[Random().nextInt(colorAvaliable.length)],
                  child: Image.asset(
                    listItem[index]['img'] as String,
                    width: size.width / 4,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listItem[index]['title'] as String,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Text(
                        listItem[index]['description'] as String,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      ),
                      Text('\$${listItem[index]['price'] as double}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 1))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShippingList extends StatelessWidget {
  ShippingList({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) => Container(
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                height: 100,
                color: colorAvaliable[Random().nextInt(colorAvaliable.length)],
                child: Image.asset(
                  listItem[index]['img'] as String,
                  width: size.width / 4,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listItem[index]['title'] as String,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        listItem[index]['description'] as String,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Text('\$${listItem[index]['price'] as double}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1))),
                  ],
                ),
              ),
            ),
            CircleAvatar(
                backgroundColor: primaryColor[900],
                radius: 20,
                child: SvgPicture.asset('assets/images/shipping.svg'))
          ],
        ),
      ),
    );
  }
}

class DeliveredList extends StatelessWidget {
  DeliveredList({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) => Container(
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                height: 100,
                color: colorAvaliable[Random().nextInt(colorAvaliable.length)],
                child: Image.asset(
                  listItem[index]['img'] as String,
                  width: size.width / 4,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listItem[index]['title'] as String,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        listItem[index]['description'] as String,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Text('\$${listItem[index]['price'] as double}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1))),
                  ],
                ),
              ),
            ),
            CircleAvatar(
                backgroundColor: Colors.green[600],
                radius: 20,
                child: SvgPicture.asset('assets/images/delivered.svg'))
          ],
        ),
      ),
    );
  }
}

class CanceledList extends StatelessWidget {
  CanceledList({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) => Container(
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                height: 100,
                color: colorAvaliable[Random().nextInt(colorAvaliable.length)],
                child: Image.asset(
                  listItem[index]['img'] as String,
                  width: size.width / 4,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listItem[index]['title'] as String,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        listItem[index]['description'] as String,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Text('\$${listItem[index]['price'] as double}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1))),
                  ],
                ),
              ),
            ),
            CircleAvatar(
                backgroundColor: Colors.red[600],
                radius: 20,
                child: SvgPicture.asset('assets/images/cancel.svg'))
          ],
        ),
      ),
    );
  }
}
