import 'dart:convert';
import 'dart:io';

import 'package:gigi_app/apis/api_urls.dart';
import 'package:http/http.dart' as http;

import '../../models/dash_board_model.dart';

class DashBoardStats {
  Future<DashBoardModel> getDashBoardStats(String token) async {
    try {
      final response = await http.get(
        ApiUrls.getDashStats,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final result = DashBoardModel.fromJson(jsonDecode(response.body));
        //jsonDecode(response.body) as Map<String, dynamic>;
        print(result.message);
        return result;
      } else {
        print(response.statusCode);
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
