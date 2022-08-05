import 'package:flutter/material.dart';
import 'package:gigi_app/models/deal_model.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({Key? key, required this.dealData}) : super(key: key);
  final Data dealData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dealData.name!,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: SingleChildScrollView(
          // controller: controller,
          child: Column(
            children: [
              // dealData.logo == null
              // ?
              Image.asset('assets/images/kfc.png'),
              // : Image.network(
              //     '${dealData.logoPath}/${dealData.logoPath}'),
              const SizedBox(height: 12),
              ListTile(
                title: Text(dealData.name!, textScaleFactor: 1.2),
                trailing: Text('\$${dealData.price!}'),
                subtitle: Text(dealData.typeName!),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Description'),
                subtitle: Text(dealData.description!,
                    style: TextStyle(fontSize: 11, color: Colors.grey[400])),
              ),

              const SizedBox(height: 8),
              ListTile(
                title: const Text('Sale Reports'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Sales : ${dealData.totalPurchase}'),
                    Text('Total Reviews : ${dealData.totalReviews}'),
                    Text('Total Redeem : ${dealData.totalRadeem}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
