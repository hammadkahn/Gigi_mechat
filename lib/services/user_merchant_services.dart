import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../apis/api_urls.dart';
import '../models/merchant_model.dart';

class UserMerchantServices {
  Future<MerchantList> merchantListForUsers(String token) async {
    try {
      final response = await http.get(
        ApiUrls.merchantList,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
      final result = MerchantList.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        debugPrint(result.data![0].name);
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SingleMerchant> singleMerchantProfile(
      {required String id, required String token}) async {
    try {
      final url = Uri.parse('${ApiUrls.baseUrl}user/getMerchant/$id');
      final response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: token},
      );
      final result = SingleMerchant.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
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
