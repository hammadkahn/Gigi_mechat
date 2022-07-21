import 'dart:convert';
import 'dart:io';

import 'package:gigi_app/apis/api_urls.dart';
import 'package:gigi_app/models/merchant_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MerchantAuthServices {
  Future<MerchantSignUp> merchantRegisteration(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await http.post(
        ApiUrls.merchantSignUp,
        body: data,
      );

      if (response.statusCode == 200) {
        print(response.body);
        return MerchantSignUp.fromJson(jsonDecode(response.body));
      } else {
        print(response.statusCode);
        return MerchantSignUp.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> merchantLogin(
    String email,
    String password,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final response = await http.post(
        ApiUrls.login,
        body: {'email': email, 'password': password},
      );
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        print('result : ${result['data']['token']}');

        preferences.setString('username', result['data']['name']);
        preferences.setString('email', result['data']['email']);
        preferences.setString('phone_number', result['data']['phone']);

        return result;
      } else {
        print(response.statusCode);
        print(response.body);
        return result;
      }
    } catch (e) {
      print('error catch : $e');
      throw Exception(e);
    }
  }

  Future<String> logOut(String token) async {
    try {
      final response = await http.post(ApiUrls.logOut,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        return result['message'];
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
