import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:gigi_app/user_app/user_menu/profile.dart';

class review extends StatelessWidget {
  const review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: Color(0xFFC0C0CF),
              thickness: 5,
              indent: 120,
              endIndent: 120,
            ),
            SizedBox(height: 5),
            Image.asset('assets/images/detail.png'),
            SizedBox(height: 12),
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
                child: Text(
                  'Avocado Chicken \nSalad',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4A4A6A)),
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
                          color: Color(0xFFFF6767F)),
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
            SizedBox(height: 12),
            Text('Coupons Left:  100/100',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 7,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8E8EA9))),
            SizedBox(height: 5),
            Text('Description',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8E8EA9))),
            SizedBox(height: 5),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet,\n consectetur adipiscing elit.',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8E8EA9))),
            SizedBox(height: 12),
            Text(
              'Review the Offer',
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4A4A6A)),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Image.asset('assets/images/rate.png', width: 18, height: 18),
                Image.asset('assets/images/rate.png', width: 18, height: 18),
                Image.asset('assets/images/rate.png', width: 18, height: 18),
                Image.asset('assets/images/rate.png', width: 18, height: 18),
                Image.asset('assets/images/rate.png', width: 18, height: 18),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: TextEditingController(),
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Write a Review..',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
                fillColor: Color(0xFFD9D9D9),
              ),
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Image.asset('assets/images/rate.png', width: 18, height: 18),
                Image.asset('assets/images/rate.png', width: 18, height: 18),
                Image.asset('assets/images/rate.png', width: 18, height: 18),
                Image.asset('assets/images/rate.png', width: 18, height: 18),
                Image.asset('assets/images/rate.png', width: 18, height: 18),
              ],
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: TextEditingController(),
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Write a Review..',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
                fillColor: Color(0xFFD9D9D9),
              ),
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                fontWeight: FontWeight.w300,
              ),
            ),
            CustomButton(text: 'Submit', onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoreProfile(),
                ),
              );
            
            })
          ],
        ),
      ),
    );
  }
}
