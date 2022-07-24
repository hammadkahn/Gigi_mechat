import 'package:flutter/material.dart';
import 'package:gigi_app/models/category_model.dart';
import 'package:gigi_app/services/categories/category_services.dart';
import 'package:gigi_app/shared/loaction_user.dart';
import 'package:gigi_app/user_app/categories/widget/categories_list.dart';

import 'widget/trending_deals.dart';

class Categories_user extends StatelessWidget {
  const Categories_user({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
        ),
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 24),
              child: Location_bar_user(),
            ),
            const SizedBox(
              height: 23,
            ),
            const Text('Popular deals in your area',
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF32324D),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 131,
                child: FutureBuilder<GetAllCategoriesModel>(
                    future: CategoryServices().getAllCategories(token),
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
                            // return AllCategoriesWidget(
                            //   length: 3,
                            //   direction: Axis.horizontal,
                            //   categoryList: snapshot.data!.data!,
                            // );
                            return ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return TrendingDealsWidget(
                                  dealName: snapshot.data!.data![index].name!,
                                );
                              }),
                            );
                          }
                      }
                    })),
                // child: FutureBuilder(builder: ((context, snapshot) {

                // }),)
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFD9D9D9)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFD9D9D9)),
                  ),
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFD9D9D9)),
                ),
              ],
            ),
            const SizedBox(
              height: 42,
            ),
            const Text('All Categories',
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF505050),
                )),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: FutureBuilder<GetAllCategoriesModel>(
                future: CategoryServices().getAllCategories(token),
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
                        return AllCategoriesWidget(
                          length: snapshot.data!.data!.length,
                          direction: Axis.vertical,
                          categoryList: snapshot.data!.data!,
                        );
                      }
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}