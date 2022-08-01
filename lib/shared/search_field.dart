import 'package:flutter/material.dart';
import 'package:gigi_app/user_app/user_menu/filter.dart';

import '../constant/size_constants.dart';

class SearchField extends StatelessWidget {
  final String searchText;
  const SearchField({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.85,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF8E8EA9)),
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenWidth(15)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => filter_list()));
            },
            child: Icon(
              Icons.filter_list,
              color: Color(0xFFC0C0CF),
            ),
          ),
          hintText: searchText,
        ),
      ),
    );
  }
}
