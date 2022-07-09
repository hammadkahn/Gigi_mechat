import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gigi_app/screens/onboarding/onboard.dart';
import 'package:gigi_app/shared/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                'Login As:',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins-Bold',
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                  text: "Merchant Account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => onBoard(),
                      ),
                    );
                  }),
              SizedBox(height: 20),
              CustomButton(
                  text: "User Account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => onBoard(),
                      ),
                    );
                  }),
              Expanded(
                child: SizedBox(
                  height: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
