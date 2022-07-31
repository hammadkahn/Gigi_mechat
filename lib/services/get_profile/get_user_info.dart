import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gigi_app/apis/api_urls.dart';
import 'package:gigi_app/models/merchant_profile_model.dart';
import 'package:gigi_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserInformation {
  Future<ProfileModel> getMerchantInformation(String token) async {
    try {
      final response = await http.get(
        ApiUrls.getMerchantProfile,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final result = ProfileModel.fromJson(jsonDecode(response.body));
        print(result);
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserProfileModel> getUserProfile(String token) async {
    try {
      final response = await http.get(ApiUrls.getUserProf, headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      });
      final result = UserProfileModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        debugPrint(result.data!.name);
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
