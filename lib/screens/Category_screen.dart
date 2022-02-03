import 'package:eshop/utils/colors.dart';
import 'package:eshop/widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final itemList = [
    {'name': 'Music', 'path': 'assets/images/music.svg'},
    {'name': 'Electronics', 'path': 'assets/images/electronics.svg'},
    {'name': 'Fashion', 'path': 'assets/images/fashion.svg'},
    {'name': 'Agriculture', 'path': 'assets/images/agriculture.svg'},
    {'name': 'Web Design', 'path': 'assets/images/web_design.svg'},
    {'name': 'Digital Services', 'path': 'assets/images/digital_services.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
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
                            blurRadius: 1, color: Colors.black.withOpacity(0.5))
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
                      Icons.filter_alt_outlined,
                    ),
                    onPressed: () => print('filter'),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  for (int i = 0; i < itemList.length; i++)
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        width: size.width / 3,
                        margin: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              '${itemList[i]['path']}',
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${itemList[i]['name']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      )),
      bottomNavigationBar: BottomWidget(1),
    );
  }
}
