import 'package:flutter/material.dart';
import 'package:gigi_app/constant/size_constants.dart';

class Deals extends StatelessWidget {
  const Deals(
      {Key? key,
      required this.name,
      required this.discountPrice,
      required this.actualPrice,
      required this.discount,
      this.imgUrl})
      : super(key: key);
  final String name;
  final String discountPrice;
  final String actualPrice;
  final String discount;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: SizeConfig.screenWidth,
        height: 145,
        decoration: const BoxDecoration(
            color: Color(0xFF030381),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Row(
            children: [
              Column(
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
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF)),
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
                                color: Color(0xFFFFFFFF)),
                          ),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          Image.asset('assets/images/rating.png',
                              width: 6, height: 6),
                          const Text(
                            '4.8',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 7,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF)),
                          ),
                          const Text(
                            '(30 reviews)',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFFFFF)),
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
                                color: Color(0xFF0D9BFF)),
                          ),
                          Text(
                            actualPrice,
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontFamily: 'Mulish',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF0D9BFF)),
                          ),
                          const Text(
                            '\$',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF)),
                          ),
                          Text(
                            discountPrice,
                            style: const TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFFFFF)),
                          ),
                          Container(
                            width: 28,
                            height: 11,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            child: Center(
                              child: Text(
                                '$discount % OFF',
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
                ],
              ),
              const Spacer(),
              Container(
                height: 120,
                width: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: imgUrl == null
                    ? Image.asset(
                        'assets/images/food.png',
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://gigiapi.zanforthstaging.com/storage/deals/$imgUrl',
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
