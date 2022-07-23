import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Location_bar_user extends StatelessWidget {
  const Location_bar_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/Vector.png'),
        Padding(
          padding: const EdgeInsets.only(left: 10.94),
          child: Text('Baku, Azerbaijan',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D9BFF),
              )),
        ),
        Spacer(),
        Image.asset('assets/images/drawer.png'),
        SizedBox(width: 13),
        Image.asset(
          'assets/images/notification.png',
          height: 24,
          width: 24,
        )
      ],
    );
  }
}
