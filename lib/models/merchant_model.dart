class MerchantSignUp {
  bool? status;
  int? responseCode;
  String? message;
  Data? data;

  MerchantSignUp({this.status, this.responseCode, this.message, this.data});

  MerchantSignUp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? name;
  String? email;
  String? phone;
  String? dateOfBirth;
  int? type;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? profilePicturePath;

  Data(
      {this.name,
      this.email,
      this.phone,
      this.dateOfBirth,
      this.type,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.profilePicturePath});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    dateOfBirth = json['date_of_birth'];
    type = json['type'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    profilePicturePath = json['profilePicturePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['date_of_birth'] = dateOfBirth;
    data['type'] = type;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['profilePicturePath'] = profilePicturePath;
    return data;
  }
}

class LoginModel {
  bool? status;
  int? responseCode;
  String? message;
  Data? data;

  LoginModel({this.status, this.responseCode, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class LoginError {
  bool? status;
  int? responseCode;
  String? error;

  LoginError({this.status, this.responseCode, this.error});

  LoginError.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['responseCode'] = responseCode;
    data['error'] = error;
    return data;
  }
}
