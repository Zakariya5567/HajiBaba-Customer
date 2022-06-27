import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondaryySliderViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading = true;

  SliderImagesModel secondarySliderImages;

  void GetSecondarySliderImgs() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetSecondarySliderImgs');
      if (response != null) {
        secondarySliderImages = SliderImagesModel.fromJson(response);
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

    GetSecondarySliderImgs();

  }
}