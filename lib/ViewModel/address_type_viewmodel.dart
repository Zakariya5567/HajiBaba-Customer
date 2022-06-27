import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/StoresDataMadel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/StoresData_Service.dart';
import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/Views/screens/deliveryaddress_screen.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_customer_by_id_viewmodel.dart';

class AddressTypeViewModel extends GetxController {
  final AddressTypesServices _apiServices = AddressTypesServices();
  // TextEditingController addressTypeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  final LocalData _localData = LocalData();

  bool isLoading = true;
  int pageViewIndex=0;
  var addressTypesData;

  String dropdownValue = 'Select Address Type';

  List<String> addressTypes = [];




  void GetAddressTypes() async {
    try {
      isLoading = true;
      var response = await _apiServices.fetchAddressTypes('/GetCustomerAddresTypes');
      print('responseee${response.toString()}');

      if (response['data']!=null) {
        addressTypesData = response;
        addressTypes.add('Select Address Type');
        // storesData = await AllStoresDataModel.fromJson(response);
        // print(storesData.data[0].address.toString());
        for(int d=0;d<addressTypesData['data'].length;d++){
          addressTypes.add(addressTypesData['data'][d]['typeName'].toString());
          // addressTypes.add(addressTypesData['data'][d]['product_name'].toString());

        }

        dropdownValue = addressTypes.first;

        isLoading = false;

        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }


  void addAddress(String addressType,String navFrom) async{
    // print(uid.toString());

    try{

      isLoading = true;

      update();

      var userid = await _localData.getKeyValueFromShareedPref();

      print('user id in veiwmodel'+userid);

      int typeId;

      for(int i = 0; i<addressTypesData['data'].length; i++){

        if(addressTypesData['data'][i]['typeName'] == addressType){

          typeId = addressTypesData['data'][i]['typeId'];

          break;

        }

      }

      await _apiServices.addAddress(typeId,addressController.text,streetController.text,codeController.text,cityController.text,countryController.text,userid.toString()).then((value) {

        if (value == false) {

          debugPrint('There was a problem with add Store api....');

        } else {

          if(value['data'] == null){

            Get.snackbar("Error", "${value['data']['message']}");

          }else{

            if(navFrom == "Cart"){

              Get.find<DeliveryAddressController>().getCustomerAddresses();

              Get.back();

            }else{

              Get.find<GetCustomerByIdViewModel>().GetCustomerAddresses();

              Get.back();

            }


          }

          // Get.offAll(()=>LoginRegistrationScreen()); // it's delete all pages at navigate stack

        }
      });

    }catch(e){

      print("addAddress Error: $e");

    }finally {

      isLoading = false;

      update();
    }

  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    GetAddressTypes();

  }
}