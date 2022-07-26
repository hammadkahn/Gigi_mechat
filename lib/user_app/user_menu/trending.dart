import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';

class trending_user extends StatefulWidget {
  const trending_user({Key? key, required this.data}) : super(key: key);
  final DealData data;

  @override
  State<trending_user> createState() => _trending_userState();
}

class _trending_userState extends State<trending_user> {
  double? priceAfterDiscount = 0;
  double? price;
  double? percentage;

  static const baseUrl = 'https://gigiapi.zanforthstaging.com/';

  @override
  void initState() {
    percentage = int.parse(widget.data.discountOnPrice!) / 100;
    price = percentage! * int.parse(widget.data.price!);
    priceAfterDiscount = int.parse(widget.data.price!) - price!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('percentage${widget.data.discountOnPrice!}');
    print(percentage);
    print(priceAfterDiscount);
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
        children: [
          // widget.data.images != null
          //     ? Image.network(
          //         '$baseUrl${widget.data.images![0].path!}/${widget.data.images![0].image}',
          //         height: 110,
          //         width: 120) :
          Image.asset('assets/images/menu.png', height: 120, width: 120),
          Text(
            widget.data.name!,
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
              const Text(
                '4.8',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 7,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5F5F5F)),
              ),
              const Text(
                '(30 reviews)',
                style: TextStyle(
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
                widget.data.price!,
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
              Container(
                width: 28,
                height: 11,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Center(
                  child: Text(
                    '${widget.data.discountOnPrice}% OFF',
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
