import 'package:flutter/material.dart';
import 'package:gigi_app/models/dash_board_model.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/screens/full_menu/location_bar.dart';
import 'package:gigi_app/services/dashboard_stats/dash_board.dart';
import 'package:gigi_app/services/deals/merchant_deal_services.dart';

import '../../constant/size_constants.dart';
import 'deals.dart';
import 'percent_ind2.dart';
import 'percent_ind3.dart';
import 'percent_indicator.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    getDashData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 27, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const location_bar(),
                const SizedBox(height: 10),
                dashBoardModel == null
                    ? const CircularProgressIndicator()
                    : Dashboard(
                        totalSale:
                            dashBoardModel!.data!.totalDealSale.toString(),
                      ),
                const SizedBox(height: 10),
                dashBoardModel == null
                    ? const CircularProgressIndicator()
                    : Stacked_container(
                        discountAvailed:
                            dashBoardModel!.data!.totalDealRadeem.toString(),
                      ),
                const SizedBox(height: 10),
                dashBoardModel == null
                    ? const CircularProgressIndicator()
                    : Stacked_container2(
                        totalActiveDeals:
                            dashBoardModel!.data!.totalActiveDeals.toString(),
                      ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: FutureBuilder<Map<String, dynamic>>(
                    future: DealServices().getAllDeals(token: widget.token),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        default:
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.data!['data']!.isEmpty) {
                            return const Center(
                                child: Text('No deals available'));
                          } else {
                            print(snapshot.data!['data'].length);
                            return ListView.builder(
                              itemCount: snapshot.data!['data'].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var data = snapshot.data!['data'][index];
                                return InkWell(
                                  onTap: () {
                                    DealServices().getSingleDeal(
                                      dealId: data['id'].toString(),
                                      token: widget.token,
                                    );
                                  },
                                  child: Deals(
                                    discount: data['discount_on_price'],
                                    actualPrice: data['actual_price'],
                                    discountPrice: data['after_discount'],
                                    name: data['name'],
                                    imgUrl: data['image'] == null
                                        ? data['image']
                                        : data['image']['image'],
                                  ),
                                );
                              },
                            );
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<MerchantListOfDeals> getAllData() async {
    final result = await DealServices().getAllDeals(token: widget.token);
    final userData = MerchantListOfDeals.fromJson(result);
    print('userData: ${userData.responseCode}');
    return userData;
  }

  DashBoardModel? dashBoardModel;

  Future<void> getDashData() async {
    final result = await DashBoardStats().getDashBoardStats(widget.token);
    setState(() {
      dashBoardModel = result;
    });
    print(result.responseCode);
  }
}
