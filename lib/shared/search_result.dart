import 'package:flutter/material.dart';
import 'package:gigi_app/models/category_model.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.searchModel}) : super(key: key);
  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    final dealPovider = Provider.of<DealProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: searchModel.data!.isEmpty
              ? const Center(
                  child: Text(
                    'Not found',
                    textScaleFactor: 1.1,
                  ),
                )
              : ListView.builder(
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
