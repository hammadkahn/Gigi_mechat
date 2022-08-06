import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:gigi_app/apis/api_urls.dart';
import 'package:gigi_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  Future<GetAllCategoriesModel> getAllCategories(String token) async {
    try {
      final response = await http.get(
        ApiUrls.getAllCat,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final result = GetAllCategoriesModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SearchModel> searchDeal(String token, String search,
      {String? startingDiscount = '0', String? endingDiscount = '100'}) async {
    try {
      final response = await http.get(
        Uri.parse(
            '${ApiUrls.baseUrl}user/getNearByDeals?cities[0]=Lahore&cities[1]=Karachi&returnType=customPagination&timeSort=desc&searchText=$search&country=Pakistan&startingDiscount=$startingDiscount&endingDiscount=$endingDiscount'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final result = SearchModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        debugPrint(response.body);
        debugPrint(result.responseCode.toString());
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
