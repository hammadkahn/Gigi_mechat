import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:gigi_app/shared/custom_button.dart';

=======
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/shared/custom_button.dart';

import '../create_acc/user_create_acc.dart';

>>>>>>> adcec233bd91225932230a07976921e794992cd8
class stats3 extends StatelessWidget {
  const stats3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height - 120,
            width: MediaQuery.of(context).size.width - 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              children: [
<<<<<<< HEAD
                const SizedBox(
                  height: 60,
                ),
                const Text(
=======
                SizedBox(
                  height: 60,
                ),
                Text(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                  'Your Offer',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF8E8EA9)),
                ),
<<<<<<< HEAD
                const Text('Avocado Chicken Salad',
=======
                Text('Avocado Chicken Salad',
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mulish',
                        color: Color(0xFF0D9BFF))),
<<<<<<< HEAD
                const Text(
=======
                Text(
>>>>>>> adcec233bd91225932230a07976921e794992cd8
                  'is Successfuly added in MyGiGI',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF8E8EA9)),
                ),
                Expanded(
                    child: Image.asset(
                  'assets/images/stat.png',
                  height: 369,
                  width: 327,
                )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
<<<<<<< HEAD
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
=======
          decoration: new BoxDecoration(
              color: Colors.green,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(26),
                topRight: const Radius.circular(26),
>>>>>>> adcec233bd91225932230a07976921e794992cd8
              )),
          child: Column(
            children: [
              CustomButton(
<<<<<<< HEAD
                onPressed: () {},
                text: 'Go to My Discounts',
=======
                text: 'Go to My Discounts',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => stats3()),
                  );
                },
>>>>>>> adcec233bd91225932230a07976921e794992cd8
              ),
            ],
          ),
        ),
      ),
    );
  }
}
