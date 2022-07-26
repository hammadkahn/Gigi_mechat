import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';

class bottom_detail extends StatelessWidget {
  const bottom_detail(
      {Key? key,
      required this.dealData,
      required this.price,
      required this.totalReviews})
      : super(key: key);
  final DealData dealData;
  final String price;
  final String totalReviews;

  @override
  Widget build(BuildContext context) {
    int value = 0;
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
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
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Text(
                    dealData.name!,
                    style: const TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A4A6A)),
                  ),
                  const Spacer(),
                  Radio(value: 1, groupValue: value, onChanged: (value) {})
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 4),
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
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Image.asset('assets/images/rating.png', width: 6, height: 6),
                  Text(
                    totalReviews,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5F5F5F)),
                  ),
                  Text(
                    '(${dealData.reviews!.length.toString()} reviews)',
                    style: const TextStyle(
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
                  const Text(
                    '\$',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFF6767)),
                  ),
                  Text(
                    dealData.price!,
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
                    price,
                    style: const TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0D9BFF)),
                  ),
                  Container(
                    width: 28,
                    height: 11,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Center(
                      child: Text(
                        '${dealData.discountOnPrice}% OFF',
                        style: const TextStyle(
                            fontSize: 5,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0D9BFF)),
                      ),
                    ),
                  )
                ],
              )),
          const Text(
            'Coupons Left:  100/100',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 7,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8E8EA9)),
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8E8EA9)),
          ),
          Text(
            dealData.description!,
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8E8EA9)),
          ),
        ],
      ),
    );
  }
}
