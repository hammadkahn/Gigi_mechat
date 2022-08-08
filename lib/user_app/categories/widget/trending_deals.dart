import 'package:flutter/material.dart';

class TrendingDealsWidget extends StatelessWidget {
  const TrendingDealsWidget({Key? key, required this.dealName})
      : super(key: key);
  final String dealName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        top: 5,
        bottom: 5,
      ),
      child: Container(
        height: 121,
        width: 125,
        alignment: Alignment.bottomCenter,
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
        child: Column(
          children: [
            Image.asset(
              'assets/images/voucher.png',
              height: 100,
              width: 100,
            ),
            Text(dealName),
          ],
        ),
      ),
    );
  }
}
