import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constant/size_constants.dart';

class cart_deals extends StatelessWidget {
  const cart_deals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: 120,
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
          Image.asset(
            'assets/images/cart_deal.png',
            height: 119,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Avocado Chicken \nSalad (Medium)',
                      style: TextStyle(
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
                        Text(
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
                        Text(
                          '4.8',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5F5F5F)),
                        ),
                        Text(
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
                        Text(
                          '\$',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF6767)),
                        ),
                        Text(
                          '10.40',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontFamily: 'Mulish',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFF6767)),
                        ),
                        Text(
                          '\$',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0D9BFF)),
                        ),
                        Text(
                          '8.40',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF0D9BFF)),
                        ),
                        Container(
                          width: 28,
                          height: 11,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          child: Center(
                            child: Text(
                              '20% OFF',
                              style: TextStyle(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFEAFFFA)),
                    child: const Icon(
                      Icons.remove,
                      color: Color(0xFF0D9BFF),
                      size: 16,
                    ),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                      color: Color(0xff666687),
                      fontSize: 14,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFEAFFFA)),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF0D9BFF),
                      size: 16,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
