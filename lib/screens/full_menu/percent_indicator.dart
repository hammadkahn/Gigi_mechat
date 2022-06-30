import 'package:flutter/material.dart';
import 'package:gigi_app/screens/full_menu/percent_ind2.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                  ),
                ),
                LinearPercentIndicator(
                  animation: true,
                  animationDuration: 2000,
                  width: MediaQuery.of(context).size.width - 48,
                  lineHeight: 8.0,
                  percent: 0.5,
                  progressColor: Colors.blue,
                  barRadius: Radius.circular(8),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6, left: 6),
              child: Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width - 48,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Total Sale: '),
                        Text(' \$ 56789'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
