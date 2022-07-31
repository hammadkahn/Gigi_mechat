import 'package:flutter/material.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../constant/size_constants.dart';
import '../../models/reviews_model.dart';
import 'deals_details.dart';

class dealsUser extends StatelessWidget {
  const dealsUser({Key? key, required this.dealData, required this.token})
      : super(key: key);
  final String dealData;
  final String token;

  static const url = 'https://gigiapi.zanforthstaging.com/';

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    final dealProvider = Provider.of<DealProvider>(context, listen: false);

    SizeConfig.init(context);
    dealProvider.singleDealDetails(token, dealData);

    return dealProvider.dealData.id == null
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: SizeConfig.screenWidth,
              height: 145,
              decoration: const BoxDecoration(
                  color: Color(0xFF030381),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: InkWell(
                onTap: () {
                  debugPrint(dealData);
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(26))),
                    isScrollControlled: true,
                    context: context,
                    builder: (ct) => Scaffold(
                      key: key,
                      extendBody: false,
                      body: SingleChildScrollView(
                        controller: ModalScrollController.of(ct),
                        child: Details_deals(
                          data: dealProvider.dealData,
                          token: token,
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Offer of the Week',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFA5A5BA)),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                dealProvider.dealData.name!,
                                style: const TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF)),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 4),
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
                                        color: Color(0xFFFFFFFF)),
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
                                    Reviews().getRating(
                                        dealProvider.dealData.reviews),
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 7,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                  Text(
                                    '(${dealProvider.dealData.reviews!.length} reviews)',
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 4,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF)),
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
                                      color: Color(0xFF0D9BFF)),
                                ),
                                Text(
                                  dealProvider.dealData.price!,
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: 'Mulish',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF0D9BFF)),
                                ),
                                const Text(
                                  '\$',
                                  style: TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFFFFFFF)),
                                ),
                                Text(
                                  dealProvider.calculateDiscount(
                                    dealProvider.dealData.discountOnPrice!,
                                    dealProvider.dealData.price!,
                                  ),
                                  style: const TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFFFFFFF)),
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
                                      '${dealProvider.dealData.discountOnPrice}% OFF',
                                      style: const TextStyle(
                                          fontSize: 5,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF0D9BFF)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        child: dealProvider.dealData.images == null ||
                                dealProvider.dealData.images!.isEmpty
                            ? Image.asset('assets/images/food.png')
                            : Image.network(
                                '$url${dealProvider.dealData.images![0].path}/${dealProvider.dealData.images![0].image}',
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
