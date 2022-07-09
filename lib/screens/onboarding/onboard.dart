import 'package:flutter/material.dart';
import 'package:gigi_app/screens/authentication/auth.dart';
import 'package:gigi_app/screens/full_menu/bar.dart';
import 'package:gigi_app/screens/onboarding/onboard_carousel.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constant/size_constants.dart';

class onBoard extends StatefulWidget {
  const onBoard({Key? key}) : super(key: key);

  @override
  State<onBoard> createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  String? token;
  String? email;
  var isChecked = false;
  Future<void> checkLogIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    token = prefs.getString('token');
    email = prefs.getString('email');

    print('token $token');
    print(email);
    setState(() {
      isChecked = true;
    });
  }

  @override
  void initState() {
    checkLogIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: isChecked == true
          ? email != null && token != null
              ? Bar(token: token!)
              : ListView(
                  children: [
                    const carousel(),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Full contactless experience",
                          style: TextStyle(
                              fontFamily: 'Dmsans',
                              fontSize: 26,
                              fontWeight: FontWeight.w500)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'From ordering to paying, that’s all \n contactless',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8E8EA9)),
                      ),
                    ),
                    // const Spacer(),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const auth_page()));
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
                    const SizedBox(height: 15),
                    CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const auth_page()));
                      },
                      text: 'Get Started',
                    ),
                  ],
                )
          : Center(child: SmoothIndicator(offset: 0.1, count: 5)),
    );
  }
}
