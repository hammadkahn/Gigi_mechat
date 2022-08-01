import 'package:flutter/material.dart';
import 'package:gigi_app/user_app/notification_screen.dart';

import '../user_app/user_menu/ham_user.dart';

class Location_bar_user extends StatelessWidget {
  const Location_bar_user({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/Vector.png'),
        const Padding(
          padding: EdgeInsets.only(left: 10.94),
          child: Text('Baku, Azerbaijan',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D9BFF),
              )),
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ham_user(
                        token: token,
                      )));
            },
            child: Image.asset('assets/images/drawer.png')),
        const SizedBox(width: 13),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => NotificationScreen(token: token))));
          },
          child: Image.asset(
            'assets/images/notification.png',
            height: 24,
            width: 24,
          ),
        )
      ],
    );
  }
}
