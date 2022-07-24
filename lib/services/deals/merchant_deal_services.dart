import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gigi_app/apis/api_urls.dart';
import 'package:http/http.dart' as http;

class DealServices {
  Future<Map<String, dynamic>> getAllDeals({required String token}) async {
    final response = await http.get(
      ApiUrls.allDeals,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      return result;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Map<String, dynamic>> getSingleDeal({
    required String dealId,
    required String token,
  }) async {
    try {
      final url = '${ApiUrls.baseUrl}merchant/getDeal/$dealId';
      final response = await http.get(
        Uri.parse(url),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );

      final result = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return result;
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
