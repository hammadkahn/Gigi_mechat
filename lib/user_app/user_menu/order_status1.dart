import 'package:flutter/material.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:gigi_app/providers/order.dart';

import 'package:provider/provider.dart';

import '../../shared/custom_button.dart';
import 'order_detials.dart';
import 'status3.dart';

class status_1 extends StatefulWidget {
  const status_1({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<status_1> createState() => _status_1State();
}

class _status_1State extends State<status_1> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: key,
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 32, top: 17),
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
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: order_details(),
              ),
              const Spacer(),
              CustomButton(
                  text: "Get this Offer ➔",
                  isLoading: isLoading,
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    final cart =
                        Provider.of<Cart>(key.currentContext!, listen: false);
                    Map<int, CartItems> map = cart.cartItems.asMap();
                    String price =
                        (int.parse(map[0]!.price!) * cart.qty).toString();
                    String totalPrice = cart
                        .calculateRealPrice(
                            cart.qty, map[0]!.discountOnPrice!, map[0]!.price!)
                        .toString();
                    String discount = map[0]!.discountOnPrice!;
                    addToCart(
                      map[0]!.id!,
                      cart.qty.toString(),
                      price,
                      totalPrice,
                      discount,
                      context,
                    ).whenComplete(() {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const stats3(),
                        ),
                      );
                      cart.clearCart();
                    }).then((value) {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addToCart(String id, String qty, String price, String totalPrice,
      String discount, BuildContext context) async {
    final dealProvider = Provider.of<DealProvider>(context, listen: false);
    Map<String, dynamic> data = {
      "deals[0][id]": id,
      "deals[0][quantity]": qty,
      "deals[0][price]": price,
      "deals[0][total_price]": totalPrice,
      "deals[0][discount]": discount,
    };
    print(data);
    await dealProvider.addToCart(widget.token, data);
    if (dealProvider.msg == 'success') {
      debugPrint('added successfully');
    } else {
      debugPrint('error ${dealProvider.msg}');
    }
  }

  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}