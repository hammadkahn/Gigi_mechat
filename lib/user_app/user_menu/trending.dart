import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class trending_user extends StatelessWidget {
  const trending_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217,
      width: 141,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/menu.png',
            height: 120,
            width: 120,
          ),
          Text(
            'Eybrows & Eyelash',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/menu_location.png',
                width: 8,
                height: 8,
              ),
              Text(
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
          ),
          Row(
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Center(
                  child: Text(
                    '20% OFF',
                    style: TextStyle(
                        fontSize: 5,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ],
          ),
          Text(
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
