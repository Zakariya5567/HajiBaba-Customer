

import 'package:baba/ViewModel/appimages_viewmodel.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppImagesViewModel>(() => AppImagesViewModel());
  }
}