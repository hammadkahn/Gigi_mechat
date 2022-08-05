import 'package:flutter/material.dart';
import 'package:gigi_app/models/cart_model.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class scan_qr extends StatelessWidget {
  const scan_qr({Key? key, required this.qrCode}) : super(key: key);
  final CartData qrCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(right: 24, left: 24, top: 55, bottom: 100),
          child: Column(
            children: [
              const Text(
                'Show this QR on outlet \n to avail this offer',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DMSans',
                    color: Color(0xFF32324D)),
              ),
              const SizedBox(height: 55),
              QrImage(
                data: '${qrCode.purchaseId}',
                version: QrVersions.auto,
                size: 320,
                gapless: false,
              ),
              const SizedBox(height: 29),
              const Text('Your Offer ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF8E8EA9))),
              Text(qrCode.name!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF0D9BFF))),
              Text('${qrCode.discountOnPrice}% Discount',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF8E8EA9))),
              const SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Get Date: ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                          color: Color(0xFF343434))),
                  Text(
                      DateFormat('dd-MM-yyyy')
                          .format(DateTime.parse(qrCode.createdAt!)),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                          color: Color(0xFF8E8EA9))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Expiry Date: ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                          color: Color(0xFF343434))),
                  Text(qrCode.expiry!,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                          color: Color(0xFF8E8EA9))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
