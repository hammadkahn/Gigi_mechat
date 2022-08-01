import 'package:flutter/material.dart';
import 'package:gigi_app/models/category_model.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.searchModel}) : super(key: key);
  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: searchModel.data!.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(searchModel.data![index].name ?? ''),
              );
            }),
          ),
        ));
  }
}
