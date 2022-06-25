import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/screens/full_menu/bar.dart';
import 'package:gigi_app/screens/full_menu/menu.dart';
import 'package:gigi_app/shared/custom_button.dart';

import '../../constant/size_constants.dart';

class auth_page extends StatefulWidget {
  const auth_page({Key? key}) : super(key: key);
  static String routeName = "/auth";

  @override
  State<auth_page> createState() => _auth_pageState();
}

class _auth_pageState extends State<auth_page> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 56),
              child: Image.asset('assets/images/auth_pic.png'),
            ),
            const Text(
              'Let’s Get Started 😁',
              style: TextStyle(
                  fontFamily: 'Dmsans',
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 49),
              child: Text(
                  'Sign up or login into to have a full  digital \nexperience in our restaurant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8E8EA9))),
            ),
            TextField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEAEAEF)),
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'Email',
            )),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 26),
              child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEAEAEF)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Password',
                    // suffix: Icon(Icons.visibility)
                  ),
                  obscureText: true),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 121),
              child: CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Bar()));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 54),
              child: Text(
                'Registered as a Merchant',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8981AE)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
