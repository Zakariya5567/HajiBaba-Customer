import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/GetProductCategoriesModel.dart';
import 'package:baba/Core/ModelClasses/products_model.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/get_api_data_service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetProductsByCategoryIdViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading = true;

   // GetTodayOfferProductsModel productCategoriesByIdData;

  ProductsModel productsModel;

  Future getProductsByCategoryId(String productId) async {
    print('id in viewmodell'+ productId.toString());
    try {
      isLoading = true;
      var response = await GetApiDataServices.fetchApiData('GetProductsByCategoryId?CategoryId=${productId}');
      print('responseee cate by id${response.toString()}');
      if (response!= null && response['data'] != null) {
        productsModel = ProductsModel.fromJson(response);

        isLoading = false;
        update();
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

        getProductsByCategoryId(productId);

      }
    }catch(e){

      Get.log("$e",isError: true);

    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // GetProductCategories();
  }
}