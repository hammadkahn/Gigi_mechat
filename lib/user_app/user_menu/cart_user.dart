import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gigi_app/models/cart_model.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:gigi_app/user_app/user_menu/cart_deals.dart';
import 'package:gigi_app/user_app/user_menu/order_status1.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
=======
>>>>>>> adcec233bd91225932230a07976921e794992cd8

class Cart_user extends StatefulWidget {
  const Cart_user({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<Cart_user> createState() => _Cart_userState();
}

class _Cart_userState extends State<Cart_user> {
  DealProvider? dealProvider;
  @override
  void didChangeDependencies() {
    if (mounted) {
      dealProvider = Provider.of<DealProvider>(context, listen: false);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    dealProvider!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: FutureBuilder<CartListModel>(
                    future: dealProvider!.getCartItemsList(widget.token),
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
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: ((context, index) {
                                double percentage = int.parse(snapshot
                                        .data!.data![index].discountOnPrice!) /
                                    100;
                                double price = percentage *
                                    int.parse(
                                        snapshot.data!.data![index].price!);
                                double priceAfterDiscount = int.parse(
                                        snapshot.data!.data![index].price!) -
                                    price;
                                return Slidable(
                                  endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) => {},
                                          backgroundColor: Colors.red,
                                          icon: Icons.delete,
                                        )
                                      ]),
                                  child: cart_deals(
                                    afterDiscount:
                                        priceAfterDiscount.toString(),
                                    token: widget.token,
                                    dealId: snapshot.data!.data![index].id
                                        .toString(),
                                    purchaseId: snapshot
                                        .data!.data![index].purchaseId
                                        .toString(),
                                  ),
                                );
                              }),
                            );
                          }
                      }
                    }),
                  ),
                ),
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
<<<<<<< HEAD
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Get this Offer',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => status_1(
                            token: widget.token,
                            qty: dealProvider!.qty.toString(),
                          )));
                },
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
=======
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 54,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Color(0xff0D9BFF),
                                size: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
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
                          text: 'Get this Offer ➔',
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => status_1()));
                          })
                    ]))));
>>>>>>> adcec233bd91225932230a07976921e794992cd8
  }
}
