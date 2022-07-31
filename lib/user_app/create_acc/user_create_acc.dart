import 'package:flutter/material.dart';
import 'package:gigi_app/services/auth/authentication.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:intl/intl.dart';
import '../verify _code/user_verification.dart';

class User_create_acc extends StatefulWidget {
  const User_create_acc({Key? key}) : super(key: key);

  @override
  State<User_create_acc> createState() => _User_create_accState();
}

class _User_create_accState extends State<User_create_acc> {
  final _key = GlobalKey<FormState>();
  final nameCtr = TextEditingController();
  final countryCtr = TextEditingController();
  final cityCtr = TextEditingController();
  final passCtr = TextEditingController();
  final dobCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final phoneNumberCtr = TextEditingController();
  final genderCtr = TextEditingController();

  var isLoading = false;

  @override
  void initState() {
    debugPrint(_key.currentState.toString());
    super.initState();
  }

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
              TextField(
                controller: dobCtr,
                decoration: InputDecoration(
                    icon: const Icon(Icons.calendar_today_rounded),
                    labelText: 'Date of Birth',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                      borderRadius: BorderRadius.circular(16),
                    )),
                onTap: () async {
                  DateTime? pickdate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2030));
                  if (pickdate != null) {
                    setState(() {
                      dobCtr.text = DateFormat('dd-MM-yyyy').format(pickdate);
                    });
                  }
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
              TextFormField(
                controller: countryCtr,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'country',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'country field is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cityCtr,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'City',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'city field required';
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
                      return 'Please a strong password';
                    }
                    return null;
                  },
                ),
              ),
              CustomButton(
                isLoading: isLoading,
                text: 'Next',
                onPressed: _handleRegister,
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

  // dynamic msg;

  // void onSubmit() async {
  //   try {
  //     if (_key.currentState!.validate()) {
  //       setState(() {
  //         isLoading = true;
  //       });
  //       signUp().whenComplete(() {
  //         if (msg == 'success') {
  //           Navigator.of(context).push(MaterialPageRoute(
  //               builder: (_) => User_Verification(email: emailCtr.text)));
  //         } else {
  //           showSnackBar(msg!);
  //           setState(() {
  //             isLoading = false;
  //           });
  //         }
  //       }).catchError((e) {
  //         showSnackBar(e);
  //         setState(() {
  //           isLoading = false;
  //         });
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     AlertDialog(
  //       title: const Text('Alert'),
  //       content: Text(e.toString()),
  //     );
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  // void showSnackBar(String message) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  // Future<void> signUp() async {
  //   Map<String, dynamic> data = {
  //     'name': nameCtr.text,
  //     'email': emailCtr.text,
  //     'phone_no': phoneNumberCtr.text,
  //     'date_of_birth': dobCtr.text,
  //     'password': passCtr.text,
  //     'password_confirmation': passCtr.text,
  //     'gender': genderCtr.text,
  //     'address': cityCtr.text + countryCtr.text,
  //     'country': countryCtr.text,
  //     'city': cityCtr.text
  //   };

  //   final result = await MerchantAuthServices().userSignUp(data: data);
  //   if (result['message'] == 'success') {
  //     setState(() {
  //       msg = result['message'];
  //     });
  //   } else {
  //     msg = result['message'];
  //   }
  // }
  Future<void> _handleRegister() async {
    if (_key.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      //show snackbar to indicate loading
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      //the user data to be sent
      Map<String, dynamic> userData = {
        'name': nameCtr.text,
        'email': emailCtr.text,
        'phone_no': phoneNumberCtr.text,
        'date_of_birth': dobCtr.text,
        'password': passCtr.text,
        'password_confirmation': passCtr.text,
        'gender': genderCtr.text,
        'address': cityCtr.text + countryCtr.text,
        'country': countryCtr.text,
        'city': cityCtr.text
      };

      //get response from ApiClient
      dynamic res = await MerchantAuthServices().userSignUp(data: userData);
      showSignUpResult(res);
    }
  }

  void showSignUpResult(Map<String, dynamic> res) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    //checks if there is no error in the response body.
    //if error is not present, navigate the users to Login Screen.

    if (res['message'] == 'success') {
      setState(() {
        isLoading = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => User_Verification(email: emailCtr.text)));
    } else {
      setState(() {
        isLoading = false;
      });
      //if error is present, display a snackbar showing the error messsage
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Message: ${res['message']}'),
        backgroundColor: Colors.red.shade300,
        action: SnackBarAction(
          label: res['error'] == 'The email has already been taken'
              ? 'Next'
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
    }
  }
}
