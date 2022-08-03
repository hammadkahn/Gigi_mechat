class CurrentUserConversation {
  bool? status;
  int? responseCode;
  String? message;
  List<Data>? data;

  CurrentUserConversation(
      {this.status, this.responseCode, this.message, this.data});

  CurrentUserConversation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? conversationId;
  String? userId;
  String? message;
  String? attachment;
  String? seen;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.id,
      this.conversationId,
      this.userId,
      this.message,
      this.attachment,
      this.seen,
      this.createdAt,
      this.updatedAt,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conversationId = json['conversation_id'];
    userId = json['user_id'];
    message = json['message'];
    attachment = json['attachment'];
    seen = json['seen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['conversation_id'] = this.conversationId;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['attachment'] = this.attachment;
    data['seen'] = this.seen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? type;
  String? profilePicturePath;
  String? statusName;

  User(
      {this.id,
      this.name,
      this.type,
      this.profilePicturePath,
      this.statusName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    profilePicturePath = json['profilePicturePath'];
    statusName = json['StatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['profilePicturePath'] = this.profilePicturePath;
    data['StatusName'] = this.statusName;
    return data;
  }
}
