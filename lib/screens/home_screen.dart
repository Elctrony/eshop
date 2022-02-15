import 'package:eshop/utils/colors.dart';
import 'package:eshop/widgets/bottom_navigation.dart';
import 'package:eshop/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<Map> itemsList = [
    {'name': 'Nike', 'path': 'assets/images/airjorden.png', 'price': 50},
    {'name': 'Hoodie', 'path': 'assets/images/hoodie.png', 'price': 30},
    {'name': 'IPhone', 'path': 'assets/images/iphone.png', 'price': 1600}
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 4 / 5,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  color: Colors.black.withOpacity(0.5))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefix: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                margin: const EdgeInsets.only(top: 6),
                                child: SvgPicture.asset(
                                  'assets/images/search.svg',
                                  color: iconColor,
                                  width: 15,
                                ),
                              ),
                              hintText: 'Search....',
                              suffixIcon: CircleAvatar(
                                backgroundColor: containerBackground,
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/images/mic.svg',
                                    color: iconColor,
                                    width: 15,
                                  ),
                                  onPressed: () => print('Mic'),
                                ),
                              )),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/images/cart.svg',
                            width: 20,
                          ),
                          onPressed: () => print('typedd'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: AnnouncementCard(),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Featured',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 200,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                  ),
                  child: ListView.builder(
                    itemBuilder: (ctx, i) => MiniItemCard(
                      name: itemsList[i]['name'],
                      path: itemsList[i]['path'],
                      price: itemsList[i]['price'],
                    ),
                    itemCount: itemsList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'All',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See All',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                    child: ListView.builder(
                      itemBuilder: (ctx, i) => ItemCard(),
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatefulWidget {
  AnnouncementCard({Key? key}) : super(key: key);

  @override
  State<AnnouncementCard> createState() => _AnnouncementCardState();
}

class _AnnouncementCardState extends State<AnnouncementCard> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  final numOfCard = 5;
  final pageCardController = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          height: 160,
          child: PageView.builder(
            itemBuilder: (ctx, index) => Image.asset(
              'assets/images/discount.png',
              fit: BoxFit.fitHeight,
            ),
            itemCount: numOfCard,
            onPageChanged: (i) => setState(() {
              _currentPageNotifier.value = i;
            }),
            controller: pageCardController,
          ),
        ),
        CirclePageIndicator(
          currentPageNotifier: _currentPageNotifier,
          itemCount: numOfCard,
          dotColor: Colors.orange[100],
          selectedDotColor: Colors.orange[700],
          onPageSelected: (index) => pageCardController.jumpToPage(index),
        )
      ],
    );
  }
}

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
      height: 180,
      child: Column(
        children: [
          ClipRRect(
            child: Container(
              height: 120,
              width: 150,
              color: const Color.fromRGBO(208, 227, 250, 1),
              child: Image.asset(path),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          SizedBox(
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
