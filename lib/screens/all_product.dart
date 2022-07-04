import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllProduct extends StatelessWidget {
  AllProduct({Key? key}) : super(key: key);

  final itemList = [
    {
      'title': 'Airbod',
      'path': 'assets/images/airpods.png',
      'price': 39.66,
      'fav': true,
      'checked': true
    },
    {
      'title': 'Airbod',
      'path': 'assets/images/airpods.png',
      'price': 39.66,
      'fav': false,
      'checked': false
    }
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.99),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/back.svg',
                  width: 25,
                ),
                const Text('All',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                SvgPicture.asset(
                  'assets/images/search.svg',
                  width: 25,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 18, right: 18),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.25,
                    mainAxisSpacing: 16),
                itemCount: itemList.length,
                itemBuilder: (ctx, index) => ProductItem(
                  title: itemList[index]['title'] as String,
                  price: itemList[index]['price'] as double,
                  chceked: itemList[index]['checked'] as bool,
                  favorite: itemList[index]['fav'] as bool,
                  imgPath: itemList[index]['path'] as String,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class ProductItem extends StatelessWidget {
  String? imgPath;
  String? title;
  bool? chceked;
  double? price;
  bool? favorite;
  ProductItem(
      {Key? key,
      this.title = '',
      this.imgPath = '',
      this.price = 0.0,
      this.chceked = false,
      this.favorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  imgPath!,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: 150,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '\$$price',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 18,
              right: 18,
              child: SvgPicture.asset(
                favorite!
                    ? 'assets/images/fav.svg'
                    : 'assets/images/favorite.svg',
                width: 25,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(9.5),
                  decoration: BoxDecoration(
                      color: (chceked!) ? Colors.green : Colors.blue,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(12))),
                  child: Icon(
                    (chceked!) ? Icons.check : Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
