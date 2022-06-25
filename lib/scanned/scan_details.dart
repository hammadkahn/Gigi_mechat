import 'package:flutter/material.dart';
import 'package:gigi_app/ham_burger/ham_burger.dart';
import 'package:gigi_app/screens/authentication/text_feild.dart';

import '../shared/custom_button.dart';

class Scanned_details extends StatelessWidget {
  const Scanned_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 137, right: 24, left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'G.Mamedof',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0D9BFF)),
              ),
              Text(
                textAlign: TextAlign.center,
                'Have 20% OFF on\nEntire Menu \n\nCoupon : GiGi12345',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              Text(
                textAlign: TextAlign.center,
                'Scan verified',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8E8EA9)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34.5),
                child: TextField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Enter Price of the Bill',
                )),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 38),
                child: CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Ham_burger()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
