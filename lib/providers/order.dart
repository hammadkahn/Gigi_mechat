import 'package:flutter/material.dart';

class CartItems {
  String id;
  String price;
  String discountOnPrice;
  String title;
  String reviews;
  String image;
  String qty;
  String priceAfterDiscount;
  String reviewsCount;
  String path;

  CartItems({
    required this.id,
    required this.reviewsCount,
    required this.priceAfterDiscount,
    required this.qty,
    required this.price,
    required this.discountOnPrice,
    required this.reviews,
    required this.title,
    required this.image,
    required this.path,
  });
}

class Cart with ChangeNotifier {
  final List<CartItems> _cartItemsList = [];
  int _qty = 0;

  List<CartItems> get cartItems => _cartItemsList;
  int get qty => _qty;

  addTCart({
    required String? id,
    required String? price,
    required String? title,
    required String? image,
    required String? reviews,
    required String? discountOnPrice,
    required String path,
    String? afterDiscount = '0',
    String? reviewsCount = '0',
  }) {
    _cartItemsList.add(
      CartItems(
        reviewsCount: reviewsCount ?? '0',
        priceAfterDiscount: calculateDiscount(discountOnPrice!, price!),
        qty: qty.toString(),
        id: id!,
        path: path,
        image: image ?? '',
        price: price,
        reviews: reviews ?? '0',
        discountOnPrice: discountOnPrice,
        title: title!,
      ),
    );
    notifyListeners();
  }

  //remove deal from the cart
  void removeItem(int index) {
    _cartItemsList.removeAt(index);
    notifyListeners();
  }

  void checkIsAddedToCart(BuildContext context) {
    if (cartItems.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('deal added to the cart'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('error while adding to cart'),
        ),
      );
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

  String calculateRealPrice(int qty, String discount, String price) {
    double totalAmount = 0;
    debugPrint(discount);
    debugPrint(qty.toString());
    String result = calculateDiscount(discount, price);

    totalAmount = double.parse(result) * qty;
    debugPrint('total amount : $totalAmount');
    return totalAmount.toString();
  }
}
