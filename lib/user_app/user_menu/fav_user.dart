import 'package:flutter/material.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:gigi_app/user_app/user_menu/wishlist.dart';
import 'package:provider/provider.dart';

import '../../models/wish_list_model.dart';
import '../../shared/custom_button.dart';
import 'cart_user.dart';

class Fav_user extends StatelessWidget {
  const Fav_user({Key? key, required this.token}) : super(key: key);
  final String token;

  static const url = 'https://gigiapi.zanforthstaging.com/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 32, top: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/arrow-left.png')),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Text(
                      'Your Wishlist',
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF32324D)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: FutureBuilder<WishListModel>(
                  future: Provider.of<DealProvider>(context, listen: false)
                      .getWishList(token),
                  builder: ((context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Column(
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text('Error: ${snapshot.error}'),
                              )
                            ],
                          );
                        } else {
                          var data = snapshot.data!.data!;
                          return ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return Wishlist(
                                  wishData: data[index],
                                );
                              }));
                        }
                    } //test
                  }),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                  text: 'Add to Cart ➔',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => Cart_user(token: token)));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:gigi_app/providers/deal_provider.dart';
// import 'package:provider/provider.dart';

// class Fav_user extends StatelessWidget {
//   const Fav_user({Key? key, required this.token}) : super(key: key);
//   final String token;

//   

//   @override
//   Widget build(BuildContext context) {
//     final DealProvider dealProvider =
//         Provider.of<DealProvider>(context, listen: false);
//     return Scaffold(
//       body: FutureBuilder(
//         future: dealProvider.getWishList(token),
//         builder: ((context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return const Center(child: CircularProgressIndicator());
//             default:
//               if (snapshot.hasError) {
//                 return Center(child: Text(snapshot.error.toString()));
//               } else {
//                 return ListView.builder(
//                   itemCount: dealProvider.wishData.length,
//                   itemBuilder: ((context, index) {
//                     return ListTile(
//                       leading: dealProvider.wishData[index].image != null
//                           ? Image.network(
//                               url +
//                                   dealProvider.wishData[index].image!.path! +
//                                   dealProvider.wishData[index].image!.image!,
//                               height: 70,
//                               width: 60)
//                           : Image.asset('assets/images/food.png',
//                               height: 70, width: 60),
//                       title: Text(
//                         dealProvider.wishData[index].name!,
//                         textScaleFactor: 1.5,
//                       ),
//                     );
//                   }),
//                 );
//               }
//           }
//         }),
//       ),
//     );
//   }
// }
