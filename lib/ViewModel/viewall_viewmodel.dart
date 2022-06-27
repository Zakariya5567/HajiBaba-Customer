
import 'package:baba/Core/ModelClasses/products_model.dart';
import 'package:baba/Core/Services/get_api_data_service.dart';
import 'package:baba/utils/constant.dart';
import 'package:get/get.dart';

class GetViewAllViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading = true;

  ProductsModel productsModel;
  var response;

  String mEndpoint;


  void getViewAll(String endpoint) async {
    try {
      mEndpoint = endpoint;
      isLoading = true;
      response = await GetApiDataServices.fetchApiData('$endpoint');
      print('responseee${response.toString()}');
      if (response["data"] != null) {
        productsModel = ProductsModel.fromJson(response);
        // print(viewAddData.data);
        isLoading = false;
        update();
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  Future addCustomerFvtProduct(String productId) async {

    final LocalData _localData = LocalData();

    try {

      final userId = await _localData.getKeyValueFromShareedPref();

      Map<String,dynamic> body = {
        "customerId" : userId,
        "productId" : productId
      };

      var response = await GetApiDataServices.postApiData('AddCustomerFvtProduct',body);

      if (response != null) {

        if(mEndpoint != null){

          getViewAll(mEndpoint);

        }

      }
    }catch(e){

      Get.log("$e",isError: true);

    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // GetProductCategories();
  }
}