import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/services/deals/user_deals_services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'deals_details.dart';
import 'trending.dart';

class all_details extends StatefulWidget {
  const all_details({Key? key, required this.dealId, required this.token})
      : super(key: key);
  final String dealId;
  final String token;

  @override
  State<all_details> createState() => _all_detailsState();
}

class _all_detailsState extends State<all_details> {
  DealData? dealData;

  Future<void> getDealData() async {
    final result = await UserDealServices().getSingleDealInfo(
      widget.dealId,
      widget.token,
    );
    setState(() {
      dealData = result.data;
    });
  }

  @override
  void initState() {
    getDealData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dealData == null
        ? const Center(child: CircularProgressIndicator())
        : GestureDetector(
            child: trending_user(data: dealData!),
            onTap: () {
              debugPrint(widget.dealId);
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(26))),
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: Details_deals(data: dealData!),
                ),
              );
            });
  }
}
