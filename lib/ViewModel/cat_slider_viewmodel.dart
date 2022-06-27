


import 'package:baba/Core/ModelClasses/sliderImagesModel.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:get/get.dart';

class CatSliderViewModel extends GetxController {
  // final ApiServices _apiServices = ApiServices();
  bool isLoading = true;

  SliderImagesModel primarySliderImages;

  void getCatSliderImgs() async {
    try {
      isLoading = true;
      var response = await ApiServices.fetchAppImages('GetCategorySliderImgs');
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


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCatSliderImgs();

  }
}