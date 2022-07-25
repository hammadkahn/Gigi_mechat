import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gigi_app/apis/api_urls.dart';
import 'package:http/http.dart' as http;
import '../../models/deal_model.dart';

class UserDealServices {
  Future<TrendingDealsModel> trendingDeals(String token) async {
    try {
      final response = await http.get(
        ApiUrls.trendingDealsUrl,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );

      final result = TrendingDealsModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        debugPrint(result.message);
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserListOfDeals> getAllUserDeals(String token) async {
    try {
      final response = await http.get(
        ApiUrls.userAllDeals,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );

      final result = UserListOfDeals.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        debugPrint(result.message);
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
