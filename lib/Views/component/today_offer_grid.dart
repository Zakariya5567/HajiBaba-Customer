import 'package:baba/Core/ModelClasses/products_model.dart';
import 'package:baba/ViewModel/get_today_offer_products_viewmodel.dart';
import 'package:baba/Views/component/products_gridview.dart';
import 'package:baba/Views/screens/product_detail_screen.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/get_services/cart_controller.dart';
import 'package:baba/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


var TodayOfferImges = [Assets.TodayOffer,Assets.TodayBG1,Assets.TodayBG2,Assets.TodayBG3];

Widget todayOfferGrid(){
  return GetBuilder<GetTodayOfferProductsViewModel>( // specify type as Controller
    init: GetTodayOfferProductsViewModel(), // intialize with the Controller
    builder: (value) => ProductsGridView(value: value),
  );

}

Widget buildTodayOfferSliderShimmer() =>
    Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomWidget.rectangular(height: 500.h, width: 358.w)
    );



Widget getExpiryDiscountPercentage(Datum datum){

  if(datum.applyExpiryDiscount){

    String discountPercent = "0%\nOff";

    if(datum.expiryDiscountInPercent != null && datum.expiryDiscountInPercent.isNotEmpty){

      discountPercent = datum.expiryDiscountInPercent.substring(0,2) + "%\nOff";

    }

    return Container(
        height: 43.r,
        width: 43.r,
        padding: EdgeInsets.only(bottom: 8.h,right: 5.w),
        decoration:  BoxDecoration(
            color: Constant.greenColor,
            borderRadius:  BorderRadius.only(
              bottomRight: Radius.circular(40.r),
              topLeft:  Radius.circular(10.r),
            )
        ),
        child:  Center(
          child:  Text(
            discountPercent,
            style: GoogleFonts.poppins(
              fontSize: 9.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        )
    );

  }

  return Container();


}


Widget getProductPrice(Datum datum){

    String actualPrice = "";

    String cutPrice = "";

    if(datum.applyExpiryDiscount){

      actualPrice = datum.expiryDiscountedPrice;

      cutPrice = datum.actualPrice;

    }else if(datum.applyBulkDiscount) {

      actualPrice = datum.bulkDiscountedPrice;

      cutPrice = datum.actualPrice;

    }else{

      actualPrice =  datum.actualPrice;

    }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Expanded(
        child: Text(
          '£$actualPrice',
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            color: Constant.darkBlueColor,
            fontWeight: FontWeight.w600,
            // height: 1.44,
          ),
          textAlign: TextAlign.start,
        ),
      ),


      if(cutPrice.isNotEmpty)
       Expanded(
        child: Text(
          '£$cutPrice',
          style: GoogleFonts.poppins(
            fontSize: 12.0,
            color: Constant.mainOrangeColor,
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.lineThrough,
            // height: 1.92,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      if(!datum.applyExpiryDiscount && datum.applyBulkDiscount)
        Expanded(
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            // alignment: Alignment(-0.11, 0.11),
            width: 47.0,
            height: 21.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Constant.hotPinkColor,
            ),
            child: Center(
              child: Text(
                datum.bulkDiscountInPercent.toBulkDiscount(),
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 9.0,
                  color: Constant.greyColor,
                  // height: 2.78,
                ),
              ),
            ),
          ),
        ),
      )

    ],
  );

}


Widget getAddCart(Datum datum){

  return GetBuilder<CartController>(

      id: "update_cart${datum.id}",

      builder: (controller){

        bool isCartExist = false;

        for(final element in controller.data) {

          if(element.id == datum.id){

            isCartExist = true;

            break;

          }

        }

        return Row(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Flexible(
              flex: 45,
              child: InkWell(
                onTap: !isCartExist ? (){

                  datum.cartQuantity = 1;

                  controller.data.add(datum);

                  controller.update(['update_cart${datum.id}','my_cart']);

                } : null,
                child: Container(
                  alignment: const Alignment(0.01, 0.09),
                  // width: 150.w,
                  height: 26.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Constant.mainOrangeColor,
                  ),
                  child: Text(
                    isCartExist ? 'Add more' : 'Add to Basket',
                    style: GoogleFonts.poppins(
                      fontSize: 10.0,
                      color: Constant.greyColor,
                      // height: 2.5,
                    ),
                  ),
                ),
              ),
            ),


            if(isCartExist)

            Flexible(
              flex: 55,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  GestureDetector(
                    onTap: (){

                      for(int i=0; i < controller.data.length; i++){

                        if(controller.data.elementAt(i).id == datum.id){

                          controller.data.elementAt(i).cartQuantity--;

                          if(controller.data.elementAt(i).cartQuantity == 0){

                            controller.data.removeAt(i);

                          }

                          break;

                        }

                      }


                      controller.update(['update_cart${datum.id}','my_cart']);

                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 6.0),
                      decoration: const BoxDecoration(
                        color: Constant.mainOrangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: const Text("--",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.white)),
                    ),
                  ),

                  const SizedBox(width: 10,),

                   Text("${getCartCount(controller.data,datum)}",style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),

                  const SizedBox(width: 10,),

                  GestureDetector(
                    onTap: (){

                      for(int i=0; i < controller.data.length; i++){

                        if(controller.data.elementAt(i).id == datum.id){

                          controller.data.elementAt(i).cartQuantity++;

                          break;

                        }

                      }

                      controller.update(['update_cart${datum.id}','my_cart']);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                        color: Constant.mainOrangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: const Icon(Icons.add,size: 16,color: Colors.white,),
                    ),
                  ),

                ],
              ),
            ),

          ],
        );
      }
  );

}

int getCartCount(List<Datum> list,Datum datum){

  return list.firstWhere((element) => element.id == datum.id).cartQuantity;

}
