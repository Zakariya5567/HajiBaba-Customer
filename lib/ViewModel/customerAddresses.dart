import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/StoresDataMadel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/StoresData_Service.dart';
import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerAddressesViewModel extends GetxController {
  final AddressTypesServices _apiServices = AddressTypesServices();
  final LocalData _localData = LocalData();
  
  bool isLoading = true;
  int pageViewIndex=0;
  var customerAddressData;

  String dropdownValue = 'Select Address Type';
  List<String> addressTypes = [];




  void GetCustomerAddresses() async {
    try {
      isLoading = true;
      print('bofore ueer iddd..');
      var userid = await _localData.getKeyValueFromShareedPref();
      print('user is id'+ userid);
      var response = await _apiServices.fetchCustomerAddress(userid);
      // print('responseee${response.toString()}');
      if (response['data']!=null) {
        customerAddressData = response;
        print('responsen in viewmodel '+customerAddressData.toString());
        Get.snackbar('Address Information', 'Address Updated..');
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
    GetCustomerAddresses();

  }
}