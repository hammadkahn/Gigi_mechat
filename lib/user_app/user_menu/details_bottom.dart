import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class bottom_detail extends StatelessWidget {
  const bottom_detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _value = 0;
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
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
                    'Avocado Chicken Salad(Medium)',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A4A6A)),
                  ),
                  Spacer(),
                  Radio(value: 1, groupValue: _value, onChanged: (value) {})
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
                  Text(
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
                    '4.8',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5F5F5F)),
                  ),
                  Text(
                    '(30 reviews)',
                    style: TextStyle(
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
                  Text(
                    '\$',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFF6767)),
                  ),
                  Text(
                    '10.40',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFF6767)),
                  ),
                  Text(
                    '\$',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0D9BFF)),
                  ),
                  Text(
                    '8.40',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0D9BFF)),
                  ),
                  Container(
                    width: 28,
                    height: 11,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Center(
                      child: Text(
                        '20% OFF',
                        style: TextStyle(
                            fontSize: 5,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0D9BFF)),
                      ),
                    ),
                  )
                ],
              )),
          Text(
            'Coupons Left:  100/100',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 7,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8E8EA9)),
          ),
          Text(
            'Description',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8E8EA9)),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet \n, consectetur adipiscing elit.',
            style: TextStyle(
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
