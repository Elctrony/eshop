import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
              child: Image.asset(
                'assets/images/product_details.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            top: 0,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SvgPicture.asset(
                        'assets/images/name.svg',
                      ),
                      SvgPicture.asset(
                        'assets/images/favorite.svg',
                        width: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height / 1.75,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () => print('Category'),
                          child: const Text(
                            'MUSIC',
                            style: TextStyle(color: Colors.blue),
                          )),
                      const Text(
                        'Wireless Headphone for Crazy Sound Lover',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 28),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Text(
                            '4.0',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(width: 4),
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            itemSize: 25.0,
                            direction: Axis.horizontal,
                            maxRating: 5,
                            unratedColor:
                                const Color.fromRGBO(250, 159, 22, 0.35),
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color.fromRGBO(250, 159, 22, 1),
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '\$100',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(width: 6),
                                    const Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(width: 6),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Amazon Alexa, also known simply as Alexa,[2] is a virtual assistant AI technology developed by Amazon, first used in the Amazon Echo smart speakers',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.1))),
                            onPressed: () {},
                            child: const Text(
                              'Chat',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            padding: const EdgeInsets.all(12),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.1))),
                            onPressed: () {},
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            padding: const EdgeInsets.all(12),
                          ),
                          MaterialButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            color: const Color.fromRGBO(249, 108, 5, 1),
                            padding: const EdgeInsets.all(12),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
