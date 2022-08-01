import 'package:flutter/material.dart';
import 'package:gigi_app/providers/order.dart';
import 'package:provider/provider.dart';

import '../../constant/size_constants.dart';

class cart_deals extends StatelessWidget {
  const cart_deals({
    Key? key,
    required this.token,
    required this.index,
    required this.cart,
  }) : super(key: key);
  final String token;
  final int index;
  final CartItems cart;

  static const String baseUrl = 'https://gigiapi.zanforthstaging.com/';

  @override
  Widget build(BuildContext context) {
    // final dealProvider = Provider.of<DealProvider>(context, listen: false);

    SizeConfig.init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: 120,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: // dealProvider!.dealData.images == null ||
                //     dealProvider!.dealData.images == null
                // ?
                Image.asset(
              'assets/images/cart_deal.png',
              height: 119,
              fit: BoxFit.cover,
            ),
            // : Image.network(
            //     '$baseUrl${dealProvider!.dealData.images![0].path}/${dealProvider!.dealData.images![0].image}',
            //     height: 119,
            //     width: 80,
            //   ),,
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        cart.title!,
                        style: const TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF32324D)),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Row(
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
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          Image.asset('assets/images/rating.png',
                              width: 6, height: 6),
                          Text(
                            cart.reviews!,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 7,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF5F5F5F)),
                          ),
                          Text(
                            '(${cart.reviewsCount} reviews)',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5F5F5F)),
                          ),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 2.83),
                      child: Row(
                        children: [
                          const Text(
                            '\$',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFF6767)),
                          ),
                          Text(
                            cart.price!,
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontFamily: 'Mulish',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFF6767)),
                          ),
                          const Text(
                            '\$',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0D9BFF)),
                          ),
                          Text(
                            cart.priceAfterDiscount!,
                            style: const TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF0D9BFF)),
                          ),
                          Container(
                            width: 28,
                            height: 11,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            child: Center(
                              child: Text(
                                '${cart.discountOnPrice}% OFF',
                                style: const TextStyle(
                                    fontSize: 5,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF0D9BFF)),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Consumer<Cart>(
              builder: ((__, value, _) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () => value.decreaseQty(),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEAFFFA)),
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xFF0D9BFF),
                              size: 16,
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          value.qty.toString(),
                          style: const TextStyle(
                              color: Color(0xff666687),
                              fontSize: 14,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            value.increaseQty();
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEAFFFA)),
                            child: const Icon(
                              Icons.add,
                              color: Color(0xFF0D9BFF),
                              size: 16,
                            ),
                          )),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
