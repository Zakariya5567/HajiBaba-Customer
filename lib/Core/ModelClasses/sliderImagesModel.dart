// To parse this JSON data, do
//
//     final sliderImagesModel = sliderImagesModelFromJson(jsonString);

import 'dart:convert';

SliderImagesModel sliderImagesModelFromJson(String str) => SliderImagesModel.fromJson(json.decode(str));

String sliderImagesModelToJson(SliderImagesModel data) => json.encode(data.toJson());

class SliderImagesModel {
  SliderImagesModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  int statusCode;
  String message;
  String status;
  List<Datum> data;

  factory SliderImagesModel.fromJson(Map<String, dynamic> json) => SliderImagesModel(
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
    this.serverName,
  });

  String serverName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    serverName: json["serverName"],
  );

  Map<String, dynamic> toJson() => {
    "serverName": serverName,
  };
}
