import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/GetProductCategoriesModel.dart';
import 'package:baba/Core/ModelClasses/products_model.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/get_api_data_service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetTodayOfferProductsViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading = true;

  ProductsModel productsModel;


  void GetTodayOfferProducts() async {
    try {
      isLoading = true;
      var response = await GetApiDataServices.fetchApiData('GetTodayOfferProducts');
       print('today offer ....responseee${response.toString()}');
      if (response['data'] != null) {
        productsModel = ProductsModel.fromJson(response);
        print(productsModel.data);
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  Future addCustomerFvtProduct(String productId) async {

    final LocalData _localData = LocalData();

    try {

      final userId = await _localData.getKeyValueFromShareedPref();

      Map<String,dynamic> body = {
        "customerId" : userId,
        "productId" : productId
      };

      var response = await GetApiDataServices.postApiData('AddCustomerFvtProduct',body);

      if (response != null) {

        GetTodayOfferProducts();

      }
    }catch(e){

      Get.log("$e",isError: true);

    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetTodayOfferProducts();
  }
}