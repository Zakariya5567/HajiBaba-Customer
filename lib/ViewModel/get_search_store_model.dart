// To parse this JSON data, do
//
//     final searchStoresDataModel = searchStoresDataModelFromJson(jsonString);

import 'dart:convert';

SearchStoresDataModel searchStoresDataModelFromJson(String str) => SearchStoresDataModel.fromJson(json.decode(str));

String searchStoresDataModelToJson(SearchStoresDataModel data) => json.encode(data.toJson());

class SearchStoresDataModel {
  SearchStoresDataModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  int statusCode;
  String message;
  String status;
  List<Datum> data;

  factory SearchStoresDataModel.fromJson(Map<String, dynamic> json) => SearchStoresDataModel(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
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
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    lat: json["lat"],
    lng: json["lng"],
    address: json["address"] == null ? null : json["address"],
    coverageArea: json["coverageArea"] == null ? null : json["coverageArea"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    extensionNumber: json["extensionNumber"] == null ? null : json["extensionNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "lat": lat,
    "lng": lng,
    "address": address == null ? null : address,
    "coverageArea": coverageArea == null ? null : coverageArea,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "extensionNumber": extensionNumber == null ? null : extensionNumber,
  };
}
