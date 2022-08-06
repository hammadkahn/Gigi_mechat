import 'package:flutter/material.dart';
import 'package:gigi_app/apis/api_urls.dart';
import 'package:provider/provider.dart';

import '../../models/deal_model.dart';
import '../../models/reviews_model.dart';
import '../../providers/deal_provider.dart';

class sheet_deals extends StatefulWidget {
  const sheet_deals({Key? key, required this.dealData, required this.token})
      : super(key: key);
  final Data? dealData;
  final String token;

  @override
  State<sheet_deals> createState() => _sheet_dealsState();
}

class _sheet_dealsState extends State<sheet_deals> {
  double? percentage;
  double? price;
  double? priceAfterDiscount;
  String? totalReviews = '0';
  int? value = 0;
  var isLaoding = false;

  @override
  void initState() {
    getRating();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    percentage = int.parse(widget.dealData!.discountOnPrice!) / 100;
    price = percentage! * int.parse(widget.dealData!.price!);
    priceAfterDiscount = int.parse(widget.dealData!.price!) - price!;

    // totalReviews = Reviews().getRating(widget.data!.reviews!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Divider(
          color: Color(0xFFC0C0CF),
          thickness: 5,
          indent: 120,
          endIndent: 120,
        ),
        widget.dealData!.image == null || widget.dealData!.image!.image!.isEmpty
            ? Image.asset(
                'assets/images/detail.png',
                height: 248,
                width: MediaQuery.of(context).size.width,
              )
            : Image.network(
                '${ApiUrls.imgBaseUrl}${widget.dealData!.image!.path!}/${widget.dealData!.image!.image}',
                height: 248,
                width: MediaQuery.of(context).size.width,
              ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(
            'Offer of the Week',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA5A5BA)),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Text(
              widget.dealData!.name!,
              style: const TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4A4A6A)),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/menu_location.png',
                  width: 8,
                  height: 8,
                ),
                const Text(
                  'Cafe Bistrovia - Baku, Azerbaijan',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF8E8EA9)),
                ),
              ],
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              children: [
                Image.asset('assets/images/rating.png', width: 6, height: 6),
                Text(
                  rating == null || rating!.data!.isEmpty
                      ? '0'
                      : Reviews().getRating(rating!.data),
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 7,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5F5F5F)),
                ),
                Text(
                  '(${rating == null || rating!.data!.isEmpty ? '0' : rating!.data!.length.toString()} reviews)',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 4,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5F5F5F)),
                ),
              ],
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              children: [
                const Text(
                  '\$',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF6767)),
                ),
                Text(
                  widget.dealData!.price!,
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontFamily: 'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFF6767)),
                ),
                const Text(
                  '\$',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0D9BFF)),
                ),
                Text(
                  priceAfterDiscount.toString(),
                  style: const TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0D9BFF)),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(
            'Discount type : ${widget.dealData!.type!}',
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Color(0xFF0D9BFF)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(
            'Description',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8E8EA9)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(
            widget.dealData!.description!,
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8E8EA9)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  ReviewsModel? rating;
  Future<void> getRating() async {
    final result = await Provider.of<DealProvider>(context, listen: false)
        .getDealRating(widget.token, widget.dealData!.id.toString());
    setState(() {
      rating = result;
    });
  }
}
