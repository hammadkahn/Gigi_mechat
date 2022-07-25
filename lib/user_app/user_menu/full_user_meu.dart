import 'package:flutter/material.dart';
import 'package:gigi_app/services/deals/user_deals_services.dart';
import 'package:gigi_app/shared/loaction_user.dart';
import 'package:gigi_app/user_app/user_menu/details_with_all.dart';
import 'package:gigi_app/user_app/user_menu/trending.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'deals_details.dart';
import 'l.dart';

class Full_menu_user extends StatefulWidget {
  const Full_menu_user({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<Full_menu_user> createState() => _Full_menu_userState();
}

class _Full_menu_userState extends State<Full_menu_user> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero).then((value) {
      UserDealServices().getAllUserDeals(widget.token);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Location_bar_user(),
                Text(
                  'GiGi Find out the best deals for you!',
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF32324D)),
                ),
                C_slider(),
                Text('Trending Deals for You',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF505050))),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: (Row(
                      children: [
                        all_details(),
                        all_details(),
                        all_details(),
                      ],
                    ))),
                Row(
                  children: [
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
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: (Row(
                      children: [
                        all_details(),
                        all_details(),
                        all_details(),
                      ],
                    ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
