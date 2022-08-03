import 'package:flutter/material.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:provider/provider.dart';

import '../../constant/size_constants.dart';
import '../../models/wish_list_model.dart';
import '../../providers/order.dart';
import '../../shared/custom_button.dart';
import 'cart_user.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key, required this.wishData, required this.token})
      : super(key: key);
  final WishData wishData;
  final String token;
  static const url = 'https://gigiapi.zanforthstaging.com/';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
          wishData.image == null
              ? Image.asset(
                  'assets/images/cart_deal.png',
                  height: 119,
                )
              : Expanded(
                  child: Image.network(
                      '$url${wishData.image!.path}/${wishData.image!.image}'),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      wishData.name!,
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
                        const Text(
                          '4.8',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5F5F5F)),
                        ),
                        const Text(
                          '(30 reviews)',
                          style: TextStyle(
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
                          wishData.price!,
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
                          Provider.of<DealProvider>(context).calculateDiscount(
                            wishData.discountOnPrice!,
                            wishData.price!,
                          ),
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
                              '${wishData.discountOnPrice}% OFF',
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
                const SizedBox(height: 10),
                CustomButton(
                    padding: true,
                    text: 'Add to Cart ➔',
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false).addTCart(
                        id: wishData.id.toString(),
                        price: wishData.price,
                        title: wishData.name,
                        image: wishData.image!.image ?? '',
                        reviews: '0',
                        discountOnPrice: wishData.discountOnPrice,
                        path: wishData.image!.path ?? '',
                      );
                      Provider.of<DealProvider>(context, listen: false)
                          .removeFromWishList(wishData.wishlistId!, token);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Cart_user(token: token)));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
