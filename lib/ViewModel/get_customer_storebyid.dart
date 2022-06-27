import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/StoresDataMadel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/get_api_data_service.dart';
import 'package:baba/Core/Services/StoresData_Service.dart';
import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetCustomerStoreByIdViewModel extends GetxController {

  final AddressTypesServices _apiServices = AddressTypesServices();

  LocalData _localData = LocalData();

  bool isLoading = true;
  var storeData;
  var customerAddressData;

  void FetchUserStoreData() async{
    try {
      isLoading = true;
      var userid = await _localData.getKeyValueFromShareedPref();
       var response = await GetApiDataServices.fetchApiData('GetCustomerStore?Id=${userid}');
      print('store data ....responseee${response.toString()}');
      if (response['data'] != null) {
        storeData = response;
        // todayOfferProductsData = GetTodayOfferProductsModel.fromJson(response);
        print(storeData.toString());
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
    FetchUserStoreData();
  }
}