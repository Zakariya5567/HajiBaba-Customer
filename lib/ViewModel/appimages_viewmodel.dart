import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppImagesViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading = true;
  int pageViewIndex = 0;
  AppImagesModel imagesSplash2;
  AppImagesModel imagesSplash3;
  AppImagesModel imagesSplash4;
  AppImagesModel trendingBannerImage;
  AppImagesModel firstDashboardDeviderImage;
  AppImagesModel secondDashboardDeviderImage;
  SliderImagesModel primarySliderImages;
  SliderImagesModel secondarySliderImages;
  SliderImagesModel categorySliderImages;
  var addresses;



  void GetSecondSplashImage() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetSecondSplashScreenImg');
      // print('responseee${response.toString()}');
      if (response["data"] != null) {
        imagesSplash2 = AppImagesModel.fromJson(response);
        print(imagesSplash2.data);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }


  void GetThirdSplashImage() async {
    try {
      isLoading = true;
        var response = await ApiServices.fetchAppImages('GetThirdSplashScreenImg');
      if (response["data"] != null) {
        imagesSplash3 = AppImagesModel.fromJson(response);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }
  void GetFourthSplashImage() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetFourthScreenImg');
      if (response["data"] != null) {
        imagesSplash4 = AppImagesModel.fromJson(response);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }
  void GetTrendingBannerImg() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetTrendingBannerImg');
      if (response != null) {
        trendingBannerImage = AppImagesModel.fromJson(response);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }
  void GetFirstDashboardDividerImg() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetFirstDashboardDividerImg');
      if (response != null) {
        firstDashboardDeviderImage = AppImagesModel.fromJson(response);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }
  void GetSecondDashboardDividerImg() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetSecondDashboardDividerImg');
      if (response != null) {
        secondDashboardDeviderImage = AppImagesModel.fromJson(response);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }
  void GetPrimarySliderImgs() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetPrimarySliderImgs');
      if (response != null) {
        primarySliderImages = SliderImagesModel.fromJson(response);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }
  void GetSecondarySliderImgs() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetPrimarySliderImgs');
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
  void GetCategorySliderImgs() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetCategorySliderImgs');
      if (response["data"] != null) {
        categorySliderImages = SliderImagesModel.fromJson(response);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }
  void GetCustomerAddresses() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetCustomerAddress?Id=f6292a69-88c1-4549-839d-b4738241cff3');
      if (response["data"] != null) {
        addresses=response;
        // categorySliderImages = SliderImagesModel.fromJson(response);
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
    GetSecondSplashImage();
    GetThirdSplashImage();
    GetFourthSplashImage();
    GetTrendingBannerImg();
    GetFirstDashboardDividerImg();
    GetSecondDashboardDividerImg();
    GetPrimarySliderImgs();
    GetSecondarySliderImgs();
    GetCategorySliderImgs();
    GetCustomerAddresses();
  }
}