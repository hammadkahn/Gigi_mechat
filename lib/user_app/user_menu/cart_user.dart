import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:gigi_app/user_app/user_menu/order_status1.dart';
import 'package:provider/provider.dart';

import '../../providers/order.dart';
import 'cart_deals.dart';

class Cart_user extends StatelessWidget {
  const Cart_user({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return SafeArea(
      child: Scaffold(
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
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Consumer<Cart>(
                      builder: ((context, value, child) {
                        return value.cartItems.isEmpty
                            ? const Center(
                                child: Text('Your cart is empty'),
                              )
                            : ListView.builder(
                                itemCount: value.cartItems.length,
                                itemBuilder: ((context, index) {
                                  debugPrint(
                                      'item count : ${value.cartItems.length}');

                                  return Slidable(
                                    endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) =>
                                                {value.removeItem(index)},
                                            backgroundColor: Colors.red,
                                            icon: Icons.delete,
                                          )
                                        ]),
                                    child: cart_deals(
                                        cart: value.cartItems[index],
                                        token: token,
                                        dealId: value.cartItems[index].id
                                            .toString()),
                                  );
                                }),
                              );
                      }),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 54,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Color(0xff0D9BFF),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Add More Offers',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff0D9BFF))),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Get this Offer',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => status_1(
                            token: token,
                          )));
                },
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
