import 'package:baba/ViewModel/GetFeatureCutProductCategories_ViewModel.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../ViewModel/get_product_categories_viewmodel.dart';
import '../screens/selected_category_screen.dart';
var FeatureImges = [Assets.FeatureCuts1,Assets.FeatureCuts2,Assets.FeatureCuts3,Assets.FeatureCuts4];
Widget featuredGrid(){
  return GetBuilder<GetFeatureCutProductCategoriesViewModel>( // specify type as Controller
    init: GetFeatureCutProductCategoriesViewModel(), // intialize with the Controller
    builder: (value) => GridView.count(
        padding: EdgeInsets.only(top: 12.w,left: 12.w,right: 5.h),
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 1,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(

            value.isLoading? 4: value.featureCutCategoriesData.data.length,
              
              (index) {

                if (value.isLoading) {

                  return buildFeatureCutSliderShimmer();

                } else {

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child:
                    GetBuilder<GetProductCategoriesViewModel>( // specify type as Controller
                        init: GetProductCategoriesViewModel(), // intialize with the Controller
                        builder: (controller)
                      {
                        return
                          InkWell(
                          onTap: (){
                            Get.to(()=>selectedCategory(
                                title:controller.productCategoriesData
                                    .data[index].categoryName.toString()));
                          },
                          child: Container(
                            // width: 358.w,
                            // height: 110.34.h,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(value.featureCutCategoriesData.data[index].imgUrl.toString(),),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  );

                }
          },
        ))
  );
}

Widget buildFeatureCutSliderShimmer() =>
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomWidget.rectangular(height: 110.h, width: 358.w)
    );