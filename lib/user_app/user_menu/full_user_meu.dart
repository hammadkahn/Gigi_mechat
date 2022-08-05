import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/services/deals/user_deals_services.dart';
import 'package:gigi_app/user_app/user_menu/details_with_all.dart';
import 'package:gigi_app/user_app/user_menu/merchant_card_widgets/merchant_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/size_constants.dart';
import '../../shared/search_field.dart';
import '../notification_screen.dart';
import 'ham_user.dart';
import 'l.dart';

class Full_menu_user extends StatefulWidget {
  const Full_menu_user({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<Full_menu_user> createState() => _Full_menu_userState();
}

class _Full_menu_userState extends State<Full_menu_user> {
  String? selectedValue;
  String? country;
  List<dynamic>? items;

  Future<void> getCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country');
  }

  Future<void> fetchCitiesAndCountries() async {
    final result =
        await UserDealServices().getSystemCities(widget.token, country ?? '');

    setState(() {
      items = result['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getCountry().whenComplete(() {
      fetchCitiesAndCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                locationDropdown(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'GiGi Find out the best deals for you!',
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF32324D)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SearchField(
                  token: widget.token,
                  searchText: 'Search',
                ),
                SizedBox(
                  child: FutureBuilder<UserListOfDeals>(
                    future: UserDealServices().getAllUserDeals(widget.token),
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
                          } else if (snapshot.data == null ||
                              snapshot.data!.data!.isEmpty) {
                            return const Center(
                              child:
                                  Text('No recent offers added in last 7 days'),
                            );
                          } else {
                            return C_slider(
                              token: widget.token,
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
                    children: [
                      const Text(
                        "Top Seller in ",
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF505050)),
                      ),
                      Text(
                        country ?? 'fetching...',
                        style: const TextStyle(
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
                  child: MerchantDetails(token: widget.token),
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
      future: UserDealServices()
          .trendingDeals(widget.token, selectedValue ?? '', country ?? ''),
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
              if (snapshot.data!.data == null || snapshot.data!.data!.isEmpty) {
                return const Center(
                  child: Text('No deals in trending'),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return all_details(
                      dealId: snapshot.data!.data![index].id!.toString(),
                      token: widget.token,
                    );
                  }),
                );
              }
            }
        }
      }),
    );
  }

  Widget locationDropdown() {
    return Row(
      children: [
        Image.asset('assets/images/Vector.png'),
        Padding(
          padding: const EdgeInsets.only(left: 10.94),
          child: items == null
              ? const Text('fetching...')
              : DropdownButton2(
                  icon: const SizedBox(),
                  isExpanded: true,
                  hint: Text(
                    country == null || country!.isEmpty ? 'Country' : country!,
                    style: const TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0D9BFF)),
                    overflow: TextOverflow.ellipsis,
                  ),
                  items: items!
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0D9BFF)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  underline: const SizedBox(),
                  buttonHeight: 30,
                  buttonWidth: 100,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 8),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  buttonElevation: 0,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 160,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ham_user(
                        token: widget.token,
                      )));
            },
            child: Image.asset('assets/images/drawer.png')),
        const SizedBox(width: 13),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) =>
                    NotificationScreen(token: widget.token))));
          },
          child: Image.asset(
            'assets/images/notification.png',
            height: 24,
            width: 24,
          ),
        )
      ],
    );
  }
}
