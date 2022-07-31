import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gigi_app/models/cart_model.dart';
import 'package:gigi_app/models/puchase_model.dart';
import 'package:gigi_app/models/wish_list_model.dart';
import 'package:http/http.dart' as http;
import '../apis/api_urls.dart';
import '../models/deal_model.dart';

class DealProvider extends ChangeNotifier {
  TrendingDealsModel? dealsDataList;
  DealData? _dealData;
  CartData? _purchaseData;

  List<CartData> _cartData = [];
  int _qty = 0;
  String _msg = 'purchase fail';

  TrendingDealsModel get deals => dealsDataList!;
  DealData get dealData => _dealData!;
  CartData get purchaseData => _purchaseData!;

  List<CartData> get cartData => _cartData;

  int get qty => _qty;
  String get msg => _msg;

  Future<void> tryCatch(String token, dynamic url,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await http.post(
        url,
        body: data,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      final result = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        debugPrint(response.body);
        _msg = '${result['message']}fully added to the cart';
        debugPrint('$msg : $_msg');
        notifyListeners();
      } else {
        debugPrint(response.reasonPhrase);
        _msg = result['message'];
        notifyListeners();
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> fetchTrendingDeals(String token) async {
    debugPrint('token provider: $token');
    try {
      final response = await http.get(
        ApiUrls.trendingDealsUrl,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final result = TrendingDealsModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        debugPrint(result.message);

        dealsDataList = result;
        debugPrint(dealsDataList!.data.toString());
        notifyListeners();
      } else {
        debugPrint(response.reasonPhrase);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('error : $e');
      throw Exception(e);
    }
  }

  Future<void> addToCart(String token, Map<String, dynamic> data) async {
    await tryCatch(token, ApiUrls.purchaseDeal, data: data);
  }

  Future<CartListModel> getCartItemsList(String token) async {
    try {
      final response = await http.get(
        ApiUrls.cartList,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final result = CartListModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        _cartData = result.data!;
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        throw Exception(result.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> wishList(String token, Map<String, dynamic> data) async {
    await tryCatch(token, ApiUrls.addToWishList, data: data);
  }

  Future<WishListModel> getWishList(String token) async {
    try {
      final response = await http.get(
        ApiUrls.getWishList,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final result = WishListModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        throw Exception(result.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> singleDealDetails(String token, String id) async {
    try {
      final url = Uri.parse('${ApiUrls.baseUrl}user/getDeal/$id');
      final response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final result = SingleDeal.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        _dealData = result.data;
        notifyListeners();
      } else {
        debugPrint(response.reasonPhrase);
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SinglePurchaseModel> purchaseDetails(String token, String id) async {
    debugPrint(token);
    try {
      final url = Uri.parse('${ApiUrls.baseUrl}user/getPurchaseDeal/$id');
      final response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      debugPrint(response.statusCode.toString());
      final result = SinglePurchaseModel.fromJson(jsonDecode(response.body));
      final mapResult = jsonDecode(response.body);

      print(mapResult);
      if (response.statusCode == 200) {
        debugPrint('single deal : ${result.message}');
        _qty = int.parse(result.data!.purchaseQuantity!);
        debugPrint(_qty.toString());
        notifyListeners();
        return result;
      } else {
        debugPrint(response.reasonPhrase);
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void increaseQty() {
    _qty += 1;
    debugPrint(_qty.toString());
    debugPrint(qty.toString());
    notifyListeners();
  }

  void decreaseQty() {
    _qty -= 1;
    if (_qty <= 0) _qty = 0;
    debugPrint(qty.toString());
    notifyListeners();
  }

  String calculateDiscount(
    String discountOnPrice,
    String price,
  ) {
    double? priceAfterDiscount = 0;
    double? getPrice;
    double? percentage;
    percentage = int.parse(discountOnPrice) / 100;
    getPrice = percentage * int.parse(price);
    priceAfterDiscount = int.parse(price) - getPrice;

    return priceAfterDiscount.toString();
  }
}
