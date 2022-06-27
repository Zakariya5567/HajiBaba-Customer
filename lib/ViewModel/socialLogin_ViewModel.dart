import 'dart:convert';

import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/StoresDataMadel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/StoresData_Service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/Core/Services/socialLogin_service.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialLoginViewModel extends GetxController {
  final SocialLoginServices _apiServices = SocialLoginServices();
  TextEditingController selectStoreController = TextEditingController();
  bool isLoading = true;
  int pageViewIndex=0;
  AllStoresDataModel storesData;
  var responseData;
  int issocial;





  Future socialLogin(String soialId) async{
    print(soialId.toString());
    await _apiServices.socialLogin(soialId).then((value) {
      if (value == false) {
        debugPrint('There was a problem with add Store api....');
      } else {
        responseData = value;
        print('response in controller class'+ responseData.toString());


        if(responseData["data"]!=null){
          issocial=1;
          update();
        }
        else
          {
            issocial=0;
            update();
          }
        // Get.offAll(()=>LoginRegistrationScreen()); // it's delete all pages at navigate stack
      }
    });
  }



}