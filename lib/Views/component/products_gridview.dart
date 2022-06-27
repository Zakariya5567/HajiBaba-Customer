

import 'package:baba/Core/ModelClasses/products_model.dart';
import 'package:baba/Views/screens/product_detail_screen.dart';
import 'package:baba/get_services/cart_controller.dart';
import 'package:baba/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductsGridView extends StatelessWidget {

   ProductsGridView({Key key,@required this.value}) : super(key: key);

   final value;

  @override
  Widget build(BuildContext context) {


    if(value.isLoading){

      return GridView.count(

        padding: const EdgeInsets.only(top: 5),

        crossAxisCount: 2,

        shrinkWrap: true,

        childAspectRatio: 0.55,

        physics: const NeverScrollableScrollPhysics(),

        children: List.generate(4, (index) => buildMostTrendingShimmer()),

      );

    }

    if(value.productsModel != null && value.productsModel.data != null){

      return GridView.count(
          padding: const EdgeInsets.only(top: 5),
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 0.55,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            value.productsModel.data.length,
             (index) {
               return SizedBox(
                    child: Card(
                        child: LayoutBuilder(
                          builder: (BuildContext ctx, BoxConstraints constraints)=>Stack(
                            children: [

                              Column(
                                children: [

                                  InkWell(
                                      onTap: ()=>Get.to(()=>ProductDetail(
                                        datum: value.productsModel.data[index],
                                      )),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.r),
                                        child: SizedBox(
                                          width: 180.w,
                                          height: 170.h,
                                          // decoration: BoxDecoration(
                                          //     // borderRadius: BorderRadius.circular(10.0),
                                          //     color: Constant.greyColor,
                                          //     borderRadius:  BorderRadius.all(Radius.circular(20))
                                          // ),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl: value.productsModel.data[index].imgUrl,
                                            placeholder: (context, url) => CustomWidget.rectangular(height: 170.h, width: 180.w),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                          ),
                                          // child: Image.asset(
                                          //     TodayOfferImges[index],
                                          // width: 180.w,
                                          // height: 153.h,
                                          // fit: BoxFit.fitWidth,
                                          // ),
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

                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10.h,top: 5.h,left: 5,right: 5),
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [


                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              RatingBar.builder(
                                                initialRating: 5,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 12.w,
                                                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                                itemBuilder: (context, _) => const Icon(
                                                  Icons.star,
                                                  color: Constant.greenColor,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              Text(
                                                '(105) Reviews',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12.0,
                                                  color: Constant.mainOrangeColor,
                                                  fontWeight: FontWeight.w300,
                                                  // height: 2.56,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  '${value.productsModel.data[index].title}',
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18.sp,
                                                    color: Constant.darkBlueColor,
                                                    // height: 1.44,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '1${value.productsModel.data[index].unit}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14.0,
                                                  color: Constant.darkOrange,
                                                  // height: 1.79,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),

                                          getProductPrice(value.productsModel.data[index]),

                                          if(value.productsModel.data[index]?.productInfoText != null)
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    value.productsModel.data[index].productInfoText,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 8.0,
                                                      color: Constant.greenColor,
                                                      fontWeight: FontWeight.w300,
                                                      // height: 2.88,
                                                    ),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    //overflow: TextOverflow.visible,
                                                  ),
                                                ),
                                              ],
                                            ),

                                          getAddCart(value.productsModel.data[index]),


                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                              Positioned(
                                  top: 0,
                                  child: getExpiryDiscountPercentage(value.productsModel.data[index])
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(

                                    padding: const EdgeInsets.all(2.5),

                                    onPressed: (){

                                      if(!value.productsModel.data[index].isCustomerFvt){

                                        value.addCustomerFvtProduct(value.productsModel.data[index].id);
                                      }

                                    },

                                    icon: Image.asset(
                                      Assets.FavIcon,
                                      color: value.productsModel.data[index].isCustomerFvt ? Colors.red : null,
                                    ),

                                  )
                              ),
                            ],
                          ),
                        )
                    ),
                  );
            },
          )
      );

    }


    return const SizedBox(

      height: 500,

      child: Center(
        child: Text("No Record Found",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Constant.primaryColor
        ),),
      ),
    );


  }

   Widget buildMostTrendingShimmer() =>
       Padding(
           padding: const EdgeInsets.all(12.0),
           child: CustomWidget.rectangular(height: 500.h, width: 358.w)
       );

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
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [

         Text(
           '£${actualPrice.toStringAsFixed()}',
           style: GoogleFonts.poppins(
             fontSize: 16.0,
             color: Constant.darkBlueColor,
             fontWeight: FontWeight.w600,
             // height: 1.44,
           ),
           textAlign: TextAlign.start,
         ),


         if(cutPrice.isNotEmpty)
           Row(
             children: [
               const SizedBox(width: 10,),
               Text(
                 '£${cutPrice.toStringAsFixed()}',
                 style: GoogleFonts.poppins(
                   fontSize: 12.0,
                   color: Constant.mainOrangeColor,
                   fontWeight: FontWeight.w300,
                   decoration: TextDecoration.lineThrough,
                   // height: 1.92,
                 ),
                 textAlign: TextAlign.center,
               ),
             ],
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

           if(!datum.isVariableProduct){

             for(final element in controller.data) {

               if(element.id == datum.id){

                 isCartExist = true;

                 break;

               }

             }

           }



           return Row(

             mainAxisAlignment: MainAxisAlignment.center,

             children: [

               Flexible(
                 flex: 45,
                 child: InkWell(
                   onTap: (){

                     if(!isCartExist){

                       if(!datum.isVariableProduct){

                         datum.cartQuantity = 1;

                         controller.data.add(datum);

                       }else{

                         Get.to(()=>ProductDetail(
                           datum: datum,
                         ));

                       }


                     }else{

                       for(int i=0; i < controller.data.length; i++){

                         if(controller.data.elementAt(i).id == datum.id){

                           controller.data.elementAt(i).cartQuantity++;

                           break;

                         }

                       }

                     }

                     controller.update(['update_cart${datum.id}','my_cart']);

                   },
                   child: Container(
                     alignment: const Alignment(0.01, 0.09),
                     // width: 150.w,
                     height: 26.0,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(3.0),
                       color: Constant.mainOrangeColor,
                     ),
                     child: Text(
                       isCartExist ? 'Add more' : datum.isVariableProduct ? 'Chose Option' : 'Add to Basket',
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
                         child: SvgPicture.asset(
                             Assets.minus_icon,
                           width: 26,
                           height: 26,
                           color: Constant.mainOrangeColor,
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




}


extension StringExtension on String {

  String toBulkDiscount(){

    if(this != null && isNotEmpty){

      return "${substring(0,2)}% off";

    }else{

      return "0% off";

    }

  }

  String toStringAsFixed(){

    if(this != null && isNotEmpty){

      return double.parse(this).toStringAsFixed(2).toString();

    }

    return "";

  }

}