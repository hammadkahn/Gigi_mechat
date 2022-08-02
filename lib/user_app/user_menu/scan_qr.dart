import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class scan_qr extends StatelessWidget {
  const scan_qr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(right: 24, left: 24, top: 55, bottom: 100),
          child: Column(
            children: [
              Text(
                'Show this QR on outlet \n to avail this offer',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DMSans',
                    color: Color(0xFF32324D)),
              ),
              SizedBox(height: 55),
              Image.asset(
                'assets/images/scan_qr.png',
                width: 225,
                height: 238,
              ),
              SizedBox(height: 29),
              Text('Your Offer ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF8E8EA9))),
              Text('Avocado Chicken Salad',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF0D9BFF))),
              Text('20% Discount',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF8E8EA9))),
              SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get Date: ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                          color: Color(0xFF343434))),
                  Text('26 May 2022',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                          color: Color(0xFF8E8EA9))),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Expiry Date: ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                          color: Color(0xFF343434))),
                  Text('26 June 2022',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                          color: Color(0xFF8E8EA9))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
