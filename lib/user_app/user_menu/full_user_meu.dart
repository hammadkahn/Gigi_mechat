import 'package:flutter/material.dart';
import 'package:gigi_app/services/deals/user_deals_services.dart';

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
    return const Scaffold(
      body: Center(child: Text('full menu screen')),
    );
  }
}
