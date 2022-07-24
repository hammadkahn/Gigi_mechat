class GetAllCategoriesModel {
  bool? status;
  int? responseCode;
  String? message;
  List<CategoryData>? data;

  GetAllCategoriesModel(
      {this.status, this.responseCode, this.message, this.data});

  GetAllCategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
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

class CategoryData {
  int? id;
  String? name;
  String? image;
  String? parentId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  CategoryData(
      {this.id,
      this.name,
      this.image,
      this.parentId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imagePath});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    parentId = json['parent_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['parent_id'] = parentId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['imagePath'] = imagePath;
    return data;
  }
}
