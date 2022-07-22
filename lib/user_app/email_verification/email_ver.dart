import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/create_acc/user_create_acc.dart';

import '../../shared/custom_button.dart';

class Email_ver extends StatelessWidget {
  const Email_ver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 116),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'What’s your email? 📨',
              style: TextStyle(
                  fontFamily: 'Dmsans',
                  fontSize: 36,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 49),
              child: Text(
                  'We need it to search after your account or create a new one',
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
            CustomButton(
                text: 'Next',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => User_create_acc()));
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
