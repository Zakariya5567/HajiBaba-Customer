class ProductDetailModel {
  int statusCode;
  String message;
  String status;
  Data data;

  ProductDetailModel({this.statusCode, this.message, this.status, this.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  ProductDetial productDetial;
  List<ProductAttributesAndVarients> productAttributesAndVarients;
  List<String> productImges;

  Data(
      {this.productDetial,
        this.productAttributesAndVarients,
        this.productImges});

  Data.fromJson(Map<String, dynamic> json) {
    productDetial = json['productDetial'] != null ?
        ProductDetial.fromJson(json['productDetial'])
        : null;
    if (json['productAttributesAndVarients'] != null) {
      productAttributesAndVarients = <ProductAttributesAndVarients>[];
      json['productAttributesAndVarients'].forEach((v) {
        productAttributesAndVarients
            .add( ProductAttributesAndVarients.fromJson(v));
      });
    }
    productImges = json['productImges'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.productDetial != null) {
      data['productDetial'] = this.productDetial.toJson();
    }
    if (this.productAttributesAndVarients != null) {
      data['productAttributesAndVarients'] =
          this.productAttributesAndVarients.map((v) => v.toJson()).toList();
    }
    data['productImges'] = this.productImges;
    return data;
  }
}

class ProductDetial {
  String id;
  String title;
  double actualPrice;
  String unit;
  String imgUrl;
  double expiryDiscountedPrice;
  double bulkDiscountedPrice;
  String expiryDiscountInPercent;
  String bulkDiscountInPercent;
  bool applyExpiryDiscount;
  bool applyBulkDiscount;
  int bulkDiscountCapacity;
  int stock;
  bool isVariableProduct;
  String productInfoText;
  String longDescription;
  String shortDiscription;

  ProductDetial(
      {this.id,
        this.title,
        this.actualPrice,
        this.unit,
        this.imgUrl,
        this.expiryDiscountedPrice,
        this.bulkDiscountedPrice,
        this.expiryDiscountInPercent,
        this.bulkDiscountInPercent,
        this.applyExpiryDiscount,
        this.applyBulkDiscount,
        this.bulkDiscountCapacity,
        this.stock,
        this.isVariableProduct,
        this.productInfoText,
        this.longDescription,
        this.shortDiscription});

  ProductDetial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    actualPrice = json['actualPrice'];
    unit = json['unit'];
    imgUrl = json['imgUrl'];
    expiryDiscountedPrice = json['expiryDiscountedPrice'];
    bulkDiscountedPrice = json['bulkDiscountedPrice'];
    expiryDiscountInPercent = json['expiryDiscountInPercent'];
    bulkDiscountInPercent = json['bulkDiscountInPercent'];
    applyExpiryDiscount = json['applyExpiryDiscount'];
    applyBulkDiscount = json['applyBulkDiscount'];
    bulkDiscountCapacity = json['bulkDiscountCapacity'];
    stock = json['stock'];
    isVariableProduct = json['isVariableProduct'];
    productInfoText = json['productInfoText'];
    longDescription = json['longDescription'];
    shortDiscription = json['shortDiscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['actualPrice'] = this.actualPrice;
    data['unit'] = this.unit;
    data['imgUrl'] = this.imgUrl;
    data['expiryDiscountedPrice'] = this.expiryDiscountedPrice;
    data['bulkDiscountedPrice'] = this.bulkDiscountedPrice;
    data['expiryDiscountInPercent'] = this.expiryDiscountInPercent;
    data['bulkDiscountInPercent'] = this.bulkDiscountInPercent;
    data['applyExpiryDiscount'] = this.applyExpiryDiscount;
    data['applyBulkDiscount'] = this.applyBulkDiscount;
    data['bulkDiscountCapacity'] = this.bulkDiscountCapacity;
    data['stock'] = this.stock;
    data['isVariableProduct'] = this.isVariableProduct;
    data['productInfoText'] = this.productInfoText;
    data['longDescription'] = this.longDescription;
    data['shortDiscription'] = this.shortDiscription;
    return data;
  }
}

class ProductAttributesAndVarients {
  String attributesName;
  List<AttributesVarients> attributesVarients;

  ProductAttributesAndVarients({this.attributesName, this.attributesVarients});

  ProductAttributesAndVarients.fromJson(Map<String, dynamic> json) {
    attributesName = json['attributesName'];
    if (json['attributesVarients'] != null) {
      attributesVarients = <AttributesVarients>[];
      json['attributesVarients'].forEach((v) {
        attributesVarients.add(new AttributesVarients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attributesName'] = this.attributesName;
    if (this.attributesVarients != null) {
      data['attributesVarients'] =
          this.attributesVarients.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttributesVarients {
  String productId;
  String attributeAndVarientId;
  String attributeName;
  String varientName;
  bool isPriceReflect;
  int verientStock;
  double varientPrice;
  int attribteId;

  AttributesVarients(
      {this.productId,
        this.attributeAndVarientId,
        this.attributeName,
        this.varientName,
        this.isPriceReflect,
        this.verientStock,
        this.varientPrice,
        this.attribteId});

  AttributesVarients.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    attributeAndVarientId = json['attributeAndVarientId'];
    attributeName = json['attributeName'];
    varientName = json['varientName'];
    isPriceReflect = json['isPriceReflect'];
    verientStock = json['verientStock'];
    varientPrice = json['varientPrice'];
    attribteId = json['attribteId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['attributeAndVarientId'] = this.attributeAndVarientId;
    data['attributeName'] = this.attributeName;
    data['varientName'] = this.varientName;
    data['isPriceReflect'] = this.isPriceReflect;
    data['verientStock'] = this.verientStock;
    data['varientPrice'] = this.varientPrice;
    data['attribteId'] = this.attribteId;
    return data;
  }
}