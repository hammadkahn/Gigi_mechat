import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Stacked_container2 extends StatelessWidget {
  const Stacked_container2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              percent: 0.3,
              progressColor: Colors.red,
              barRadius: const Radius.circular(8),
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
                const Icon(Icons.home),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Total Active orders'),
                    Text(' 4'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
