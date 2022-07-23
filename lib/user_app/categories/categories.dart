import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/screens/full_menu/location_bar.dart';
import 'package:gigi_app/shared/loaction_user.dart';

class Categories_user extends StatelessWidget {
  const Categories_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Location_bar_user(),
            ),
            SizedBox(
              height: 23,
            ),
            const Text('Popular deals in your area',
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF32324D),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: new Container(
                height: 131,
                child:
                    new ListView(scrollDirection: Axis.horizontal, children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Container(
                      height: 121,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Container(
                      height: 121,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Container(
                      height: 121,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFD9D9D9)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFD9D9D9)),
                  ),
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFD9D9D9)),
                ),
              ],
            ),
            SizedBox(
              height: 42,
            ),
            Text('All Categories',
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF505050),
                )),
            SizedBox(
              height: 24,
            ),
            Text('Electronics',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
            SizedBox(
              height: 18,
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(
              height: 18,
            ),
            Text('Automotive',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
            SizedBox(
              height: 18,
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(
              height: 18,
            ),
            Text('Cleaning',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
            SizedBox(
              height: 18,
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(
              height: 18,
            ),
            Text('For Mens',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
            SizedBox(
              height: 18,
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(
              height: 18,
            ),
            Text('For Kids',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
            SizedBox(
              height: 18,
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(
              height: 18,
            ),
            Text('For Womens',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
            SizedBox(
              height: 18,
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(
              height: 18,
            ),
            Text('Accessories',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
            SizedBox(
              height: 18,
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(
              height: 18,
            ),
            Text('Food',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
          ],
        ),
      ),
    );
  }
}
