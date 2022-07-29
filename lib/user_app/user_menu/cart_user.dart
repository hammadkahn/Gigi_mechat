import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:gigi_app/user_app/user_menu/cart_deals.dart';
import 'package:gigi_app/user_app/user_menu/order_status3.dart';

class Cart_user extends StatelessWidget {
  const Cart_user({Key? key}) : super(key: key);

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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cafe Bistrovia',
                                  style: const TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF8E8EA9)),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Your cart',
                                  style: const TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF32324D)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Slidable(
                          endActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              onPressed: (context) => {},
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                            )
                          ]),
                          child: cart_deals(),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 54,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Color(0xff0D9BFF),
                                size: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('Add More Offers',
                                    style: TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff0D9BFF))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                          text: 'Get this Offer',
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => status_3()));
                          })
                    ]))));
  }
}
