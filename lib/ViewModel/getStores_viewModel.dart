import 'package:baba/Core/ModelClasses/AppImagesModel.dart';
import 'package:baba/Core/ModelClasses/StoresDataMadel.dart';
import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/StoresData_Service.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/ViewModel/get_customer_storebyid.dart';
import 'package:baba/ViewModel/get_search_store_model.dart';
import 'package:baba/Views/component/customerfullScreenDialoag.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoresDataViewModel extends GetxController {

   final StoresDataServices _apiServices = StoresDataServices();

   TextEditingController selectStoreController = TextEditingController();

  bool isLoading = true;
  int pageViewIndex = 0;
  AllStoresDataModel storesData;

  int l;

  SearchStoresDataModel searchStoresDataModel;

  List searchStoreList=[];

  String searchText;

   onSearchTextChanged(String text)async {
     update();
    searchText=text;
    print(text);
    getSearchStoresData();
    // GeStoresData();
    print("onChanged");

   }

   void getSearchStoresData() async {
     update();
     try {
       print("searching view");
        // isLoading = true;
       var response = await _apiServices.fetchSearchStoresData(searchText);
       // print('responseee${response.toString()}');
       if (response["message"] =="Found") {
         searchStoresDataModel =  SearchStoresDataModel.fromJson(response);

         searchStoreList=searchStoresDataModel.data.toList();

         print("the lenght is of search is ${searchStoresDataModel.data.length}");
         // isLoading = false;
         update();

       }
     } finally {
        // isLoading = false;
       update();

     }
   }


  void GeStoresData() async {

    try {
      isLoading = true;
      var response = await _apiServices.fetchStoresData('GetStores');
      // print('responseee${response.toString()}');
      if (response["message"] =="Found") {
        storesData = await AllStoresDataModel.fromJson(response);
        print("stores is             ${storesData.data.toString()}");
        // List data=storesData.data;
        // listSearchStore=data.toList();
        isLoading = false;
        update();

      }
    } finally {
      isLoading = false;
      update();

    }
  }

   void addStore(String uid, String storeId, {bool isDashboard = false}) {
     print(uid.toString());
     _apiServices.addStore(uid,storeId).then((value) {
       if (value == false) {
         debugPrint('There was a problem with add Store api....');
       } else {
         update();
         CustomFullScreenDialog.cancelDialog();
         if(!isDashboard){
           Get.offAll(()=>BottomNavBar());
         }else{

           Get.find<GetCustomerStoreByIdViewModel>().FetchUserStoreData();

           Get.back();
         }
        // it's delete all pages at navigate stack
       }
     });
   }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GeStoresData();

  }
}