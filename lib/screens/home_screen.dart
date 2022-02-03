import 'package:eshop/utils/colors.dart';
import 'package:eshop/widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
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
                              prefixIcon: const Icon(
                                Icons.search,
                                color: iconColor,
                              ),
                              hintText: 'Search....',
                              suffixIcon: CircleAvatar(
                                backgroundColor: containerBackground,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.mic_none,
                                    color: iconColor,
                                  ),
                                  onPressed: () => print('Mic'),
                                ),
                              )),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        child: IconButton(
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
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
                    itemBuilder: (ctx, i) => FeaturedCard(),
                    itemCount: 3,
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
      bottomNavigationBar: BottomWidget(),
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

class FeaturedCard extends StatelessWidget {
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
              child: Image.asset('assets/images/airjorden.png'),
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
                  children: const [
                    Text(
                      'Air jordan',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '\$50',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border))
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
    );
  }
}
