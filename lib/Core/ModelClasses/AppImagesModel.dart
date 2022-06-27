// ignore: file_names


import 'dart:convert';

AppImagesModel appImagesModelFromJson(String str) => AppImagesModel.fromJson(json.decode(str));

// String appImagesModelToJson(AppImagesModel data) => json.encode(data.toJson());

class AppImagesModel {
  AppImagesModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  int statusCode;
  String message;
  String status;
  String data;

  factory AppImagesModel.fromJson(Map<String, dynamic> json) => AppImagesModel(
    statusCode: json["statusCode"],
    message: json["message"],
    status: json["status"],
    data: json["data"]
    // List<dynamic>.from(json["data"].map((x) => x)),
  );

  // Map<String, dynamic> toJson() => {
  //   "statusCode": statusCode,
  //   "message": message,
  //   "status": status,
  //   "data": List<dynamic>.from(data.map((x) => x)),
  // };
}
