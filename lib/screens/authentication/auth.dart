import 'package:flutter/material.dart';
import 'package:gigi_app/services/auth/merchant_auth.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/size_constants.dart';
import '../full_menu/bar.dart';

class auth_page extends StatefulWidget {
  const auth_page({Key? key}) : super(key: key);
  static String routeName = "/auth";

  @override
  State<auth_page> createState() => _auth_pageState();
}

class _auth_pageState extends State<auth_page> {
  final _formKey = GlobalKey<FormState>();
  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();

  var isLoading = false;
  var isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
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
              const Padding(
                padding: EdgeInsets.only(top: 14, bottom: 49),
                child: Text(
                    'Sign up or login into to have a full  digital \nexperience in our restaurant',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8E8EA9))),
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
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 26),
                child: TextFormField(
                  controller: passwordCtr,
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
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 121),
                child: CustomButton(
                    isLoading: isLoading,
                    text: 'Sign In',
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      if (_formKey.currentState!.validate()) {
                        login().whenComplete(() {
                          if (isLoggedIn == true) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) => Bar(
                                          token: token!,
                                        )));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(msg!),
                                backgroundColor:
                                    const Color.fromARGB(255, 219, 47, 47),
                              ),
                            );
                            setState(() {
                              isLoading = false;
                            });
                          }
                        });
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }),
              ),
              const Text(
                'Registered as a Merchant',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8981AE)),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? msg;
  String? token;

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await MerchantAuthServices().merchantLogin(
      emailCtr.text,
      passwordCtr.text,
    );

    print(result);

    if (result['message'] == 'success') {
      prefs.setString('token', result['data']['token']);
      prefs.setString('email', result['data']['email']);
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
