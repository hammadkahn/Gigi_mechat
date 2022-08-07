import 'package:flutter/material.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../apis/api_urls.dart';
import '../../constant/size_constants.dart';
import '../../models/reviews_model.dart';
import 'deals_details.dart';

class dealsUser extends StatefulWidget {
  const dealsUser({Key? key, required this.dealData, required this.token})
      : super(key: key);
  final String dealData;
  final String token;

  @override
  State<dealsUser> createState() => _dealsUserState();
}

class _dealsUserState extends State<dealsUser> {
  final key = GlobalKey<ScaffoldState>();
  DealProvider? dealProvider;
  bool isLoaded = false;

  @override
  void initState() {
    getRating();
    if (mounted) {}
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (mounted) {
      dealProvider = Provider.of<DealProvider>(context, listen: false);
      dealProvider!
          .singleDealDetails(widget.token, widget.dealData)
          .whenComplete(() {
        if (mounted) {
          setState(() {
            isLoaded = true;
          });
        }
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    if (!mounted) {
      return const SizedBox(
        child: Text('wait to load the page'),
      );
    }
    return isLoaded == false
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
                  debugPrint(widget.dealData);
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
                          data: dealProvider!.dealData,
                          token: widget.token,
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
                                dealProvider!.dealData.name!,
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
                                    rating == null || rating!.data!.isEmpty
                                        ? '0'
                                        : Reviews().getRating(rating!.data),
                                    // Reviews().getRating(
                                    //     dealProvider!.dealData.reviews),
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 7,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                  Text(
                                    '(${rating == null || rating!.data!.isEmpty ? '0' : rating!.data!.length.toString()} reviews)',
                                    // '(${dealProvider!.dealData.reviews!.length} reviews)',
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
                                  dealProvider!.dealData.price!,
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
                                  dealProvider!.calculateDiscount(
                                    dealProvider!.dealData.discountOnPrice!,
                                    dealProvider!.dealData.price!,
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
                                      '${dealProvider!.dealData.discountOnPrice}% OFF',
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
                      Expanded(
                        child: dealProvider!.dealData.image == null ||
                                dealProvider!.dealData.image!.image!.isEmpty
                            ? Image.asset('assets/images/food.png')
                            : Image.network(
                                '${ApiUrls.imgBaseUrl}${dealProvider!.dealData.image!.path}/${dealProvider!.dealData.image!.image}',
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  ReviewsModel? rating;
  Future<void> getRating() async {
    final result = await Provider.of<DealProvider>(context, listen: false)
        .getDealRating(widget.token, dealProvider!.dealData.id.toString());
    setState(() {
      rating = result;
    });
  }
}
