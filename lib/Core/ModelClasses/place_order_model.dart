class PlaceOrderModel {
  int discount;
  double discontInPercent;
  int total;
  int grandTotal;
  String customerId;
  String cstomerAddressId;
  int paymentMethodId;
  int storeId;
  String stripeTransactionId;
  List<OrderedProductsList> orderedProductsList;

  PlaceOrderModel(
      {this.discount,
        this.discontInPercent,
        this.total,
        this.grandTotal,
        this.customerId,
        this.cstomerAddressId,
        this.paymentMethodId,
        this.storeId,
        this.stripeTransactionId,
        this.orderedProductsList});

  PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    discontInPercent = json['discontInPercent'];
    total = json['total'];
    grandTotal = json['grandTotal'];
    customerId = json['customerId'];
    cstomerAddressId = json['cstomerAddressId'];
    paymentMethodId = json['paymentMethodId'];
    storeId = json['storeId'];
    stripeTransactionId = json['stripeTransactionId'];
    if (json['orderedProductsList'] != null) {
      orderedProductsList = <OrderedProductsList>[];
      json['orderedProductsList'].forEach((v) {
        orderedProductsList.add(new OrderedProductsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this.discount;
    data['discontInPercent'] = this.discontInPercent;
    data['total'] = this.total;
    data['grandTotal'] = this.grandTotal;
    data['customerId'] = this.customerId;
    data['cstomerAddressId'] = this.cstomerAddressId;
    data['paymentMethodId'] = this.paymentMethodId;
    data['storeId'] = this.storeId;
    data['stripeTransactionId'] = this.stripeTransactionId;
    if (this.orderedProductsList != null) {
      data['orderedProductsList'] =
          this.orderedProductsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderedProductsList {
  String productId;
  String productTitle;
  bool isVariableProduct;
  int quantity;
  int price;
  bool expiryDiscountApplied;
  bool bulkDiscountApplied;
  int discountedPrice;
  double discountInPercent;
  List<ProductAttributesAndVarientIds> productAttributesAndVarientIds;

  OrderedProductsList(
      {this.productId,
        this.isVariableProduct,
        this.quantity,
        this.price,
        this.expiryDiscountApplied,
        this.bulkDiscountApplied,
        this.discountedPrice,
        this.discountInPercent,
        this.productTitle,
        this.productAttributesAndVarientIds});

  OrderedProductsList.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    isVariableProduct = json['isVariableProduct'];
    quantity = json['quantity'];
    price = json['price'];
    expiryDiscountApplied = json['expiryDiscountApplied'];
    bulkDiscountApplied = json['bulkDiscountApplied'];
    discountedPrice = json['discountedPrice'];
    discountInPercent = json['discountInPercent'];
    if (json['productAttributesAndVarientIds'] != null) {
      productAttributesAndVarientIds = <ProductAttributesAndVarientIds>[];
      json['productAttributesAndVarientIds'].forEach((v) {
        productAttributesAndVarientIds
            .add(new ProductAttributesAndVarientIds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['isVariableProduct'] = this.isVariableProduct;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['expiryDiscountApplied'] = this.expiryDiscountApplied;
    data['bulkDiscountApplied'] = this.bulkDiscountApplied;
    data['discountedPrice'] = this.discountedPrice;
    data['discountInPercent'] = this.discountInPercent;
    if (this.productAttributesAndVarientIds != null) {
      data['productAttributesAndVarientIds'] = this.productAttributesAndVarientIds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttributesAndVarientIds {
  String producuctAttributeAndVarientId;
  int price;

  ProductAttributesAndVarientIds(
      {this.producuctAttributeAndVarientId, this.price});

  ProductAttributesAndVarientIds.fromJson(Map<String, dynamic> json) {
    producuctAttributeAndVarientId = json['producuctAttributeAndVarientId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['producuctAttributeAndVarientId'] =
        this.producuctAttributeAndVarientId;
    data['price'] = this.price;
    return data;
  }
}
