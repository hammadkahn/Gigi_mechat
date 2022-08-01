import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/user_menu/review.dart';

class qr_cont extends StatelessWidget {
  const qr_cont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 94 / 327,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFE8E8E8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 6, left: 26, right: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Qr Code: ',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 6,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000)),
                  /*defining default style is optional */
                  children: <TextSpan>[
                    TextSpan(
                        text: ' 12345678',
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 6,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D9BFF))),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text('Avocado Chicken Salad (Medium)',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF32324D))),
              SizedBox(height: 10),
              Row(
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
                        color: Color(0xFF848484)),
                  ),
                  Spacer(),
                  Text(
                    'Redeemed',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF0D0D)),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(children: [
                Text('Date Purchased: ',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 7,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8E8EA9))),
                Text('27- April-2022',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0D9BFF))),
                SizedBox(width: 10),
                Text('Date Purchased: ',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 7,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8E8EA9))),
                Text('28-May-2022',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0D9BFF))),
                Spacer(),
                Container(
                  width: 55,
                  height: 11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFF0D9BFF),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => review()),
                      child: Text('★ Write a Review',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 5,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFFFFFFF))),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
