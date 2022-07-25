import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/user_menu/details_bottom.dart';

class Details_deals extends StatefulWidget {
  const Details_deals({Key? key}) : super(key: key);

  @override
  State<Details_deals> createState() => _Details_dealsState();
}

class _Details_dealsState extends State<Details_deals> {
  @override
  Widget build(BuildContext context) {
    int _value = 0;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: Color(0xFFC0C0CF),
            thickness: 5,
            indent: 120,
            endIndent: 120,
          ),
          Image.asset(
            'assets/images/detail.png',
            height: 248,
            width: MediaQuery.of(context).size.width,
          ),
          bottom_detail(),
          Divider(
            color: Color(0xFFC0C0CF),
            thickness: 1,
            indent: 24,
            endIndent: 24,
          ),
          bottom_detail(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 86,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFE6E6E6), width: 1)),
            child: Row(
              children: [
                Container(
                  width: 117,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF5F5F5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 16,
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xFFF5F5F5)),
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          )),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: 200,
                  height: 54,
                  decoration: BoxDecoration(
                      color: Color(0xFF030381),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
