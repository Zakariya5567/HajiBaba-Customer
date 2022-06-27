import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/GetProductCategoriesModel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/get_api_data_service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetProductCategoriesViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading = true;

  GetProductCategoriesModel productCategoriesData;


  void getProductCategories() async {
    try {
      isLoading = true;
      var response = await GetApiDataServices.fetchApiData('GetProductCategories');
      // print('responseee${response.toString()}');
      if (response!= null) {
        productCategoriesData = GetProductCategoriesModel.fromJson(response);
        print("productCategoriesData.data : ${productCategoriesData.data}");
      }
    } finally {
      isLoading = false;
      update();
    }
  }


  @override
  void onInit() {
    getProductCategories();
    // TODO: implement onInit
    super.onInit();

  }
}