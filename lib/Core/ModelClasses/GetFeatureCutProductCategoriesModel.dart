// To parse this JSON data, do
//
//     final getFeatureCutProductCategoriesModel = getFeatureCutProductCategoriesModelFromJson(jsonString);

import 'dart:convert';

GetFeatureCutProductCategoriesModel getFeatureCutProductCategoriesModelFromJson(String str) => GetFeatureCutProductCategoriesModel.fromJson(json.decode(str));

String getFeatureCutProductCategoriesModelToJson(GetFeatureCutProductCategoriesModel data) => json.encode(data.toJson());

class GetFeatureCutProductCategoriesModel {
  GetFeatureCutProductCategoriesModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  int statusCode;
  String message;
  String status;
  List<Datum> data;

  factory GetFeatureCutProductCategoriesModel.fromJson(Map<String, dynamic> json) => GetFeatureCutProductCategoriesModel(
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
