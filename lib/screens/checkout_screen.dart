import 'package:eshop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/images/back.svg',
                      width: 25,
                    ),
                    const Text('Checkout',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                    SvgPicture.asset(
                      'assets/images/more.svg',
                      width: 5,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Order List',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: size.height * 3 / 10,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ListTile(
                              contentPadding: EdgeInsets.all(8),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  width: 60,
                                  height: 60,
                                  color: Color.fromRGBO(1, 85, 175, 0.12),
                                  child: Image.asset(
                                    'assets/images/tshirt.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              title: const Text(
                                'Jacket for man - FE732',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              trailing: const Text('2x\$1.2',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400))),
                          ListTile(
                              contentPadding: EdgeInsets.all(8),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  width: 60,
                                  height: 60,
                                  color: Color.fromRGBO(1, 85, 175, 0.12),
                                  child: Image.asset(
                                    'assets/images/tshirt.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              title: const Text(
                                'Jacket for man - FE732',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              trailing: const Text('2x\$1.2',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400))),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: const [
                                Text('Total - 6 Orders',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Text('\$20',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: MaterialButton(
                              color: Colors.white.withOpacity(0.98),
                              elevation: 1.5,
                              onPressed: () {},
                              child: Text(
                                'See More',
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              PaymentType(),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: Text(
                  'Card No',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '9999 8288 8387 8472',
                        suffixIcon: Icon(Icons.credit_card),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: Row(
                  children: const [
                    Text(
                      'Validity',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      'CVV',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width / 2.5,
                      child: const Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '10/23', border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    SizedBox(
                      width: size.width / 2.5,
                      child: const Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: '637', border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: Text(
                  'Card Holder Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Alex Smith',
                        suffixIcon: Icon(Icons.credit_card),
                        border: InputBorder.none),
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
                      borderRadius: BorderRadius.circular(10)),
                  color: Color.fromRGBO(249, 108, 5, 1),
                  child: Text(
                    'Confirm Payment',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class PaymentType extends StatefulWidget {
  PaymentType({Key? key}) : super(key: key);

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  color: index == 0 ? Colors.blue : Colors.white,
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Text(
                    'Credit Card',
                    style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.blue),
                  ),
                ),
                MaterialButton(
                  color: index == 1 ? Colors.blue : Colors.white,
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Text(
                    'PayPal',
                    style: TextStyle(
                        color: index == 1 ? Colors.white : Colors.blue),
                  ),
                ),
                MaterialButton(
                  color: index == 2 ? Colors.blue : Colors.white,
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Text(
                    'Cash',
                    style: TextStyle(
                        color: index == 2 ? Colors.white : Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
