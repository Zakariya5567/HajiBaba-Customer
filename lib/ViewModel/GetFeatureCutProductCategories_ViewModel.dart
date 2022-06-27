import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/GetFeatureCutProductCategoriesModel.dart';
import 'package:baba/Core/ModelClasses/GetProductCategoriesModel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/get_api_data_service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetFeatureCutProductCategoriesViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading = true;

  GetFeatureCutProductCategoriesModel featureCutCategoriesData;


  void GetFeatureCutProductCategories() async {
    try {
      isLoading = true;
      var response = await GetApiDataServices.fetchApiData('GetFeatureCutProductCategories');
      // print('responseee${response.toString()}');
      if (response["data"] != null) {
        featureCutCategoriesData = GetFeatureCutProductCategoriesModel.fromJson(response);
        print(featureCutCategoriesData.data);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetFeatureCutProductCategories();
  }
}