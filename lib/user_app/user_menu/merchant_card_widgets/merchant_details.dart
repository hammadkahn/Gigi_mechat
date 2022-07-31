import 'package:flutter/material.dart';
import 'package:gigi_app/models/merchant_model.dart';
import 'package:gigi_app/services/user_merchant_services.dart';
import 'package:gigi_app/user_app/user_menu/merchant_card_widgets/details_card.dart';

class MerchantDetails extends StatelessWidget {
  const MerchantDetails({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MerchantList>(
      future: UserMerchantServices().merchantListForUsers(token),
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
                  if (snapshot.data!.data![index].averageRating! >= 0) {
                    return GestureDetector(
                      child: DetailsCardWidget(
                        data: snapshot.data!.data![index],
                        merchantId: snapshot.data!.data![index].id.toString(),
                        token: token,
                      ),
                    );
                  } else {
                    return index == 1
                        ? Text(
                            'no merchant in trending',
                            style: Theme.of(context).textTheme.headline5,
                            textAlign: TextAlign.center,
                          )
                        : const SizedBox();
                  }
                }),
              );
            }
        }
      }),
    );
  }
}
