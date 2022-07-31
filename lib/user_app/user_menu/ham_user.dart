import 'package:flutter/material.dart';
import 'package:gigi_app/user_app/user_auth/user_auth.dart';

import '../../screens/authentication/auth.dart';
import '../../support/support.dart';

class ham_user extends StatelessWidget {
  const ham_user({Key? key}) : super(key: key);

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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 51, right: 29, left: 29),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/slt.png',
                      height: 100,
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13, bottom: 10),
                      child: Text('G.Mamedoff ',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff32324D))),
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        'California, US\n+12345678901234  |   g,mamed@mail.com',
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffC5C5C5))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 22, bottom: 25),
                            child: Divider(
                              color: Color(0xFFE6E6E6),
                              thickness: 0.5,
                              // height: 214,
                              indent: 82,
                              endIndent: 79,
                            )),
                        Text("My Offers",
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff32324D))),
                        Padding(
                          padding: const EdgeInsets.only(top: 18, bottom: 18),
                          child: Divider(
                            color: Color(0xFFE6E6E6),
                            thickness: 0.5,
                            // height: 214,
                            indent: 26,
                            endIndent: 26,
                          ),
                        ),
                        Text("My Prefrences",
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff32324D))),
                        Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 18),
                            child: Divider(
                              color: Color(0xFFE6E6E6),
                              thickness: 0.5,
                              // height: 214,
                              indent: 26,
                              endIndent: 26,
                            )),
                        Text("My Account",
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff32324D))),
                        Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 18),
                            child: Divider(
                              color: Color(0xFFE6E6E6),
                              thickness: 0.5,
                              // height: 214,
                              indent: 26,
                              endIndent: 26,
                            )),
                        Text("My Insights",
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff32324D))),
                        Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 18),
                            child: Divider(
                              color: Color(0xFFE6E6E6),
                              thickness: 0.5,
                              // height: 214,
                              indent: 26,
                              endIndent: 26,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Support()));
                          },
                          child: Text("Support",
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff32324D))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100, bottom: 56),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => user_auth()));
                            },
                            child: Text('Log out',
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff9E9E9E))),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
