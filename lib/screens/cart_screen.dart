import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.98),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/images/back.svg',
                      width: 25,
                    ),
                    const Text('Cart',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500)),
                    SvgPicture.asset(
                      'assets/images/more.svg',
                      width: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                            child: Image.asset(
                              'assets/images/product_details.png',
                              width: size.height / 7,
                              fit: BoxFit.fitHeight,
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
                                children: [
                                  Text(
                                    'Brand New Shoues',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                  Text('\$15',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 1))),
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: TextButton.icon(
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.star,
                                          color: Color.fromRGBO(249, 108, 5, 1),
                                        ),
                                        label: Text('(50)')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Color.fromRGBO(249, 108, 5, 1)
                                    .withOpacity(0.1),
                                child: IconButton(
                                  onPressed: () {
                                    print('add');
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Color.fromRGBO(249, 108, 5, 1),
                                    size: 18,
                                  ),
                                ),
                              ),
                              Text('1',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 1))),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Color.fromRGBO(249, 108, 5, 1)
                                    .withOpacity(0.1),
                                child: IconButton(
                                  onPressed: () {
                                    print('remove');
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Color.fromRGBO(249, 108, 5, 1),
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                color: Colors.white.withOpacity(1.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Total Products',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 1.5,
                        width: 10,
                        key: Key('Divider'),
                      ),
                      Column(
                        children: const [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            '110',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color.fromRGBO(249, 108, 5, 1),
                  child: Text(
                    'Go To Checkout',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
