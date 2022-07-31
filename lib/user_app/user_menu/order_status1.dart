import 'package:flutter/material.dart';
import 'package:gigi_app/models/cart_model.dart';
import 'package:gigi_app/providers/deal_provider.dart';

import 'package:gigi_app/user_app/user_menu/status3.dart';
import 'package:provider/provider.dart';

import '../../shared/custom_button.dart';
import 'order_detials.dart';

class status_1 extends StatelessWidget {
  const status_1({Key? key, required this.token, required this.qty})
      : super(key: key);
  final String token;
  final String qty;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 32, top: 17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/arrow-left.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Cafe Bistrovia',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF8E8EA9)),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Your cart',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF32324D)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: FutureBuilder<CartListModel>(
                    future: Provider.of<DealProvider>(context, listen: false)
                        .getCartItemsList(token),
                    builder: ((context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return order_details(
                              qty: qty,
                              data: snapshot.data!.data!,
                            );
                          }
                      }
                    }),
                  ),
                ),
                const Spacer(),
                CustomButton(
                    text: "Get this Offer ➔",
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const stats3()));
                    }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
