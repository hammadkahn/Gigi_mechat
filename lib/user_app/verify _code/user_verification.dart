import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:gigi_app/user_app/set_loc/set_loc.dart';
import 'package:gigi_app/user_app/verify%20_code/verify_box.dart';

class User_Verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xffFCFCFC),
              Color(0xffF7F7F7),
              Color(0xffF7F7F7),
              Color(0xffF7F7F7),
              Color(0xffFCFCFC)
            ])),
        child: SafeArea(
            child: Scaffold(
                body: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 32, top: 17),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                        'assets/images/arrow-left.png')),
                              ),
                              Spacer(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 42),
                            child: Text("Verify Code ⚡️",
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff32324D))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                                "We just sent a 4-digit verification code to ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffADADB6))),
                          ),
                          Text("robert.fox@gmail.com.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Mulish-Bold',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4A4A6A))),
                          Text("Enter the code in the box below to continue.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffADADB6))),
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Verify_box(),
                                Verify_box(),
                                Verify_box(),
                                Verify_box(),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Didn’t receive a code?",
                                  style: TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff8E8EA9))),
                              Text("Resend Code",
                                  style: TextStyle(
                                      fontFamily: 'Mulish-Bold',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff0096FF))),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: CustomButton(
                                text: "Next",
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Set_user_location()));
                                }),
                          ),
                        ])))));
  }
}
