import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/models/reviews_model.dart';
import 'package:gigi_app/user_app/user_menu/details_bottom.dart';

class Details_deals extends StatefulWidget {
  const Details_deals({Key? key, required this.data}) : super(key: key);
  final DealData data;

  @override
  State<Details_deals> createState() => _Details_dealsState();
}

class _Details_dealsState extends State<Details_deals> {
  static const baseUrl = 'https://gigiapi.zanforthstaging.com/';
  double? percentage;
  double? price;
  double? priceAfterDiscount;
  double? totalReviews;

  @override
  void initState() {
    percentage = int.parse(widget.data.discountOnPrice!) / 100;
    price = percentage! * int.parse(widget.data.price!);
    priceAfterDiscount = int.parse(widget.data.price!) - price!;
    widget.data.reviews!.isNotEmpty
        ? totalReviews = Reviews().getRating(widget.data.reviews!)
        : totalReviews = 0.0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(totalReviews.toString());
    int value = 0;
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
          // widget.data.images == null ?
          Image.asset(
            'assets/images/detail.png',
            height: 248,
            width: MediaQuery.of(context).size.width,
          ),
          // : Image.network(
          //     '$baseUrl${widget.data.images![0].path!}/${widget.data.images![0].image}'),
          bottom_detail(
            totalReviews: totalReviews.toString(),
            dealData: widget.data,
            price: priceAfterDiscount.toString(),
          ),
          const Divider(
            color: Color(0xFFC0C0CF),
            thickness: 1,
            indent: 24,
            endIndent: 24,
          ),
          bottom_detail(
            totalReviews: totalReviews.toString(),
            dealData: widget.data,
            price: priceAfterDiscount.toString(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 86,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE6E6E6), width: 1)),
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
                          onTap: () {},
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
                        child: const Text(
                          '3',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
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
                  child: const Center(
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
