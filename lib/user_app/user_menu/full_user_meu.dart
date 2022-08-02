import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/services/deals/user_deals_services.dart';
import 'package:gigi_app/shared/loaction_user.dart';
import 'package:gigi_app/user_app/user_menu/details_with_all.dart';
import 'package:gigi_app/user_app/user_menu/merchant_card_widgets/merchant_details.dart';

import '../../constant/size_constants.dart';
import '../../shared/search_field.dart';
import 'l.dart';

class Full_menu_user extends StatelessWidget {
  const Full_menu_user({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Location_bar_user(
                  token: token,
                ),
                const Text(
                  'GiGi Find out the best deals for you!',
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF32324D)),
                ),
                SearchField(
                  token: token,
                  searchText: 'Search',
                ),
                SizedBox(
                  child: FutureBuilder<UserListOfDeals>(
                    future: UserDealServices().getAllUserDeals(token),
                    builder: ((context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else {
                            return C_slider(
                              token: token,
                              merchantList: snapshot.data!.data!,
                            );
                          }
                      }
                    }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('Trending Deals for You',
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF505050))),
                ),
                SizedBox(
                  height: 210,
                  child: userTrendingDeals(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      Text(
                        "Top Seller in ",
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF505050)),
                      ),
                      Text(
                        "Baku",
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D9BFF)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: MerchantDetails(token: token),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  userTrendingDeals() {
    return FutureBuilder<TrendingDealsModel>(
      future: UserDealServices().trendingDeals(token),
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return all_details(
                    dealId: snapshot.data!.data![index].id!.toString(),
                    token: token,
                  );
                }),
              );
            }
        }
      }),
    );
  }
}
