class CreateDeal {
  bool? status;
  int? responseCode;
  String? message;
  DealData? data;

  CreateDeal({this.status, this.responseCode, this.message, this.data});

  CreateDeal.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? categoryId;
  String? discount;
  String? type;
  String? price;
  String? actualPrice;
  String? afterDiscount;
  String? expiry;
  String? description;
  int? status;
  int? merchantId;
  int? createdBy;
  String? updatedAt;
  String? createdAt;
  int? id;

  DealData(
      {this.name,
      this.categoryId,
      this.discount,
      this.type,
      this.price,
      this.actualPrice,
      this.afterDiscount,
      this.expiry,
      this.description,
      this.status,
      this.merchantId,
      this.createdBy,
      this.updatedAt,
      this.createdAt,
      this.id});

  DealData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryId = json['category_id'];
    discount = json['discount'];
    type = json['type'];
    price = json['price'];
    actualPrice = json['actual_price'];
    afterDiscount = json['after_discount'];
    expiry = json['expiry'];
    description = json['description'];
    status = json['status'];
    merchantId = json['merchant_id'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['category_id'] = categoryId;
    data['discount'] = discount;
    data['type'] = type;
    data['price'] = price;
    data['actual_price'] = actualPrice;
    data['after_discount'] = afterDiscount;
    data['expiry'] = expiry;
    data['description'] = description;
    data['status'] = status;
    data['merchant_id'] = merchantId;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class ListOfDeals {
  bool? status;
  int? responseCode;
  String? message;
  List<DealData>? data;

  ListOfDeals({this.status, this.responseCode, this.message, this.data});

  ListOfDeals.fromJson(Map<String, dynamic> json) {
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
