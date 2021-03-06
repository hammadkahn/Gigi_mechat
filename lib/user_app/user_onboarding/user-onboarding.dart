import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/user_auth/user_auth.dart';

import '../../screens/authentication/auth.dart';
import '../../screens/onboarding/onboard_carousel.dart';
import '../../shared/custom_button.dart';

class User_onboard extends StatelessWidget {
  const User_onboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('assets/images/user-onboard.png'),
          const Text("Find 1000+ Offers at\n One Place",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Dmsans',
                  fontSize: 26,
                  fontWeight: FontWeight.w500)),
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
          Padding(
            padding:
                const EdgeInsets.only(top: 26, right: 24, left: 24, bottom: 4),
            child: CustomButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => user_auth()));
              },
              text: 'Get Started',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => user_auth()));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 38),
              child: const Text(
                'Are You a Buisness?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0C9BFE)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
