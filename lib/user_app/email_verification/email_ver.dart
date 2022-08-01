import 'package:flutter/material.dart';
import 'package:gigi_app/user_app/user_menu/user_menu.dart';
import 'package:gigi_app/user_app/verify%20_code/user_verification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/auth/authentication.dart';
import '../../shared/custom_button.dart';

class Email_ver extends StatefulWidget {
  const Email_ver({Key? key}) : super(key: key);

  @override
  State<Email_ver> createState() => _Email_verState();
}

class _Email_verState extends State<Email_ver> {
  final _formKey = GlobalKey<FormState>();
  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 116),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                const Padding(
                  padding: EdgeInsets.only(top: 14, bottom: 49),
                  child: Text(
                      'We need it to search after your account or create a new one',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8E8EA9))),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email required';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 26),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Password',
                      // suffix: Icon(Icons.visibility)
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passCtr,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please your password';
                      }
                      return null;
                    },
                  ),
                ),
                CustomButton(
                  text: 'Next',
                  onPressed: isSignedIn,
                  isLoading: isLoading,
                ),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0096FF)),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? msg;
  String? token;

  var isLoggedIn = false;

  void isSignedIn() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      login().whenComplete(() {
        if (isLoggedIn == true) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => User_bar(token: token!)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg!),
              backgroundColor: const Color.fromARGB(255, 219, 47, 47),
              action: SnackBarAction(
                label: msg!.contains('Your account is not verified')
                    ? 'Verify'
                    : '',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          User_Verification(email: emailCtr.text),
                    ),
                  );
                },
              ),
            ),
          );
          setState(() {
            isLoading = false;
            isLoggedIn = false;
          });
        }
      });
    }
  }

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await MerchantAuthServices().login(
      emailCtr.text,
      passCtr.text,
    );

    print(result);

    if (result['message'] == 'success') {
      prefs.setString('token', result['data']['token']);
      prefs.setString('email', result['data']['email']);
      prefs.setString('user_type', result['data']['type']);
      prefs.setString('status', result['data']['StatusName']);
      setState(() {
        isLoggedIn = true;
        token = result['data']['token'];
        msg = result['message'];
      });
    }
    setState(() {
      msg = result['error'];
    });
  }
}
