import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/verify%20_code/user_verification.dart';

import '../../shared/custom_button.dart';

class User_create_acc extends StatelessWidget {
  const User_create_acc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 116),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Getting started! ✌️',
              style: TextStyle(
                  fontFamily: 'Dmsans',
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 49),
              child: Text(
                  'Look like you are new to us! Create an account for a complete experience.',
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
              hintText: 'Fullname',
            )),
            TextField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEAEAEF)),
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'Phone Number',
            )),
            TextField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEAEAEF)),
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'Male',
            )),
            TextField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEAEAEF)),
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'DOB',
            )),
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
            CustomButton(
                text: 'Next',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => User_Verification()));
                }),
            Text(
              'Forgot Password?',
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0096FF)),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
