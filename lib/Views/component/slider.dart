import 'package:baba/ViewModel/appimages_viewmodel.dart';
import 'package:baba/ViewModel/cat_slider_viewmodel.dart';
import 'package:baba/ViewModel/get_product_categories_viewmodel.dart';
import 'package:baba/ViewModel/get_products_by_categoryid_viewmodel.dart';
import 'package:baba/ViewModel/primarySlider_ViewModel.dart';
import 'package:baba/ViewModel/secondarySlider_ViewModel.dart';
import 'package:baba/Views/screens/selected_category_screen.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

var sliderImges = [Assets.SliderImg1,Assets.SliderImg2];

Widget slider()=>SizedBox(
  height: 210.h,
  child: GetBuilder<PrimarySliderViewModel>( // specify type as Controller
     init: PrimarySliderViewModel(), // intialize with the Controller
    builder: (value) =>value.isLoading?
    CustomWidget.rectangular(height: 100.h, width: 360.w): Container(
      width: double.infinity,
      // height: 100.0,
      margin: EdgeInsets.only(
          bottom: 0,
          // top: kToolbarHeight * 1.4,
          top: 0,
          right: 0,
          left: 0),
      // child: CarouselWithIndicator(),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          aspectRatio: 2.0,
        ),
        items: value.primarySliderImages.data.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                height: 250.h,
                // width: 340.w,
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: i.serverName,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => CustomWidget.rectangular(height: 170.h, width: 250.w),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ]),
                ),
              );
            },
          );
        }).toList(),
      ),
    )
    //     ListView.builder(
    //   physics: ScrollPhysics(),
    //   shrinkWrap: true,
    //   scrollDirection: Axis.horizontal,
    //   itemCount: value.primarySliderImages.data.length,
    //   itemBuilder: (BuildContext context, int index) => Container(
    //     height: 170.h,
    //     width: 340.w,
    //     margin: EdgeInsets.only(left: 5.w),
    //     child: CachedNetworkImage(
    //       fit: BoxFit.fill,
    //       imageUrl: "${value.primarySliderImages.data[index].serverName}",
    //       // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    //       errorWidget: (context, url, error) => Icon(Icons.error),
    //     ),
    //     // decoration: BoxDecoration(
    //     //     color: Colors.transparent,
    //     //     image: DecorationImage(
    //     //       image: AssetImage(sliderImges[index]),
    //     //       fit: BoxFit.fill,
    //     //       alignment: Alignment.topCenter,
    //     //     ),
    //     //     // border: Border.all(
    //     //     //   color: Colors.red[500],
    //     //     // ),
    //     //     borderRadius: BorderRadius.all(Radius.circular(10))
    //     // ),
    //     // child: Image.asset(
    //     //   sliderImges[index],
    //     //   fit: BoxFit.fill,
    //     // ),
    //   ),
    // ),
  ),

);

Widget catSlider2()=>SizedBox(
  height: 210.h,
  child: GetBuilder<CatSliderViewModel>( // specify type as Controller
     init: CatSliderViewModel(), // intialize with the Controller
    builder: (value) =>value.isLoading? CustomWidget.rectangular(height: 100.h, width: 360.w): Container(
      width: double.infinity,
      // height: 100.0,
      margin: EdgeInsets.only(
          bottom: 0,
          // top: kToolbarHeight * 1.4,
          top: 0,
          right: 0,
          left: 0),
      // child: CarouselWithIndicator(),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          aspectRatio: 2.0,
        ),
        items: value.primarySliderImages.data.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                height: 250.h,
                // width: 340.w,
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: i.serverName,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => CustomWidget.rectangular(height: 170.h, width: 250.w),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ]),
                ),
              );
            },
          );
        }).toList(),
      ),
    )
    //     ListView.builder(
    //   physics: ScrollPhysics(),
    //   shrinkWrap: true,
    //   scrollDirection: Axis.horizontal,
    //   itemCount: value.primarySliderImages.data.length,
    //   itemBuilder: (BuildContext context, int index) => Container(
    //     height: 170.h,
    //     width: 340.w,
    //     margin: EdgeInsets.only(left: 5.w),
    //     child: CachedNetworkImage(
    //       fit: BoxFit.fill,
    //       imageUrl: "${value.primarySliderImages.data[index].serverName}",
    //       // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    //       errorWidget: (context, url, error) => Icon(Icons.error),
    //     ),
    //     // decoration: BoxDecoration(
    //     //     color: Colors.transparent,
    //     //     image: DecorationImage(
    //     //       image: AssetImage(sliderImges[index]),
    //     //       fit: BoxFit.fill,
    //     //       alignment: Alignment.topCenter,
    //     //     ),
    //     //     // border: Border.all(
    //     //     //   color: Colors.red[500],
    //     //     // ),
    //     //     borderRadius: BorderRadius.all(Radius.circular(10))
    //     // ),
    //     // child: Image.asset(
    //     //   sliderImges[index],
    //     //   fit: BoxFit.fill,
    //     // ),
    //   ),
    // ),
  ),

);

