import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/user_menu/user_review.dart';

class StoreProfile extends StatelessWidget {
  const StoreProfile({Key? key}) : super(key: key);

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
            backgroundColor: Colors.white,
            body: Center(
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 51, right: 29, left: 29),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/slt.png'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 10),
                              child: Text('Coco Berry',
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000))),
                            ),
                            Text(
                                textAlign: TextAlign.center,
                                '10th Road, Baku, Azerbaijan',
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff172995))),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                textAlign: TextAlign.center,
                                '+912 345 678 910 - Info@domain.com',
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000))),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    '4.8',
                                    style: TextStyle(
                                        fontSize: 30, color: Color(0xff172995)),
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset('assets/images/rate.png',
                                              width: 18, height: 18),
                                          Image.asset('assets/images/rate.png',
                                              width: 18, height: 18),
                                          Image.asset('assets/images/rate.png',
                                              width: 18, height: 18),
                                          Image.asset('assets/images/rate.png',
                                              width: 18, height: 18),
                                          Image.asset('assets/images/rate.png',
                                              width: 18, height: 18),
                                        ],
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Reviews and Rating',
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff000000)),
                                      ),
                                    ],
                                  )
                                ]),
                            SizedBox(height: 10),
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff172995)),
                              child: Center(
                                child: Text('View',
                                    style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFCFCFC))),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('48',
                                      style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff172995))),
                                  Image.asset('assets/images/divide.png',
                                      width: 30, height: 30),
                                  Text('400+',
                                      style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff172995))),
                                  Image.asset('assets/images/divide.png',
                                      width: 30, height: 30),
                                  Text('2',
                                      style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff172995))),
                                ]),
                            SizedBox(height: 20),
                            Text('Reviews',
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000))),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/rate.png',
                                    width: 18, height: 18),
                                Image.asset('assets/images/rate.png',
                                    width: 18, height: 18),
                                Image.asset('assets/images/rate.png',
                                    width: 18, height: 18),
                                Image.asset('assets/images/rate.png',
                                    width: 18, height: 18),
                                Image.asset('assets/images/rate.png',
                                    width: 18, height: 18),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('28 Reviews',
                                    style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff898989)))
                              ],
                            ),
                            SizedBox(height: 20),
                            user_review(),
                            SizedBox(height: 10),
                            user_review(),
                            SizedBox(height: 10),
                            user_review(),
                            SizedBox(height: 10),
                            user_review(),
                          ]),
                    )))),
      ),
    );
  }
}
