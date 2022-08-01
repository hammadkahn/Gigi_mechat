import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/user_menu/my_qrs_cont.dart';

class My_Qrs extends StatelessWidget {
  const My_Qrs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: ListView(
          children: [
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
                      child: Image.asset('assets/images/arrow-left.png')),
                ),
                Spacer(),
                Text('My QR’s',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 14,
                        fontWeight: FontWeight.w600))
              ],
            ),
            qr_cont(),
            qr_cont(),
          ],
        ),
      ),
    );
  }
}
