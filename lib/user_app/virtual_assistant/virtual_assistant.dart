import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:gigi_app/shared/search_field.dart';
import 'package:gigi_app/shared/toggle_button.dart';
import 'package:gigi_app/user_app/categories/categories.dart';

import '../user_menu/user_menu.dart';

class Virtual_user extends StatelessWidget {
  const Virtual_user({Key? key}) : super(key: key);

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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text('Skip',
                                  style: TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 42),
                            child: Text("Tell us about your prefrences!",
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff32324D))),
                          ),
                          Text("Select all that applies: ",
                              style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff8E8EA9))),
                          SearchField(
                            searchText: 'Search',
                          ),
                          Toggle_Button(),
                          Spacer(),
                          CustomButton(
                              text: "Continue",
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => User_bar()));
                              }),
                          SizedBox(height: 25),
                        ])))));
  }
}
