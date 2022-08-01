import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';
import 'package:gigi_app/services/deals/merchant_deal_services.dart';

import 'full_menu/deals.dart';

class ActiveMerchantDeals extends StatelessWidget {
  const ActiveMerchantDeals({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: FutureBuilder<MerchantListOfDeals>(
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
                } else if (snapshot.data!.data!.isEmpty) {
                  return const Center(child: Text('No deals available'));
                } else {
                  print(snapshot.data!.data!.length);
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.data![index];
                      return InkWell(
                        onTap: () {
                          DealServices().getSingleDeal(
                            dealId: data.id.toString(),
                            token: token,
                          );
                        },
                        child: Deals(
                          merchantListOfDeals: data,
                        ),
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
