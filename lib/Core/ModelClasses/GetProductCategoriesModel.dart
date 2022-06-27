// To parse this JSON data, do
//
//     final getProductCategoriesModel = getProductCategoriesModelFromJson(jsonString);

import 'dart:convert';

GetProductCategoriesModel getProductCategoriesModelFromJson(String str) => GetProductCategoriesModel.fromJson(json.decode(str));

String getProductCategoriesModelToJson(GetProductCategoriesModel data) => json.encode(data.toJson());

class GetProductCategoriesModel {
  GetProductCategoriesModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  int statusCode;
  String message;
  String status;
  List<Datum> data;

  factory GetProductCategoriesModel.fromJson(Map<String, dynamic> json) => GetProductCategoriesModel(
    statusCode: json["statusCode"],
    message: json["message"],
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.imgUrl,
    this.categoryName,
    this.id,
  });

  String imgUrl;
  String categoryName;
  int id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    imgUrl: json["imgUrl"],
    categoryName: json["categoryName"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "imgUrl": imgUrl,
    "categoryName": categoryName,
    "id": id,
  };
}
