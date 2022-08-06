import 'package:flutter/material.dart';
import 'package:gigi_app/models/category_model.dart';
import 'package:gigi_app/services/categories/category_services.dart';
import 'package:gigi_app/shared/search_result.dart';
import 'package:gigi_app/user_app/user_menu/filter.dart';
import 'package:provider/provider.dart';

import '../constant/size_constants.dart';
import '../providers/deal_provider.dart';

class SearchField extends StatefulWidget {
  final String searchText;
  final String token;
  const SearchField({Key? key, required this.searchText, required this.token})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController controller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.85,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF8E8EA9)),
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => debugPrint(value),
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenWidth(15)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          suffixIcon: IconButton(
              icon: const Icon(Icons.search, color: Color(0xFFC0C0CF)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('searching...')));
                searchData().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchResult(
                        searchModel: searchModel!,
                        token: widget.token,
                      ),
                    ),
                  );
                });
              }),
          prefixIcon: GestureDetector(
            onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const filter_list()),
            child: const Icon(
              Icons.filter_list,
              color: Color(0xFFC0C0CF),
            ),
          ),
          hintText: widget.searchText,
        ),
      ),
    );
  }

  SearchModel? searchModel;

  Future<void> searchData() async {
    double? startingDiscount =
        Provider.of<DealProvider>(context, listen: false).priceRange!.start;
    double? endignDiscount =
        Provider.of<DealProvider>(context, listen: false).priceRange!.end;
    final result = await CategoryServices().searchDeal(
        widget.token, controller.text,
        startingDiscount:
            '${startingDiscount.isInfinite || startingDiscount.isNaN || startingDiscount.toString().isEmpty ? '0' : startingDiscount}',
        endingDiscount:
            '${endignDiscount.isInfinite || endignDiscount.isNaN || endignDiscount.toString().isEmpty ? '100' : endignDiscount}');
    if (result.message == 'success') {
      debugPrint(result.message);
      setState(() {
        searchModel = result;
        print(searchModel!.data![0].name);
      });
    } else {
      debugPrint(result.message);
      setState(() {
        searchModel = result;
      });
    }
  }
}
