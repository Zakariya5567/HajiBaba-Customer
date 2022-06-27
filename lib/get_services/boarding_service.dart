

import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingService extends GetxService{


  final boardingImg2 = AppImagesModel().obs;

  final boardingImg3 = AppImagesModel().obs;

  final loading = false.obs;


  Future<BoardingService> init() async {

    await getSecondSplashImage();

    return this;

  }


  Future<void> getSecondSplashImage() async {

    loading.value = true;

    try {

      final response = await ApiServices.fetchAppImages('GetSecondSplashScreenImg');

      if (response["data"] != null) {

        boardingImg2.value = AppImagesModel.fromJson(response);

        Get.log(boardingImg2.value.data);

      }

    } catch(e) {

      Get.log(e.toString(),isError: true);

    } finally {

      await getThirdSplashImage();

    }

  }

  Future<void> getThirdSplashImage() async {

    try {

      final response = await ApiServices.fetchAppImages('GetThirdSplashScreenImg');

      if (response["data"] != null) {

        boardingImg3.value = AppImagesModel.fromJson(response);

        Get.log(boardingImg3.value.data);

      }

    } catch(e) {

      Get.log(e.toString(),isError: true);

    } finally {

      loading.value = false;

    }
  }

}