class DashBoardModel {
  bool? status;
  int? responseCode;
  String? message;
  DashBoardData? data;

  DashBoardModel({this.status, this.responseCode, this.message, this.data});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    data = json['data'] != null ? DashBoardData.fromJson(json['data']) : null;
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

class DashBoardData {
  int? totalDealSale;
  int? totalDealRadeem;
  int? totalActiveDeals;
  int? totalSale;

  DashBoardData(
      {this.totalDealSale,
      this.totalDealRadeem,
      this.totalActiveDeals,
      this.totalSale});

  DashBoardData.fromJson(Map<String, dynamic> json) {
    totalDealSale = json['totalDealSale'];
    totalDealRadeem = json['totalDealRadeem'];
    totalActiveDeals = json['totalActiveDeals'];
    totalSale = json['totalSale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalDealSale'] = totalDealSale;
    data['totalDealRadeem'] = totalDealRadeem;
    data['totalActiveDeals'] = totalActiveDeals;
    data['totalSale'] = totalSale;
    return data;
  }
}
