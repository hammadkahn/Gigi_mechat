import 'package:flutter/material.dart';
import 'package:gigi_app/services/auth/authentication.dart';
import 'package:gigi_app/shared/custom_button.dart';

import '../verify _code/user_verification.dart';

class User_create_acc extends StatefulWidget {
  const User_create_acc({Key? key}) : super(key: key);

  @override
  State<User_create_acc> createState() => _User_create_accState();
}

class _User_create_accState extends State<User_create_acc> {
  final _key = GlobalKey<FormState>();
  final nameCtr = TextEditingController();
  final passCtr = TextEditingController();
  final dobCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final phoneNumberCtr = TextEditingController();
  final genderCtr = TextEditingController();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _key,
        child: Padding(
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
              const Padding(
                padding: EdgeInsets.only(top: 14, bottom: 49),
                child: Text(
                    'Look like you are new to us! Create an account for a complete experience.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8E8EA9))),
              ),
              TextFormField(
                controller: nameCtr,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Fullname',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneNumberCtr,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Phone Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: genderCtr,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'gender',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please speicify your gender';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: dobCtr,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'DOB',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your Date of birth';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailCtr,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'email is required';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 26),
                child: TextFormField(
                  controller: passCtr,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Password',
                    // suffix: Icon(Icons.visibility)
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              CustomButton(
                isLoading: isLoading,
                text: 'Next',
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (_) =>
                  //         const User_Verification(email: 'user1@gmail.com')));
                  if (_key.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    signUp().whenComplete(() {
                      if (msg == 'success') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                User_Verification(email: emailCtr.text)));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(msg!)));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });
                  }
                },
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
    );
  }

  String? msg;

  Future<void> signUp() async {
    Map<String, dynamic> data = {
      'name': nameCtr.text,
      'email': emailCtr.text,
      'phone_no': phoneNumberCtr.text,
      'date_of_birht': dobCtr.text,
      'password': passCtr.text,
      'password_confirmation': passCtr.text,
      'gender': genderCtr.text,
    };

    final result = await MerchantAuthServices().userSignUp(data: data);
    if (result['msg'] == 'success') {
      setState(() {
        msg = result['msg'];
      });
    } else {
      msg = result['error'];
    }
  }
}
