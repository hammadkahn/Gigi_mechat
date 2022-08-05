import 'package:flutter/material.dart';
import 'package:gigi_app/apis/api_urls.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:provider/provider.dart';

class trending_user extends StatefulWidget {
  const trending_user({Key? key, this.data}) : super(key: key);
  final DealData? data;

  @override
  State<trending_user> createState() => _trending_userState();
}

class _trending_userState extends State<trending_user> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217,
      width: 145,
      margin: const EdgeInsets.only(right: 8, left: 8),
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
            child: widget.data!.image != null &&
                    widget.data!.image!.image!.isNotEmpty
                ? Image.network(
                    '${ApiUrls.imgBaseUrl}${widget.data!.image!.path!}/${widget.data!.image!.image}',
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
          const SizedBox(
            height: 4,
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
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Image.asset('assets/images/rating.png', width: 6, height: 6),
              const Text(
                '0',
                // Reviews().getRating(widget.data!.reviews),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 7,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5F5F5F)),
              ),
              const Text(
                '(0 reviews)',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 4,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5F5F5F)),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
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
          const SizedBox(
            height: 4,
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
