
import 'package:baba/ViewModel/get_product_categories_viewmodel.dart';
import 'package:baba/ViewModel/get_products_by_categoryid_viewmodel.dart';
import 'package:baba/Views/screens/selected_category_screen.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
GetProductsByCategoryIdViewModel _byCategoryIdViewModel = Get.put(GetProductsByCategoryIdViewModel());
Widget categoriesGrid(){
  return Container(
    child: GetBuilder<GetProductCategoriesViewModel>( // specify type as Controller
      init: GetProductCategoriesViewModel(), // intialize with the Controller
      builder: (value) => GridView.count(
          // padding: EdgeInsets.only(top: 5),
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 1,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(
            value.isLoading && value.productCategoriesData?.data == null ? 0 : value.productCategoriesData.data.length,
                (index) {
              return  Stack(

                fit: StackFit.expand,

                children: [

                  InkWell(

                      onTap: ()async{
                        Get.to(()=>selectedCategory(title:value.productCategoriesData.data[index].categoryName.toString()));
                        await _byCategoryIdViewModel.getProductsByCategoryId(value.productCategoriesData.data[index].id.toString());
                      },
                      child: Container(

                        margin: EdgeInsets.all(1.0),

                        color: Colors.white,

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            children: [

                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: SizedBox(
                                  width: 180.w,
                                  height: 190.h,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: value.productCategoriesData?.data != null ? value.productCategoriesData?.data[index]?.imgUrl : "",
                                    placeholder: (context, url) => CustomWidget.rectangular(height: 170.h, width: 180.w),
                                    errorWidget: (context, url, error) => Icon(Icons.error),

                                  ),
                                ),
                              ),

                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    height: 30,
                                    margin: const EdgeInsets.only(bottom: 0.5,),
                                    decoration: const BoxDecoration(
                                      
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset.zero,
                                          blurRadius: 10.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],

                                    ),

                                  )
                              )

                            ],
                          )
                        ),
                      )
                    // Container(
                    //   child: Image.asset(
                    //     TodayOfferImges[index],
                    //     width: 180.w,
                    //     fit: BoxFit.fitWidth,
                    //   ),
                    // ),
                  ),

                  // Positioned(
                  //   width: 180.w,
                  //   height: 40.h,
                  //   bottom: 20,
                  //
                  //   child: Container(
                  //
                  //     // padding: const EdgeInsets.all(20.0),
                  //
                  //     margin: EdgeInsets.only(
                  //         bottom: 30,
                  //         right: 50,
                  //         left: 10,
                  //     ),
                  //
                  //     decoration: const BoxDecoration(
                  //
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black,
                  //           offset: Offset(20.0, 20.0),
                  //           blurRadius: 25.0,
                  //           spreadRadius: 20.0,
                  //         ),
                  //       ],
                  //
                  //     ),
                  //   ),
                  // ),

                  Positioned(
                      bottom: 20.h,
                      left: 0.w,
                      right: 0.w,
                      child:  Center(
                        child: InkWell(
                          onTap: ()async{
                            Get.to(()=>selectedCategory(title:value.productCategoriesData.data[index].categoryName.toString()));
                            await _byCategoryIdViewModel.getProductsByCategoryId(value.productCategoriesData.data[index].id.toString());
                          },
                          child: Container(
                            alignment: Alignment(0.01, 0.09),
                            width: 100.w,
                            height: 26.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(3.0),
                            //   color: Constant.mainOrangeColor,
                            // ),
                            child: Text(
                              '${value.productCategoriesData.data[index].categoryName}',
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                                color: Constant.greyColor,
                                // height: 2.5,
                              ),
                            ),
                          ),
                        ),

                      )),

                ],
              );
            },
          )),
    ),

  );
}