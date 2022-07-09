import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/screens/full_menu/location_bar.dart';
import 'package:gigi_app/services/deals/deal_services.dart';

import '../../constant/size_constants.dart';
import 'deals.dart';
import 'percent_ind2.dart';
import 'percent_ind3.dart';
import 'percent_indicator.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key, required this.token}) : super(key: key);
  final String token;

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
                const Dashboard(),
                const SizedBox(height: 10),
                const Stacked_container(),
                const SizedBox(height: 10),
                const Stacked_container2(),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: FutureBuilder<Map<String, dynamic>>(
                    future: DealServices().getAllDeals(token: token),
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
                            return ListView.builder(
                              itemCount: snapshot.data!['data'].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    DealServices().getSingleDeal(
                                      dealId: snapshot.data!['data'][index]
                                              ['id']
                                          .toString(),
                                      token: token,
                                    );
                                  },
                                  child: Deals(
                                    discount: snapshot.data!['data'][index]
                                        ['discount'],
                                    actualPrice: snapshot.data!['data'][index]
                                        ['actual_price'],
                                    discountPrice: snapshot.data!['data'][index]
                                        ['after_discount'],
                                    name: snapshot.data!['data'][index]['name'],
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

  Future<ListOfDeals> getAllData() async {
    final result = await DealServices().getAllDeals(token: token);
    final userData = ListOfDeals.fromJson(result);
    print('userData: ${userData.responseCode}');
    return userData;
  }
}
