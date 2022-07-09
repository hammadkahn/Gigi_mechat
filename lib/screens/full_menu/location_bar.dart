import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class location_bar extends StatelessWidget {
  const location_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/Vector.png'),
        const Padding(
          padding: EdgeInsets.only(left: 10.94),
          child: Text('Branch 1',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D9BFF),
              )),
        ),
        const Spacer(),
        Image.asset('assets/images/drawer.png')
      ],
    );
  }
}
