import 'branch_model.dart';

class ProfileModel {
  bool? status;
  int? responseCode;
  String? message;
  MerchantProfileData? data;

  ProfileModel({this.status, this.responseCode, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    data = json['data'] != null
        ? MerchantProfileData.fromJson(json['data'])
        : null;
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

class MerchantProfileData {
  int? id;
  String? name;
  String? gender;
  String? email;
  String? phone;
  String? dateOfBirth;
  DateTime? emailVerifiedAt;
  String? profilePicture;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<BranchData>? branches;
  int? averageRating;
  List? reviews;
  int? activeOffers;
  int? dealRadeems;
  int? totalDealPurchase;
  int? totalCategories;
  String? profilePicturePath;
  String? statusName;

  MerchantProfileData(
      {this.id,
      this.name,
      this.gender,
      this.email,
      this.phone,
      this.dateOfBirth,
      this.emailVerifiedAt,
      this.profilePicture,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.branches,
      this.averageRating,
      this.reviews,
      this.activeOffers,
      this.dealRadeems,
      this.totalDealPurchase,
      this.totalCategories,
      this.profilePicturePath,
      this.statusName});

  MerchantProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    dateOfBirth = json['date_of_birth'];
    emailVerifiedAt = json['email_verified_at'];
    profilePicture = json['profile_picture'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['branches'] != null) {
      branches = <BranchData>[];
      json['branches'].forEach((v) {
        branches!.add(BranchData.fromJson(v));
      });
    }
    averageRating = json['averageRating'];
    reviews = null;
    // if (json['reviews'] != null) {
    //   reviews = <Null>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(.fromJson(v));
    //   });
    // }
    activeOffers = json['activeOffers'];
    dealRadeems = json['dealRadeems'];
    totalDealPurchase = json['totalDealPurchase'];
    totalCategories = json['totalCategories'];
    profilePicturePath = json['profilePicturePath'];
    statusName = json['StatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['date_of_birth'] = dateOfBirth;
    data['email_verified_at'] = emailVerifiedAt;
    data['profile_picture'] = profilePicture;
    data['type'] = type;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    data['averageRating'] = averageRating;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['activeOffers'] = activeOffers;
    data['dealRadeems'] = dealRadeems;
    data['totalDealPurchase'] = totalDealPurchase;
    data['totalCategories'] = totalCategories;
    data['profilePicturePath'] = profilePicturePath;
    data['StatusName'] = statusName;
    return data;
  }
}
