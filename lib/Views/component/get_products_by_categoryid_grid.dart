import 'package:baba/ViewModel/get_products_by_categoryid_viewmodel.dart';
import 'package:baba/ViewModel/get_today_offer_products_viewmodel.dart';
import 'package:baba/Views/component/products_gridview.dart';
import 'package:baba/Views/screens/product_detail_screen.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


var TodayOfferImges = [Assets.TodayOffer,Assets.TodayBG1,Assets.TodayBG2,Assets.TodayBG3];

Widget GetProductsByCategoryId(){
  return GetBuilder<GetProductsByCategoryIdViewModel>( // specify type as Controller
    init: GetProductsByCategoryIdViewModel(), // intialize with the Controller
    builder: (value) => ProductsGridView(value: value,),
  );

}

Widget buildTodayOfferSliderShimmer() =>
    Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomWidget.rectangular(height: 500.h, width: 358.w)
    );
