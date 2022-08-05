import 'package:flutter/material.dart';
import 'package:gigi_app/ham_burger/ham_burger.dart';
import 'package:gigi_app/services/deals/merchant_deal_services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../shared/custom_button.dart';

// ignore: camel_case_types
class Scanned_details extends StatefulWidget {
  const Scanned_details(
      {Key? key, required this.token, required this.scannedData})
      : super(key: key);
  final String token;
  final Barcode scannedData;

  @override
  State<Scanned_details> createState() => _Scanned_detailsState();
}

class _Scanned_detailsState extends State<Scanned_details> {
  // final String userName;
  List? details;

  @override
  void initState() {
    details = widget.scannedData.code!.split(' ');
    super.initState();
    print(details);
  }

  @override
  Widget build(BuildContext context) {
    // final result = scannedData.rawBytes as Map<String, dynamic>;

    debugPrint('result : ${widget.scannedData.code}');
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 137, right: 24, left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.scannedData.code!,
                style: const TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0D9BFF)),
              ),
              // Text(scannedData.code!),
              const Text(
                'G.Mamedof',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0D9BFF)),
              ),
              const Text(
                'Have 20% OFF on\nEntire Menu \n\nCoupon : GiGi12345',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              const Text(
                'Scan verified',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8E8EA9)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34.5),
                child: TextField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFEAEAEF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Enter Price of the Bill',
                )),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 38),
                child: CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    snackBar('Processing...');
                    redeemResult().whenComplete(() {
                      if (msg == 'success') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Ham_burger(
                                  token: widget.token,
                                )));
                      } else {
                        snackBar('Error: $msg');
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void snackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  String? msg;
  Future<void> redeemResult() async {
    final result = await DealServices()
        .redeemPurchase(widget.token, details![0], details![1]);

    setState(() {
      msg = result;
    });
  }
}
