import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:provider/provider.dart';

import '../../constant/size_constants.dart';
import '../../models/wish_list_model.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key, required this.wishData}) : super(key: key);
  final WishData wishData;
  static const url = 'https://gigiapi.zanforthstaging.com/';
=======
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constant/size_constants.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);
>>>>>>> adcec233bd91225932230a07976921e794992cd8

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: 120,
<<<<<<< HEAD
      decoration: const BoxDecoration(
=======
      decoration: BoxDecoration(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
<<<<<<< HEAD
          wishData.image == null
              ? Image.asset(
                  'assets/images/cart_deal.png',
                  height: 119,
                )
              : Expanded(
                  child: Image.network(
                      '$url${wishData.image!.path}/${wishData.image!.image}'),
                ),
=======
          Image.asset(
            'assets/images/cart_deal.png',
            height: 119,
          ),
>>>>>>> adcec233bd91225932230a07976921e794992cd8
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
<<<<<<< HEAD
                      wishData.name!,
                      style: const TextStyle(
=======
                      'Avocado Chicken \nSalad (Medium)',
                      style: TextStyle(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                          fontFamily: 'Mulish',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF32324D)),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/menu_location.png',
                          width: 8,
                          height: 8,
                        ),
<<<<<<< HEAD
                        const Text(
=======
                        Text(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                          'Cafe Bistrovia - Baku, Azerbaijan',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF848484)),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Image.asset('assets/images/rating.png',
                            width: 6, height: 6),
<<<<<<< HEAD
                        const Text(
=======
                        Text(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                          '4.8',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5F5F5F)),
                        ),
<<<<<<< HEAD
                        const Text(
=======
                        Text(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                          '(30 reviews)',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 4,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5F5F5F)),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 2.83),
                    child: Row(
                      children: [
<<<<<<< HEAD
                        const Text(
=======
                        Text(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                          '\$',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF6767)),
                        ),
                        Text(
<<<<<<< HEAD
                          wishData.price!,
                          style: const TextStyle(
=======
                          '10.40',
                          style: TextStyle(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                              decoration: TextDecoration.lineThrough,
                              fontFamily: 'Mulish',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFF6767)),
                        ),
<<<<<<< HEAD
                        const Text(
=======
                        Text(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                          '\$',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0D9BFF)),
                        ),
                        Text(
<<<<<<< HEAD
                          Provider.of<DealProvider>(context).calculateDiscount(
                            wishData.discountOnPrice!,
                            wishData.price!,
                          ),
                          style: const TextStyle(
=======
                          '8.40',
                          style: TextStyle(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                              fontFamily: 'Mulish',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF0D9BFF)),
                        ),
                        Container(
                          width: 28,
                          height: 11,
<<<<<<< HEAD
                          decoration: const BoxDecoration(
=======
                          decoration: BoxDecoration(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          child: Center(
                            child: Text(
<<<<<<< HEAD
                              '${wishData.discountOnPrice}% OFF',
                              style: const TextStyle(
=======
                              '20% OFF',
                              style: TextStyle(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                                  fontSize: 5,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF0D9BFF)),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
