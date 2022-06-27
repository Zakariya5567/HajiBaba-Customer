// // To parse this JSON data, do
// //
// //     final getMostTrendingProductsModel = getMostTrendingProductsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// ProductsModel getMostTrendingProductsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));
//
// String getMostTrendingProductsModelToJson(ProductsModel data) => json.encode(data.toJson());
//
// class ProductsModel {
//   ProductsModel({
//     this.statusCode,
//     this.message,
//     this.status,
//     this.data,
//   });
//
//   int statusCode;
//   String message;
//   String status;
//   List<Datum> data;
//
//   factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
//     statusCode: json["statusCode"],
//     message: json["message"],
//     status: json["status"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode,
//     "message": message,
//     "status": status,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   Datum({
//     this.id,
//     this.title,
//     this.actualPrice,
//     this.unit,
//     this.imgUrl,
//     this.expiryDiscountedPrice,
//     this.bulkDiscountedPrice,
//     this.expiryDiscountInPercent,
//     this.bulkDiscountInPercent,
//     this.applyExpiryDiscount,
//     this.applyBulkDiscount,
//     this.bulkDiscountCapacity,
//     this.stock,
//   });
//
//   String id;
//   String title;
//   String actualPrice;
//   String unit;
//   String imgUrl;
//   String expiryDiscountedPrice;
//   String bulkDiscountedPrice;
//   String expiryDiscountInPercent;
//   String bulkDiscountInPercent;
//   bool applyExpiryDiscount;
//   bool applyBulkDiscount;
//   int bulkDiscountCapacity;
//   int stock;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     title: json["title"],
//     actualPrice: json["actualPrice"] == null ? '' : json["actualPrice"].toString(),
//     unit: json["unit"],
//     imgUrl: json["imgUrl"],
//     expiryDiscountedPrice: json["expiryDiscountedPrice"] == null ? '' : json["expiryDiscountedPrice"].toString(),
//     bulkDiscountedPrice: json["bulkDiscountedPrice"] == null ? '' : json["bulkDiscountedPrice"].toString(),
//     expiryDiscountInPercent: json["expiryDiscountInPercent"] == null ? '' : json["expiryDiscountInPercent"],
//     bulkDiscountInPercent: json["bulkDiscountInPercent"] == '' ? null : json["bulkDiscountInPercent"],
//     applyExpiryDiscount: json["applyExpiryDiscount"],
//     applyBulkDiscount: json["applyBulkDiscount"],
//     bulkDiscountCapacity: json["bulkDiscountCapacity"] == '' ? null : json["bulkDiscountCapacity"],
//     stock: json["stock"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "actualPrice": actualPrice,
//     "unit": unit,
//     "imgUrl": imgUrl,
//     "expiryDiscountedPrice": expiryDiscountedPrice,
//     "bulkDiscountedPrice": bulkDiscountedPrice == null ? null : bulkDiscountedPrice,
//     "expiryDiscountInPercent": expiryDiscountInPercent,
//     "bulkDiscountInPercent": bulkDiscountInPercent == null ? null : bulkDiscountInPercent,
//     "applyExpiryDiscount": applyExpiryDiscount,
//     "applyBulkDiscount": applyBulkDiscount,
//     "bulkDiscountCapacity": bulkDiscountCapacity == null ? null : bulkDiscountCapacity,
//     "stock": stock,
//   };
// }
