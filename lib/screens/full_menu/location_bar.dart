import 'package:flutter/material.dart';
import 'package:gigi_app/screens/full_menu/profile.dart';

class location_bar extends StatelessWidget {
  const location_bar({Key? key, required this.token, this.city})
      : super(key: key);
  final String token;
  final String? city;

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
        InkWell(
          child: Image.asset('assets/images/drawer.png'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Profile(
                      token: token,
                      isLeadingIcon: true,
                    )));
          },
        )
      ],
    );
  }
}
