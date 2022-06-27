import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingImagesViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading1 = true;
  bool isLoading2 = true;
  int pageViewIndex=0;
  AppImagesModel imagesSplash2;
  AppImagesModel imagesSplash3;



  void GetSecondSplashImage() async {
    try {
      isLoading1 = true;
      var response = await ApiServices.fetchAppImages('GetSecondSplashScreenImg');
      // print('responseee${response.toString()}');
      if (response["data"] != null) {
        imagesSplash2 = AppImagesModel.fromJson(response);
        print(imagesSplash2.data);
        isLoading1 = false;
        update();
      }
    } finally {
      isLoading1 = false;
      update();
    }
  }
  void GetThirdSplashImage() async {
    try {
      isLoading2 = true;
      var response = await ApiServices.fetchAppImages('GetThirdSplashScreenImg');
      if (response["data"] != null) {
        imagesSplash3 = AppImagesModel.fromJson(response);
        isLoading2 = false;
        update();
      }
    } finally {
      isLoading2 = false;
      update();
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetSecondSplashImage();
    GetThirdSplashImage();
  }
}