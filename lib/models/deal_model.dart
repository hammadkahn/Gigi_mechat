import 'package:gigi_app/models/branch_model.dart';

import 'image_model.dart';
import 'reviews_model.dart';
import 'tags_model.dart';

class MerchantListOfDeals {
  bool? status;
  int? responseCode;
  String? message;
  List<DealData>? data;

  MerchantListOfDeals(
      {this.status, this.responseCode, this.message, this.data});

  MerchantListOfDeals.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DealData>[];
      json['data'].forEach((v) {
        data!.add(DealData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['responseCode'] = responseCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrendingDealsModel {
  bool? status;
  int? responseCode;
  String? message;
  List<DealData>? data;

  TrendingDealsModel({this.status, this.responseCode, this.message, this.data});

  TrendingDealsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DealData>[];
      json['data'].forEach((v) {
        data!.add(DealData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['responseCode'] = responseCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserListOfDeals {
  bool? status;
  int? responseCode;
  String? message;
  List<DealData>? data;

  UserListOfDeals({this.status, this.responseCode, this.message, this.data});

  UserListOfDeals.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DealData>[];
      json['data'].forEach((v) {
        data!.add(DealData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['responseCode'] = responseCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SingleDeal {
  bool? status;
  int? responseCode;
  String? message;
  DealData? data;

  SingleDeal({this.status, this.responseCode, this.message, this.data});

  SingleDeal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    data = json['data'] != null ? DealData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['responseCode'] = responseCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DealData {
  int? id;
  String? name;
  String? discount;
  String? type;
  String? price;
  String? additionalDiscount;
  String? additionalDiscountDate;
  String? discountOnPrice;
  String? afterDiscount;
  String? actualPrice;
  String? categoryId;
  String? description;
  String? status;
  String? rejectReason;
  String? active;
  String? merchantId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? expiry;
  List<ImageModel>? images;
  List<Tags>? tags;
  List<BranchData>? branches;
  List<Reviews>? reviews;
  int? dealIsExpired;
  String? typeName;

  DealData(
      {this.id,
      this.name,
      this.discount,
      this.type,
      this.price,
      this.additionalDiscount,
      this.additionalDiscountDate,
      this.discountOnPrice,
      this.afterDiscount,
      this.actualPrice,
      this.categoryId,
      this.description,
      this.status,
      this.rejectReason,
      this.active,
      this.merchantId,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.expiry,
      this.images,
      this.tags,
      this.branches,
      this.reviews,
      this.dealIsExpired,
      this.typeName});

  DealData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discount = json['discount'];
    type = json['type'];
    price = json['price'];
    additionalDiscount = json['additional_discount'];
    additionalDiscountDate = json['additional_discount_date'];
    discountOnPrice = json['discount_on_price'];
    afterDiscount = json['after_discount'];
    actualPrice = json['actual_price'];
    categoryId = json['category_id'];
    description = json['description'];
    status = json['status'];
    rejectReason = json['reject_reason'];
    active = json['active'];
    merchantId = json['merchant_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiry = json['expiry'];
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['branches'] != null) {
      branches = <BranchData>[];
      json['branches'].forEach((v) {
        branches!.add(BranchData.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    dealIsExpired = json['dealIsExpired'];
    typeName = json['TypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['discount'] = discount;
    data['type'] = type;
    data['price'] = price;
    data['additional_discount'] = additionalDiscount;
    data['additional_discount_date'] = additionalDiscountDate;
    data['discount_on_price'] = discountOnPrice;
    data['after_discount'] = afterDiscount;
    data['actual_price'] = actualPrice;
    data['category_id'] = categoryId;
    data['description'] = description;
    data['status'] = status;
    data['reject_reason'] = rejectReason;
    data['active'] = active;
    data['merchant_id'] = merchantId;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['expiry'] = expiry;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['dealIsExpired'] = dealIsExpired;
    data['TypeName'] = typeName;
    return data;
  }
}
