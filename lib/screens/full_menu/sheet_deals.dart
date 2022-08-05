import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class sheet_deals extends StatelessWidget {
  const sheet_deals({Key? key}) : super(key: key);

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
        Image.asset(
          'assets/images/detail.png',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
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
              'Avocado Chicken \nSalad',
              style: TextStyle(
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
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
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(
            'Coupons Left:  100/100',
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
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8E8EA9)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
