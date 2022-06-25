import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gigi_app/constant/theme.dart';
import 'package:gigi_app/screens/authentication/auth.dart';
import 'package:gigi_app/screens/onboarding/onboard_carousel.dart';
import 'package:gigi_app/screens/onboarding/onboard_comp.dart';
import 'package:gigi_app/shared/custom_button.dart';

import '../../constant/data.dart';
import '../../constant/size_constants.dart';

class onBoard extends StatefulWidget {
  const onBoard({Key? key}) : super(key: key);

  @override
  State<onBoard> createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          const carousel(),
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
            ),
            child: const Text("Full contactless experience",
                style: TextStyle(
                    fontFamily: 'Dmsans',
                    fontSize: 26,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: const Text(
              'From ordering to paying, that’s all \n contactless',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8E8EA9)),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => auth_page()));
            },
            child: const Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8E8EA9)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 26, right: 24, left: 24, bottom: 38),
            child: CustomButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => auth_page()));
              },
              text: 'Get Started',
            ),
          ),
        ],
      ),
    );
  }
}
