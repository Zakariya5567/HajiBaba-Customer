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

class GetCustomerByIdViewModel extends GetxController {
  final AddressTypesServices _apiServices = AddressTypesServices();
  LocalData _localData = LocalData();

  bool isLoading = true;
  var profileData;

  var customerAddressData;


  void FetchUserProfileData() async{
    try{
      isLoading = true;
      // print(uid.toString());

      var userid = await _localData.getKeyValueFromShareedPref();
      print('user id in veiwmodel'+userid);
      await _apiServices.fetchUserProfileData(userid).then((value) {
        if (value == false) {
          debugPrint('There was a problem with add Store api....');
        } else {

          profileData = value;
          // isLoading = false;
          // update();
          // Get.offAll(()=>LoginRegistrationScreen()); // it's delete all pages at navigate stack
        }
      });
    }finally{
      // isLoading = false;
      GetCustomerAddresses();
      // update();

    }
  }

  void GetCustomerAddresses() async {
    try {
      // isLoading = true;
      print('bofore ueer iddd..');
      var userid = await _localData.getKeyValueFromShareedPref();
      print('user is id'+ userid);
      var response = await _apiServices.fetchCustomerAddress(userid);
      // print('responseee${response.toString()}');
      print('GetCustomerAddresses1 '+response.toString());
      if (response != null) {

        if(response['data'] != null){

          customerAddressData = response;

          print('GetCustomerAddresses2 '+customerAddressData.toString());

        }
        // Get.snackbar('Address Information', 'Address Updated..');
        // isLoading = false;
        // update();
      }
    }catch(e){
      print('GetCustomerAddresses error '+ e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  void deleteCustomerAddress(String addressId) async {

    var response;

    try {

      isLoading = true;

      update();

      response = await _apiServices.deleteCustomerAddress(addressId);

      print('deleteCustomerAddress '+response.toString());


    }catch(e){

      print('deleteCustomerAddress error '+ e.toString());

    } finally {

      if (response != null) {

        GetCustomerAddresses();

      }

    }

  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FetchUserProfileData();
    // GetCustomerAddresses();
  }
}