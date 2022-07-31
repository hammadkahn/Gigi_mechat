import 'package:flutter/material.dart';

import 'package:gigi_app/shared/custom_button.dart';

import '../../constant/size_constants.dart';
import '../../services/auth/authentication.dart';
import '../../user_app/verify _code/user_verification.dart';
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
                    onPressed: loginUsers),
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

  Future<void> loginUsers() async {
    if (_formKey.currentState!.validate()) {
      //show snackbar to indicate loading
      setState(() {
        isLoading = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      //get response from ApiClient
      dynamic res =
          await MerchantAuthServices().login(emailCtr.text, passwordCtr.text);
      checkLoginResult(res);
    }
  }

  void checkLoginResult(dynamic res) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    //if there is no error, get the user's accesstoken and pass it to HomeScreen
    if (res['message'] == 'success') {
      String accessToken = res['data']['token'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bar(token: accessToken),
        ),
      );
    } else {
      //if an error occurs, show snackbar with error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Message: ${res['error']}'),
        backgroundColor: Colors.red.shade300,
        action: SnackBarAction(
          label: res['error'] ==
                  'Your account is not verified. Please verify your account'
              ? 'Verify'
              : 'Close',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        User_Verification(email: emailCtr.text)));
          },
        ),
      ));
      setState(() {
        isLoading = false;
      });
    }
  }

  // Future<void> login() async {
  //   final result = await MerchantAuthServices().login(
  //     emailCtr.text,
  //     passwordCtr.text,
  //   );

  //   print(result);

  //   if (result['message'] == 'success') {
  //     setState(() {
  //       isLoggedIn = true;
  //       token = result['data']['token'];
  //       msg = result['message'];
  //     });
  //   }
  //   setState(() {
  //     msg = result['error'];
  //   });
  // }
}
