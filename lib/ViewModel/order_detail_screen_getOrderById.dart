// To parse this JSON data, do
//
//     final getOrderById = getOrderByIdFromJson(jsonString);

import 'dart:convert';

GetOrderByIdModel getOrderByIdFromJson(String str) => GetOrderByIdModel.fromJson(json.decode(str));

String getOrderByIdToJson(GetOrderByIdModel data) => json.encode(data.toJson());

class GetOrderByIdModel {
  GetOrderByIdModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  int statusCode;
  String message;
  String status;
  Data data;

  factory GetOrderByIdModel.fromJson(Map<String, dynamic> json) => GetOrderByIdModel(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.refNumber,
    this.grandTotal,
    this.orderStatus,
    this.orderTime,
    this.paymentMethod,
    this.total,
    this.discount,
    this.discontInPercent,
    this.customerName,
    this.customerPhone,
    this.customerEmail,
    this.street,
    this.code,
    this.city,
    this.country,
    this.address,
    this.addressType,
    this.productsList,
    this.selectedStore,
  });

  String id;
  String refNumber;
  double grandTotal;
  String orderStatus;
  DateTime orderTime;
  String paymentMethod;
  double total;
  double discount;
  double discontInPercent;
  String customerName;
  String customerPhone;
  String customerEmail;
  String street;
  String code;
  String city;
  String country;
  String address;
  String addressType;
  List<ProductsList> productsList;
  SelectedStore selectedStore;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    refNumber: json["refNumber"] == null ? null : json["refNumber"],
    grandTotal: json["grandTotal"] == null ? null : json["grandTotal"].toDouble(),
    orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
    orderTime: json["orderTime"] == null ? null : DateTime.parse(json["orderTime"]),
    paymentMethod: json["paymentMethod"] == null ? null : json["paymentMethod"],
    total: json["total"] == null ? null : json["total"],
    discount: json["discount"] == null ? null : json["discount"],
    discontInPercent: json["discontInPercent"] == null ? null : json["discontInPercent"],
    customerName: json["customerName"] == null ? null : json["customerName"],
    customerPhone: json["customerPhone"] == null ? null : json["customerPhone"],
    customerEmail: json["customerEmail"] == null ? null : json["customerEmail"],
    street: json["street"] == null ? null : json["street"],
    code: json["code"] == null ? null : json["code"],
    city: json["city"] == null ? null : json["city"],
    country: json["country"] == null ? null : json["country"],
    address: json["address"] == null ? null : json["address"],
    addressType: json["addressType"] == null ? null : json["addressType"],
    productsList: json["productsList"] == null ? null : List<ProductsList>.from(json["productsList"].map((x) => ProductsList.fromJson(x))),
    selectedStore: json["selectedStore"] == null ? null : SelectedStore.fromJson(json["selectedStore"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "refNumber": refNumber == null ? null : refNumber,
    "grandTotal": grandTotal == null ? null : grandTotal,
    "orderStatus": orderStatus == null ? null : orderStatus,
    "orderTime": orderTime == null ? null : orderTime.toIso8601String(),
    "paymentMethod": paymentMethod == null ? null : paymentMethod,
    "total": total == null ? null : total,
    "discount": discount == null ? null : discount,
    "discontInPercent": discontInPercent == null ? null : discontInPercent,
    "customerName": customerName == null ? null : customerName,
    "customerPhone": customerPhone == null ? null : customerPhone,
    "customerEmail": customerEmail == null ? null : customerEmail,
    "street": street == null ? null : street,
    "code": code == null ? null : code,
    "city": city == null ? null : city,
    "country": country == null ? null : country,
    "address": address == null ? null : address,
    "addressType": addressType == null ? null : addressType,
    "productsList": productsList == null ? null : List<dynamic>.from(productsList.map((x) => x.toJson())),
    "selectedStore": selectedStore == null ? null : selectedStore.toJson(),
  };
}

class ProductsList {
  ProductsList({
    this.prodcutImg,
    this.productTitle,
    this.isVariableProduct,
    this.quanitty,
    this.price,
    this.expiryDiscountApplied,
    this.bulkDiscountApplied,
    this.discountedPrice,
    this.discountInPercent,
    this.orderVarients,
  });

  String prodcutImg;
  String productTitle;
  bool isVariableProduct;
  int quanitty;
  double price;
  bool expiryDiscountApplied;
  bool bulkDiscountApplied;
  double discountedPrice;
  double discountInPercent;
  List<dynamic> orderVarients;

  factory ProductsList.fromJson(Map<String, dynamic> json) => ProductsList(
    prodcutImg: json["prodcutImg"] == null ? null : json["prodcutImg"],
    productTitle: json["productTitle"] == null ? null : json["productTitle"],
    isVariableProduct: json["isVariableProduct"] == null ? null : json["isVariableProduct"],
    quanitty: json["quanitty"] == null ? null : json["quanitty"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    expiryDiscountApplied: json["expiryDiscountApplied"] == null ? null : json["expiryDiscountApplied"],
    bulkDiscountApplied: json["bulkDiscountApplied"] == null ? null : json["bulkDiscountApplied"],
    discountedPrice: json["discountedPrice"] == null ? null : json["discountedPrice"].toDouble(),
    discountInPercent: json["discountInPercent"] == null ? null : json["discountInPercent"].toDouble(),
    orderVarients: json["orderVarients"] == null ? null : List<dynamic>.from(json["orderVarients"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "prodcutImg": prodcutImg == null ? null : prodcutImg,
    "productTitle": productTitle == null ? null : productTitle,
    "isVariableProduct": isVariableProduct == null ? null : isVariableProduct,
    "quanitty": quanitty == null ? null : quanitty,
    "price": price == null ? null : price,
    "expiryDiscountApplied": expiryDiscountApplied == null ? null : expiryDiscountApplied,
    "bulkDiscountApplied": bulkDiscountApplied == null ? null : bulkDiscountApplied,
    "discountedPrice": discountedPrice == null ? null : discountedPrice,
    "discountInPercent": discountInPercent == null ? null : discountInPercent,
    "orderVarients": orderVarients == null ? null : List<dynamic>.from(orderVarients.map((x) => x)),
  };
}

class SelectedStore {
  SelectedStore({
    this.storeName,
    this.email,
    this.address,
    this.phoneNumber,
    this.extensionNumber,
    this.coverageArea,
  });

  String storeName;
  String email;
  String address;
  String phoneNumber;
  String extensionNumber;
  int coverageArea;

  factory SelectedStore.fromJson(Map<String, dynamic> json) => SelectedStore(
    storeName: json["storeName"] == null ? null : json["storeName"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : json["address"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    extensionNumber: json["extensionNumber"] == null ? null : json["extensionNumber"],
    coverageArea: json["coverageArea"] == null ? null : json["coverageArea"],
  );

  Map<String, dynamic> toJson() => {
    "storeName": storeName == null ? null : storeName,
    "email": email == null ? null : email,
    "address": address == null ? null : address,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "extensionNumber": extensionNumber == null ? null : extensionNumber,
    "coverageArea": coverageArea == null ? null : coverageArea,
  };
}
