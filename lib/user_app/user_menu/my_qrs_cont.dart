import 'package:flutter/material.dart';
import 'package:gigi_app/models/cart_model.dart';
import 'package:gigi_app/user_app/user_menu/review.dart';
import 'package:gigi_app/user_app/user_menu/scan_qr.dart';
import 'package:intl/intl.dart';

class qr_cont extends StatefulWidget {
  const qr_cont({Key? key, required this.cartData, required this.token})
      : super(key: key);
  final CartData cartData;
  final String token;

  @override
  State<qr_cont> createState() => _qr_contState();
}

class _qr_contState extends State<qr_cont> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 94 / 327,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFE8E8E8),
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => scan_qr(
                qrCode: widget.cartData,
                token: widget.token,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 6, left: 26, right: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Qr Code: ',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 6,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000)),
                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: ' 12345678',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 6,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0D9BFF))),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.cartData.name!,
                    style: const TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF32324D))),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/menu_location.png',
                      width: 8,
                      height: 8,
                    ),
                    const Text(
                      'Cafe Bistrovia - Baku, Azerbaijan',
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF848484)),
                    ),
                    const Spacer(),
                    Text(
                      widget.cartData.availabilityStatus ?? 'Redeemed',
                      style: const TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF0D0D)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(children: [
                  const Text('Date Purchased: ',
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 7,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8E8EA9))),
                  Text(
                      DateFormat('dd-MM-yyyy')
                          .format(DateTime.parse(widget.cartData.createdAt!)),
                      style: const TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 7,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0D9BFF))),
                  const SizedBox(width: 10),
                  const Text('Date Expiry: ',
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 7,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8E8EA9))),
                  Text(widget.cartData.expiry!,
                      style: const TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 7,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0D9BFF))),
                  const Spacer(),
                  Container(
                    width: 55,
                    height: 11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFF0D9BFF),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => review(
                                    dealId:
                                        widget.cartData.purchaseId.toString(),
                                    token: widget.token,
                                  )),
                        ),
                        child: const Text('★ Write a Review',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 5,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFFFFFFF))),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
