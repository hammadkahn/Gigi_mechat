import 'package:flutter/material.dart';
import 'package:gigi_app/models/cart_model.dart';
import 'package:gigi_app/models/merchant_model.dart';
import 'package:gigi_app/services/user_merchant_services.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class scan_qr extends StatefulWidget {
  const scan_qr({Key? key, required this.qrCode, required this.token})
      : super(key: key);
  final CartData qrCode;
  final String token;
  @override
  State<scan_qr> createState() => _scan_qrState();
}

class _scan_qrState extends State<scan_qr> {
  SingleMerchant? merchant;

  Future<void> getMerchantDetails() async {
    final result = await UserMerchantServices().singleMerchantProfile(
      id: widget.qrCode.merchantId.toString(),
      token: widget.token,
    );
    setState(() {
      merchant = result;
    });
  }

  int? branchId;
  int? selectedIndex;
  showAlertDialog() {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: merchant!.data!.branches!.length,
          itemBuilder: ((context, index) {
            return ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  branchId = merchant!.data!.branches![selectedIndex!].id;
                  isLoaded = true;
                });
              },
              title: Text(merchant!.data!.branches![index].name!),
              trailing: Icon(
                selectedIndex == index ? Icons.circle : Icons.circle_outlined,
                color: Colors.red,
              ),
            );
          })),
    );
  }

  bool? isLoaded = false;
  @override
  void initState() {
    getMerchantDetails().whenComplete(() {});
    super.initState();
  }

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
              merchant == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : isLoaded == false
                      ? showAlertDialog()
                      : QrImage(
                          data:
                              '${widget.qrCode.purchaseId}:$branchId:${widget.qrCode.purchaseQuantity}:x:${widget.qrCode.discountOnPrice}:${widget.qrCode.price}:${widget.qrCode.type}:Availability: ${widget.qrCode.availabilityStatus}',
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
              Text(widget.qrCode.name!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                      color: Color(0xFF0D9BFF))),
              Text('${widget.qrCode.discountOnPrice}% Discount',
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
                          .format(DateTime.parse(widget.qrCode.createdAt!)),
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
                  Text(widget.qrCode.expiry!,
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