Widget slider2()=>SizedBox(
  height: 170.h,
  child: GetBuilder<SecondaryySliderViewModel>( // specify type as Controller
    init: SecondaryySliderViewModel(), // intialize with the Controller
    builder: (value) =>value.isLoading? CustomWidget.rectangular(height: 100.h, width: 360.w): ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: value.secondarySliderImages.data.length,
      itemBuilder: (BuildContext context, int index) => Container(
        height: 125.h,
        width: 340.w,
        margin: EdgeInsets.only(left: 5.w),
        // decoration: const BoxDecoration(
        //   color: Colors.transparent,
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: "${value.secondarySliderImages.data[index].serverName}",
            placeholder: (context, url) => CustomWidget.rectangular(height: 170.h, width: 250.w),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    ),
  )

);

var CatSliderImges = [Assets.TodayOffer,Assets.TodayBG1,Assets.TodayBG2,Assets.TodayBG3,Assets.MostTrending,Assets.TrendingBG1,Assets.TrendingBG2,Assets.TrendingBG3];
GetProductsByCategoryIdViewModel _byCategoryIdViewModel = Get.put(GetProductsByCategoryIdViewModel());

Widget catSlider()=>SizedBox(
  height: 160.h,
  child:
  GetBuilder<GetProductCategoriesViewModel>( // specify type as Controller
     init: GetProductCategoriesViewModel(), // intialize with the Controller
    builder: (value)
    => ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: value.isLoading? 5: value.productCategoriesData.data.length,
      itemBuilder: (BuildContext context, int index) {
        if (value.isLoading) {
          return buildCatSliderShimmer();
        } else {
          return SizedBox(
            width: 80.w,
            height: 90.h,
            child: InkWell(
              onTap: ()async{
                print('id in slider'+ value.productCategoriesData.data[index].categoryName.toString());
                await _byCategoryIdViewModel.getProductsByCategoryId(value.productCategoriesData.data[index].id.toString());

                Get.to(()=>selectedCategory(
                    title:value.productCategoriesData
                        .data[index].categoryName.toString()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ClipOval(
                    child: CachedNetworkImage(
                      height: 64,
                      width: 64,
                      fit: BoxFit.fill,
                      imageUrl: "${value.productCategoriesData.data[index].imgUrl}",
                      placeholder: (context, url) => Center(child: CustomWidget.circular(height: 64.h, width: 64.w)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),

                  Text(
                    "${value.productCategoriesData.data[index].categoryName}",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Constant.darkBlueColor,
                      fontWeight: FontWeight.w700,
                      height: 1.92.h,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

      },
    ),
  )

);
Widget buildCatSliderShimmer() =>
    SizedBox(
      width: 80.w,
      height: 90.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CustomWidget.circular(height: 64.h, width: 64.w),
          CustomWidget.rectangular(height: 20.h, width: 100.w),
        ],
      ),
    );