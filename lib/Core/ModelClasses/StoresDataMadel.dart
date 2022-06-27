// To parse this JSON data, do
//
//     final allStoresDataModel = allStoresDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AllStoresDataModel allStoresDataModelFromJson(String str) => AllStoresDataModel.fromJson(json.decode(str));

String allStoresDataModelToJson(AllStoresDataModel data) => json.encode(data.toJson());

class AllStoresDataModel {
  AllStoresDataModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  int statusCode;
  String message;
  String status;
  List<Datum> data;

  factory AllStoresDataModel.fromJson(Map<String, dynamic> json) => AllStoresDataModel(
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
    this.id,
    this.name,
    this.email,
    this.lat,
    this.lng,
    this.address,
    this.coverageArea,
    this.phoneNumber,
    this.extensionNumber,
  });

  int id;
  String name;
  String email;
  dynamic lat;
  dynamic lng;
  String address;
  int coverageArea;
  String phoneNumber;
  String extensionNumber;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    lat: json["lat"],
    lng: json["lng"],
    address: json["address"],
    coverageArea: json["coverageArea"],
      phoneNumber: json['phoneNumber'],
      extensionNumber:json["extensionNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "lat": lat,
    "lng": lng,
    "address": address,
    "coverageArea": coverageArea,
    "phoneNumber":phoneNumber,
    "extensionNumber":extensionNumber,
  };
}
