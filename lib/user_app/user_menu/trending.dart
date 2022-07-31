import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:provider/provider.dart';

import '../../models/reviews_model.dart';

class trending_user extends StatefulWidget {
  const trending_user({Key? key, this.data}) : super(key: key);
  final DealData? data;

  @override
  State<trending_user> createState() => _trending_userState();
}

class _trending_userState extends State<trending_user> {
  static const String baseUrl = 'https://gigiapi.zanforthstaging.com/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217,
      width: 141,
      margin: const EdgeInsets.only(right: 8),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: widget.data!.images != null &&
                    widget.data!.images!.isNotEmpty
                ? Image.network(
                    '$baseUrl${widget.data!.images![0].path!}/${widget.data!.images![0].image}',
                    height: 120,
                    width: 120)
                : Image.asset(
                    'assets/images/menu.png',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          Text(
            widget.data!.name!,
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/menu_location.png',
                width: 8,
                height: 8,
              ),
              const Text(
                'Beauty Parlor - Baku, Azerbaijan',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 7,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF848484)),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset('assets/images/rating.png', width: 6, height: 6),
              Text(
                Reviews().getRating(widget.data!.reviews),
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 7,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5F5F5F)),
              ),
              Text(
                '(${widget.data!.reviews!.length} reviews)',
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 4,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5F5F5F)),
              ),
            ],
          ),
          Row(
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
                widget.data!.price ?? '',
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
                Provider.of<DealProvider>(context).calculateDiscount(
                    widget.data!.discountOnPrice!, widget.data!.price!),
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Center(
                  child: Text(
                    '${widget.data!.discountOnPrice ?? 0}% OFF',
                    style: const TextStyle(
                        fontSize: 5,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Coupons Left:  100/100',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8E8EA9)),
          ),
        ],
      ),
    );
  }
}
