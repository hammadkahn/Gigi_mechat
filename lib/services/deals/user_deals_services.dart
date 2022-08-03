import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gigi_app/apis/api_urls.dart';
import 'package:http/http.dart' as http;
import '../../models/deal_model.dart';
import '../../models/puchase_model.dart';

class UserDealServices {
  Future<TrendingDealsModel> trendingDeals(String token) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://gigiapi.zanforthstaging.com/api/user/getTrendingDeals?lat=50&long=60&country=Pakistan&city=Lahore'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      print('body : ${response.statusCode}');
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
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SingleDeal> getSingleDealInfo(String id, String token) async {
    try {
      final url = Uri.parse('${ApiUrls.baseUrl}user/getDeal/$id');
      final response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final result = SingleDeal.fromJson(jsonDecode(response.body));
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

  Future<SinglePurchaseModel> purchaseDetails(String token, String id) async {
    try {
      final url = Uri.parse('${ApiUrls.baseUrl}user/getPurchaseDeal/$id');
      final response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      debugPrint(response.statusCode.toString());
      final result = SinglePurchaseModel.fromJson(jsonDecode(response.body));
      final mapResult = jsonDecode(response.body);

      if (response.statusCode == 200) {
        debugPrint('single deal : ${result.message}');

        return result;
      } else {
        debugPrint(response.reasonPhrase);
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
