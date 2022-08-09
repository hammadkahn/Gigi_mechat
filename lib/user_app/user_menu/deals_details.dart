import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:provider/provider.dart';

import '../../models/reviews_model.dart';
import '../../providers/order.dart';
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

  int? value = 0;
  var isLaoding = false;

  @override
  void initState() {
    debugPrint('id...........${widget.data!.id}');
    getRating();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    percentage = int.parse(widget.data!.discountOnPrice!) / 100;
    price = percentage! * int.parse(widget.data!.price!);
    priceAfterDiscount = int.parse(widget.data!.price!) - price!;
    print(widget.data);
    // totalReviews = Reviews().getRating(widget.data!.reviews!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Stack(
              children: [
                widget.data!.image == null || widget.data!.image!.image!.isEmpty
                    ? Image.asset(
                        'assets/images/detail.png',
                        height: 248,
                        width: MediaQuery.of(context).size.width,
                      )
                    : Image.network(
                        '$baseUrl${widget.data!.image!.path!}/${widget.data!.image!.image}',
                        height: 248,
                        width: MediaQuery.of(context).size.width,
                      ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 12, top: 8),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(
                        isLaoding == false
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: isLaoding == false ? Colors.black : Colors.red,
                        size: 20,
                      ),
                      onPressed: () {
                        Provider.of<DealProvider>(context, listen: false)
                            .wishList(widget.token, {
                          "deals[0]": widget.data!.id.toString()
                        }).whenComplete(() {
                          setState(() {
                            isLaoding = true;
                          });
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          rating == null
              ? const Center(child: CircularProgressIndicator())
              : bottom_detail(
                  totalReviews: Reviews().getRating(rating!.data),
                  length: rating!.data!.length.toString(),
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
            child: Consumer<Cart>(
              builder: ((context, value, child) {
                return Container(
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF5F5F5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  size: 20,
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
                                    color: Colors.black, fontSize: 22),
                              ),
                            ),
                            InkWell(
                                onTap: () => value.increaseQty(),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 54,
                        decoration: BoxDecoration(
                            color: const Color(0xFF030381),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: InkWell(
                              onTap: value.qty <= 0
                                  ? () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Please add at least one quantity')));
                                    }
                                  : () {
                                      value.addTCart(
                                          id: widget.data!.id.toString(),
                                          price: widget.data!.price!,
                                          discountOnPrice:
                                              widget.data!.discountOnPrice!,
                                          title: widget.data!.name!,
                                          reviews: '0',
                                          image: widget.data!.image == null ||
                                                  widget.data!.image!.image!
                                                      .isEmpty
                                              ? ''
                                              : widget.data!.image!.image!,
                                          reviewsCount: '0',
                                          path: widget.data!.image == null
                                              ? ''
                                              : widget.data!.image!.path!);
                                      value.checkIsAddedToCart(context);
                                    },
                              child: const Text(
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

  ReviewsModel? rating;
  Future<void> getRating() async {
    final result = await Provider.of<DealProvider>(context, listen: false)
        .getDealRating(widget.token, widget.data!.id.toString());

    setState(() {
      rating = result;
    });

    debugPrint(rating!.data!.length.toString());
  }
}
