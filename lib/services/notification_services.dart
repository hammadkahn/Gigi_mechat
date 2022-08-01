import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gigi_app/models/notification.dart';
import 'package:http/http.dart' as http;

import '../apis/api_urls.dart';

class NotificationServices {
  Future<NotificationModel> getNotifications({required String token}) async {
    try {
      final url = Uri.parse('${ApiUrls.baseUrl}getNotifications');
      final response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final result = NotificationModel.fromJson(jsonDecode(response.body));
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
