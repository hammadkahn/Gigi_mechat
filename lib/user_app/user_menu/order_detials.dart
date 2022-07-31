import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:gigi_app/models/cart_model.dart';

class order_details extends StatelessWidget {
  const order_details({Key? key, required this.data, required this.qty})
      : super(key: key);
  final List<CartData> data;
  final String qty;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
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
                          Image.asset(
                            'assets/images/expand_pic.png',
                            height: 40,
                            width: 40,
                          ),
                          const Text(
                            "Avocado Chicken Salad",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF32324D)),
                          ),
                          const Spacer(),
                          const Text(
                            "1 x",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFA5A5BA)),
                          ),
                          const Text(
                            "20% off",
                            style: TextStyle(
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
                            const Text(
                              "Avocado Chicken Salad",
                              style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF32324D)),
                            ),
                            const Spacer(),
                            const Text(
                              "1 x",
                              style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFA5A5BA)),
                            ),
                            const Text(
                              "20% off",
                              style: TextStyle(
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
                            children: const [
                              Text("Real price",
                                  style: TextStyle(
                                      fontFamily: "Mulish",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF666687))),
                              Spacer(),
                              Text(" \$ 10.42",
                                  style: TextStyle(
                                      fontFamily: "Mulish",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF4A4A6A))),
                            ],
                          ),
                        ),
                        Row(
                          children: const [
                            Text("Discount",
                                style: TextStyle(
                                    fontFamily: "Mulish",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF666687))),
                            Spacer(),
                            Text(" \$ 2.00",
                                style: TextStyle(
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
                          children: const [
                            Text("Total Price",
                                style: TextStyle(
                                    fontFamily: "Mulish",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF4A4A6A))),
                            Spacer(),
                            Text(" \$ 8.42",
                                style: TextStyle(
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
                );
              }))),
    );
  }
}
