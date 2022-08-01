import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/order.dart';

class order_details extends StatelessWidget {
  const order_details({Key? key}) : super(key: key);

  static const url = 'https://gigiapi.zanforthstaging.com/';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: cart.cartItems.length,
        itemBuilder: ((context, index) {
          int quantity;
          int.parse(cart.cartItems[index].qty!) < cart.qty
              ? quantity = cart.qty
              : quantity = int.parse(cart.cartItems[index].qty!);
          double discount =
              double.parse('0.${cart.cartItems[index].discountOnPrice}') *
                  int.parse(cart.cartItems[index].price!);
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: ExpandablePanel(
                header: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Offer details and discount",
                    style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8EA9)),
                  ),
                ),
                collapsed: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      cart.cartItems[index].image == ''
                          ? Image.asset(
                              'assets/images/expand_pic.png',
                              height: 40,
                              width: 40,
                            )
                          : Image.network(
                              '$url${cart.cartItems[index].path}/${cart.cartItems[index].image}}',
                              height: 40,
                              width: 40,
                            ),
                      Text(
                        cart.cartItems[index].title!,
                        style: const TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF32324D)),
                      ),
                      const Spacer(),
                      Text(
                        "$quantity x",
                        style: const TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFA5A5BA)),
                      ),
                      Text(
                        "${cart.cartItems[index].discountOnPrice}% off",
                        style: const TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D9BFF)),
                      ),
                    ],
                  ),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/expand_pic.png',
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          cart.cartItems[index].title!,
                          style: const TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF32324D)),
                        ),
                        const Spacer(),
                        Text(
                          "$quantity x",
                          style: const TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFA5A5BA)),
                        ),
                        Text(
                          "${cart.cartItems[index].discountOnPrice}% off",
                          style: const TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0D9BFF)),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Divider(
                        color: Color(0xFFEAEAEF),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        children: [
                          const Text("Real price",
                              style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF666687))),
                          const Spacer(),
                          Text(
                              " \$${quantity * double.parse(cart.cartItems[index].price!)} ",
                              style: const TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF4A4A6A))),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Text("Discount",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF666687))),
                        const Spacer(),
                        Text(" \$ ${discount * quantity}",
                            style: const TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4A4A6A))),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Divider(
                        color: Color(0xFFEAEAEF),
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        const Text("Total Price",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4A4A6A))),
                        const Spacer(),
                        Text(
                            " \$ ${cart.calculateRealPrice(quantity, cart.cartItems[index].discountOnPrice!, cart.cartItems[index].price!)}",
                            style: const TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0D9BFF))),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
