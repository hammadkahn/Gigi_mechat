import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/models/reviews_model.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:provider/provider.dart';

import 'details_bottom.dart';

class Details_deals extends StatefulWidget {
  const Details_deals({Key? key, this.data, required this.token})
      : super(key: key);
  final DealData? data;
  final String token;

  @override
  State<Details_deals> createState() => _Details_dealsState();
}

class _Details_dealsState extends State<Details_deals> {
  static const baseUrl = 'https://gigiapi.zanforthstaging.com/';
  double? percentage;
  double? price;
  double? priceAfterDiscount;
  String? totalReviews;
  int? value = 0;
  var isLaoding = false;

  @override
  void initState() {
    print(widget.data);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    percentage = int.parse(widget.data!.discountOnPrice!) / 100;
    price = percentage! * int.parse(widget.data!.price!);
    priceAfterDiscount = int.parse(widget.data!.price!) - price!;
    totalReviews = Reviews().getRating(widget.data!.reviews!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build...');

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: Color(0xFFC0C0CF),
            thickness: 5,
            indent: 120,
            endIndent: 120,
          ),
          widget.data!.images == null || widget.data!.images!.isEmpty
              ? Image.asset(
                  'assets/images/detail.png',
                  height: 248,
                  width: MediaQuery.of(context).size.width,
                )
              : Image.network(
                  '$baseUrl${widget.data!.images![0].path!}/${widget.data!.images![0].image}',
                  height: 248,
                  width: MediaQuery.of(context).size.width,
                ),
          bottom_detail(
            totalReviews: totalReviews.toString(),
            dealData: widget.data!,
            price: priceAfterDiscount.toString(),
          ),
          const Divider(
            color: Color(0xFFC0C0CF),
            thickness: 1,
            indent: 24,
            endIndent: 24,
          ),
          Container(
            width: double.infinity,
            height: 86,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE6E6E6), width: 1)),
            child: Consumer<DealProvider>(
              builder: ((context, value, child) {
                return Container(
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF5F5F5)),
                  child: Row(
                    children: [
                      Container(
                        width: 117,
                        height: 52,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFF5F5F5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: value.qty <= 0
                                    ? null
                                    : () => value.decreaseQty(),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 16,
                                )),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xFFF5F5F5)),
                              child: Text(
                                value.qty.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            InkWell(
                                onTap: () => value.increaseQty(),
                                child: const Icon(
                                  Icons.add,
                                  size: 16,
                                )),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 200,
                        height: 54,
                        decoration: BoxDecoration(
                            color: const Color(0xFF030381),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: InkWell(
                              onTap: value.qty <= 0
                                  ? null
                                  : () {
                                      Map<String, dynamic> data = {
                                        "deals[0][id]":
                                            widget.data!.id.toString(),
                                        "deals[0][quantity]":
                                            value.qty.toString(),
                                        "deals[0][price]":
                                            widget.data!.price.toString(),
                                        "deals[0][total_price]":
                                            priceAfterDiscount.toString(),
                                        "deals[0][discount]": widget
                                            .data!.discountOnPrice
                                            .toString(),
                                      };
                                      value
                                          .addToCart(widget.token, data)
                                          .whenComplete(
                                            () => ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(value.msg),
                                              ),
                                            ),
                                          );
                                    },
                              child: isLaoding
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFFFFF)),
                                    )),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
