import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/ViewModel/appimages_viewmodel.dart';
import 'package:baba/ViewModel/viewall_viewmodel.dart';
import 'package:baba/Views/component/dashboard_drawer.dart';
import 'package:baba/Views/component/dashboard_header.dart';
import 'package:baba/Views/component/featured_grid.dart';
import 'package:baba/Views/component/heading.dart';
import 'package:baba/Views/component/most_trending_grid.dart';
import 'package:baba/Views/component/slider.dart';
import 'package:baba/Views/component/today_offer_grid.dart';
import 'package:baba/Views/screens/categories_screen.dart';
import 'package:baba/Views/screens/selected_category_screen.dart';
import 'package:baba/Views/screens/viewall_screen.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  GetViewAllViewModel _viewAllViewModel = Get.put(GetViewAllViewModel());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: DashboardScreen.scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.h),
          child: const DashboardHeader(),
        ),
        drawer: const DashboardDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 70.h,
                margin: const EdgeInsets.only(top: 5.0,right: 5.0,left: 5.0),
                padding: EdgeInsets.zero,
                child: GetBuilder<AppImagesViewModel>( // specify type as Controller
                    // init: AppImagesViewModel(), // intialize with the Controller
                    builder: (value) {
                      // value.GetFirstDashboardDividerImg();
                      return value.isLoading?Center(child: CircularProgressIndicator()):CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: "${value?.trendingBannerImage?.data}",
                        placeholder: (context, url) => CustomWidget.rectangular(height: 50.h, width: 350.w),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      );
                    }
                ),
          //       Row(
          //         children: [
          //           SvgPicture.asset(
          //               Assets.Tap,
          //               // semanticsLabel: 'Acme Logo'
          //           ),
          // Padding(
          //   padding: EdgeInsets.only(left: 10.w),
          //   child: SizedBox(
          //     width: 242.0,
          //     height: 49.0,
          //     child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           Text(
          //             'Tap and Collect',
          //             style: GoogleFonts.poppins(
          //               fontSize: 24.0,
          //               color: Constant.greenColor,
          //               fontWeight: FontWeight.w700,
          //               height: 0.96,
          //             ),
          //             textAlign: TextAlign.center,
          //           ),
          //           Expanded(
          //             child: Text.rich(
          //               TextSpan(
          //                 style: GoogleFonts.poppins(
          //                   fontSize: 10.0,
          //                   color: Constant.darkBlueColor,
          //                   height: 2.3,
          //                 ),
          //                 children: [
          //                   TextSpan(
          //                     text: 'Shop online and pick up your nearest',
          //                   ),
          //                   TextSpan(
          //                     text: ' ASDA',
          //                     style: GoogleFonts.poppins(
          //                       color: Constant.greenColor,
          //                     ),
          //                   ),
          //                   TextSpan(
          //                     text: 'store',
          //                   ),
          //                 ],
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //         ],
          //     ),
          //   ),
          // ),
          //         ],
          //       ),
              ),
              slider(),
              getHeading('Shop By Category',(){
                Get.to(()=>CategoriesScreen());
              }),
              catSlider(),
              slider2(),
              getHeading('Today\'s Offers For You',()async{
                Get.to(()=>ViewAllScreen(title: 'Today\'s Offers For You'));
                _viewAllViewModel.getViewAll('GetAllTodayOfferProducts');

              }),
              todayOfferGrid(),
              // Divider(thickness: 3,color: Constant.mainOrangeColor,),
              GetBuilder<AppImagesViewModel>( // specify type as Controller
                // init: AppImagesViewModel(), // intialize with the Controller
                builder: (value) {
                  // value.GetFirstDashboardDividerImg();
                  return value.isLoading?Center(child: CircularProgressIndicator()):Container(
                    width: 326.w,
                    height: 140.h,

                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: "${value?.firstDashboardDeviderImage?.data}",
                      // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage(Assets.FreshBanner),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                  );
                }
              ),

              // Divider(thickness: 3,color: Constant.mainOrangeColor,),
              getHeading('Most Trending Items', ()async{
                Get.to(()=>ViewAllScreen(title: 'Most Trending Items'));
                _viewAllViewModel.getViewAll('GetAllMostTrendingProducts');

              }),
              mostTrendingGrid(),

              GetBuilder<AppImagesViewModel>( // no need to initialize Controller ever again, just mention the type
                builder: (value) {
                  // value.GetSecondDashboardDividerImg();
                  return value.isLoading?Center(child: CircularProgressIndicator()):Container(
                    width: 358.w,
                    height: 110.34.h,
                    child:ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: "${value?.secondDashboardDeviderImage?.data}",
                        // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage(Assets.ShopBanner),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                  );
                }
              ),

              getHeading('Featured Cuts', (){

                Get.to(()=>CategoriesScreen());

                // Get.to(()=>ViewAllScreen(title: 'Featured Cuts'));
                // _viewAllViewModel.getViewAll('GetAllTodayOfferProducts');

              }),
              featuredGrid(),

              GetBuilder<CustomerReview>(

                  init: CustomerReview(),

                  builder: (controller){

                    if(controller.isLoading){

                      return CustomWidget.rectangular(height: 122.h, width: 340.w);

                    }

                    if(controller.customerReview != null && controller.customerReview['data'] != null){

                      return Column(

                        children: [

                          getHeading('Let Our Customers Do The Talking', (){}),

                          SingleChildScrollView(

                            scrollDirection: Axis.horizontal,

                            child: Row(

                              children: [

                                for(int i = 0; i < controller.customerReview['data'].length; i++)

                                  Container(
                                    width: 300..w,
                                    height: 122.h,
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Constant.greyColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                controller.customerReview['data'][i]['customerName'],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12.0,
                                                  color: Constant.darkBlueColor,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.92,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),

                                              const SizedBox(width: 5,),

                                              RatingBar.builder(
                                                initialRating: controller.customerReview['data'][i]['start'].toDouble(),
                                                minRating: 0,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                ignoreGestures: true,
                                                itemCount: 5,
                                                itemSize: 15,
                                                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                                itemBuilder: (context, _) => const Icon(
                                                  Icons.star,
                                                  color: Constant.primaryColor,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                controller.customerReview['data'][i]['review'],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 9.0,
                                                  color: Constant.darkBlueColor,
                                                  height: 1.89,
                                                ),
                                              )
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.end,
                                          //   children: [
                                          //   Text(
                                          //   'Posted 1 Month Ago',
                                          //   style: GoogleFonts.poppins(
                                          //     fontSize: 8.0,
                                          //     color: Constant.greyColor,
                                          //     // height: 2.13,
                                          //   ),
                                          // )
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                  )

                              ],

                            ),
                          ),



                        ],

                      );

                    }

                    return Container();

                  }

              ),

              SizedBox(height: 20.h,)


            ],
          ),
        )
        );
  }

}


class CustomerReview extends GetxController{

  bool isLoading = true;

  var customerReview;

  void getCustomerReview() async {

    try {

      var response = await ApiServices.fetchAppImages('GetDashboardCustomerReviews');

      if (response != null) {

        customerReview = response;

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

    getCustomerReview();

  }

}
