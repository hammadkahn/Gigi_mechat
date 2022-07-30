import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gigi_app/user_app/user_menu/wishlist.dart';

import '../../shared/custom_button.dart';
import 'cart_deals.dart';
import 'cart_user.dart';
import 'order_status1.dart';

class Fav_user extends StatelessWidget {
  const Fav_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(left: 24, right: 32, top: 17),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                    'assets/images/arrow-left.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              'Your Wishlist',
                              style: const TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF32324D)),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Wishlist(),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          text: 'Add to Cart ➔',
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Cart_user()));
                          })
                    ]))));
  }
}
