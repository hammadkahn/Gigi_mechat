import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class user_review extends StatelessWidget {
  const user_review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/slt.png', width: 35, height: 35),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Awesome',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff414042))),
            Text('Steve',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff818181))),
          ],
        ),
        SizedBox(
          width: 40,
        ),
        Image.asset('assets/images/rate.png', width: 18, height: 18),
        Image.asset('assets/images/rate.png', width: 18, height: 18),
        Image.asset('assets/images/rate.png', width: 18, height: 18),
        Image.asset('assets/images/rate.png', width: 18, height: 18),
        Image.asset('assets/images/rate.png', width: 18, height: 18),
      ],
    );
  }
}
