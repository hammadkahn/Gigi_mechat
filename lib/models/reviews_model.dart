import 'package:flutter/cupertino.dart';

class Reviews {
  int? id;
  String? userId;
  String? dealId;
  String? merchantId;
  String? rating;
  String? notes;
  String? createdAt;
  String? updatedAt;
  String? userName;

  Reviews(
      {this.id,
      this.userId,
      this.dealId,
      this.merchantId,
      this.rating,
      this.notes,
      this.createdAt,
      this.updatedAt,
      this.userName});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    dealId = json['deal_id'];
    merchantId = json['merchant_id'];
    rating = json['rating'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['deal_id'] = dealId;
    data['merchant_id'] = merchantId;
    data['rating'] = rating;
    data['notes'] = notes;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_name'] = userName;
    return data;
  }

  String getRating(List<Reviews>? rating) {
    List<String>? fiveStars = List.empty(growable: true);
    List<String>? fourStars = List.empty(growable: true);
    List<String>? threeStars = List.empty(growable: true);
    List<String>? twoStars = List.empty(growable: true);
    List<String>? oneStars = List.empty(growable: true);
    double zeroRating = 0.0;

    if (rating == null || rating.isEmpty) {
      return zeroRating.toString();
    } else {
      for (int i = 0; i < rating.length; i++) {
        int stars = int.parse(rating[i].rating!);
        if (stars == 5) {
          fiveStars.add(rating[i].rating!);
          debugPrint('five stars: ${fiveStars.length}');
        } else if (stars == 4) {
          fourStars.add(rating[i].rating!);
          debugPrint(fourStars.length.toString());
        } else if (stars == 3) {
          threeStars.add(rating[i].rating!);
          debugPrint(threeStars.length.toString());
        } else if (stars == 2) {
          twoStars.add(rating[i].rating!);
          debugPrint(twoStars.length.toString());
        } else if (stars == 1) {
          oneStars.add(rating[i].rating!);
          debugPrint(oneStars.length.toString());
        } else {
          debugPrint('no reviews');
        }
      }
      double? totalReviews;
      int? sumOfReviews = 0;
      sumOfReviews = (5 * fiveStars.length) +
          (4 * fourStars.length) +
          (3 * threeStars.length) +
          (2 * twoStars.length) +
          (1 * oneStars.length);
      totalReviews = sumOfReviews / rating.length;

      debugPrint(totalReviews.toString());
      return totalReviews.toString();
    }
  }
}
