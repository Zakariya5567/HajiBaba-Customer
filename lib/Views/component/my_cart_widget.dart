
import 'package:baba/Core/ModelClasses/place_order_model.dart';
import 'package:baba/Views/screens/deliveryaddress_screen.dart';
import 'package:baba/get_services/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/product_detail_screen.dart';

Widget myCartWidget(Size size) =>
    SafeArea(

      child: GetBuilder<CartController>(

        id: "my_cart",

        builder: (controller){

          return LayoutBuilder(

              builder: (context,dim){

                if(controller.data.isNotEmpty){

                  return SizedBox(

                    height: dim.maxHeight,

                    child: Column(

                      children: [

                        SizedBox(height: dim.maxHeight * 0.01,),

                        Expanded(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (BuildContext context, int index) {

                                return Padding(
                                  padding: EdgeInsets.only(left: 5.w,right: 5.w),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child:Column(
                                        children: [
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              CircleAvatar(
                                                radius: dim.maxWidth * 0.08,
                                                backgroundImage: NetworkImage(controller.data.elementAt(index).imgUrl),
                                              ),

                                              SizedBox(width: 10.w,),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${controller.data.elementAt(index).title.split(' ').first}\n"
                                                        "${controller.data.elementAt(index).title.split(' ').last}",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 15.0,
                                                      color: Constant.darkBlueColor,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.25,
                                                    ),
                                                  ),

                                                  Text(
                                                    '£${double.parse(getPrice(controller.data.elementAt(index))).toPrecision(2)}',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12.0,
                                                      color: Constant.darkBlueColor,
                                                      // height: 1.92,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  ///===========================


                                                ],
                                              ),

                                              SizedBox(width: 10.w,),

                                              Expanded(

                                                child: Row(

                                                  mainAxisAlignment: MainAxisAlignment.end,

                                                  children: [

                                                    getProductCount(controller,index),

                                                    SizedBox(width: 10.w,),

                                                    IconButton(onPressed: (){

                                                      final productId = controller.data.elementAt(index).id;

                                                      controller.data.removeAt(index);

                                                      controller.update(['update_cart$productId','my_cart']);

                                                    }, icon: SvgPicture.asset(Assets.Bin)
                                                    )

                                                  ],
                                                ),

                                              )


                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left:65,
                                            ),
                                            child: GetBuilder<ProductDetailController>(
                                                builder: (optionController) {
                                                return Row(
                                                  children: [
                                                    Text(
                                                    "Option:",
                                                     style: GoogleFonts.poppins(
                                                        fontSize: 12.0,
                                                        color: Constant.hotPinkColor,
                                                        // height: 1.92,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),

                                                    // SizedBox(width: 5,),
                                                    // Text(
                                                    //   optionController.first.toString(),
                                                    //   style: GoogleFonts.poppins(
                                                    //     fontSize: 12.0,
                                                    //     color: Constant.hotPinkColor,
                                                    //     // height: 1.92,
                                                    //   ),
                                                    //   textAlign: TextAlign.center,
                                                    // ),
                                                    // SizedBox(width: 5,),
                                                    // Text(
                                                    //   optionController.second.toString(),
                                                    //   style: GoogleFonts.poppins(
                                                    //     fontSize: 12.0,
                                                    //     color: Constant.hotPinkColor,
                                                    //     // height: 1.92,
                                                    //   ),
                                                    //   textAlign: TextAlign.center,
                                                    // ),
                                                    // SizedBox(width: 5,),
                                                    // Text(
                                                    //   optionController.third.toString(),
                                                    //   style: GoogleFonts.poppins(
                                                    //     fontSize: 12.0,
                                                    //     color: Constant.hotPinkColor,
                                                    //     // height: 1.92,
                                                    //   ),
                                                    //   textAlign: TextAlign.center,
                                                    // ),


                                                    GetBuilder<ProductDetailController>(
                                                      builder: (optionController) {
                                                        return
                                                          Container(
                                                          color: Colors.white,
                                                          height: 20,
                                                          width: 200,
                                                          child: ListView.builder(
                                                              scrollDirection: Axis.horizontal,
                                                              shrinkWrap: true,
                                                            physics: const NeverScrollableScrollPhysics(),
                                                            itemCount: optionController.selectedOptionList.length,
                                                              itemBuilder:(context,optionIndex){
                                                                return
                                                                Row(
                                                                  children: [
                                                                Center(
                                                                child: Text(
                                                                optionController.selectedOptionList[optionIndex],
                                                                  style: GoogleFonts.poppins(
                                                                    fontSize: 12.0,
                                                                    color: Colors.black87,
                                                                    // height: 1.92,
                                                                  ),
                                                                  textAlign: TextAlign.center,
                                                                ),
                                                                ),
                                                                    SizedBox(width: 10,)
                                                                  ],
                                                                );


                                                              }),
                                                        );
                                                      }
                                                    )
                                                  ],
                                                );
                                              }
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                );
                              }),
                        ),

                        Container(
                            // width: 375.w,
                            // height: 230.h,

                            padding: EdgeInsets.symmetric(vertical: dim.maxHeight * 0.05),

                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(25.0),
                              ),
                              color: Constant.greyColor,
                            ),

                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Padding(
                                //   padding: EdgeInsets.only(left: 20.w, right: 20.w),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         'Subtotal',
                                //         style: GoogleFonts.poppins(
                                //           fontSize: 14.0,
                                //           color: Constant.darkBlueColor,
                                //           // height: 4.64,
                                //         ),
                                //       ),
                                //       Text(
                                //         '£64.00',
                                //         style: GoogleFonts.poppins(
                                //           fontSize: 14.0,
                                //           color: Constant.darkBlueColor,
                                //           fontWeight: FontWeight.w600,
                                //           // height: 4.64,
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                                // Padding(
                                //   padding: EdgeInsets.only(left: 20.w, right: 20.w),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         'Delivery Charge',
                                //         style: GoogleFonts.poppins(
                                //           fontSize: 14.0,
                                //           color: const Color(0xFF242938),
                                //           // height: 4.64,
                                //         ),
                                //       ),
                                //       Text(
                                //         '£16.00',
                                //         style: GoogleFonts.poppins(
                                //           fontSize: 14.0,
                                //           color: const Color(0xFF242938),
                                //           fontWeight: FontWeight.w600,
                                //           // height: 4.64,
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                                // Divider(
                                //   color: Colors.white,
                                //   thickness: 3,
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Discount: ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          color: Constant.darkBlueColor,
                                          fontWeight: FontWeight.w600,
                                          // height: 4.06,
                                        ),
                                      ),
                                      Text(
                                        '£${getDiscountPrice(controller)}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          color: Constant.darkBlueColor,
                                          fontWeight: FontWeight.w600,
                                          // height: 4.06,
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 15,),

                                Padding(
                                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total: ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          color: Constant.darkBlueColor,
                                          fontWeight: FontWeight.w600,
                                          // height: 4.06,
                                        ),
                                      ),
                                      Text(
                                        '£${getTotalPrice(controller)}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          color: Constant.darkBlueColor,
                                          fontWeight: FontWeight.w600,
                                          // height: 4.06,
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 15,),

                                InkWell(
                                  onTap: () {
                                    // Get.to(() => AddAdress());

                                    List<OrderedProductsList> list = [];

                                    for( final datum in controller.data) {

                                      final discountedPrice = getPrice(datum);

                                      List<ProductAttributesAndVarientIds> productAttributesAndVarientIds = [];

                                      if(datum.attributesVarients != null){

                                        for( final attributesVarients in datum.attributesVarients) {

                                          productAttributesAndVarientIds.add(

                                            ProductAttributesAndVarientIds(

                                                producuctAttributeAndVarientId: attributesVarients.attributeAndVarientId,

                                                price: attributesVarients.varientPrice.toInt()

                                            ),

                                          );

                                        }

                                      }

                                      list.add(OrderedProductsList(
                                        productId: datum.id,
                                        productTitle: datum.title,
                                        isVariableProduct: datum.isVariableProduct,
                                        quantity: datum.cartQuantity,
                                        price: double.parse(datum?.actualPrice ?? "0").toInt(),
                                        expiryDiscountApplied: datum.applyExpiryDiscount,
                                        bulkDiscountApplied: datum.applyBulkDiscount,
                                        discountedPrice: double.parse(discountedPrice ?? "0").toInt(),
                                        discountInPercent: double.parse(getDiscountPriceInPercentage(datum) ?? "0"),
                                        productAttributesAndVarientIds:
                                        productAttributesAndVarientIds.isNotEmpty ? productAttributesAndVarientIds : null

                                      ));

                                    }

                                    PlaceOrderModel placeOrder = PlaceOrderModel(
                                      discount: double.parse(getDiscountPrice(controller) ?? "0").toInt(),
                                      discontInPercent: double.parse(getDiscountPercentage(controller) ?? "0.0"),
                                      total: double.parse(getTotalPrice(controller)).toInt(),
                                      grandTotal: double.parse(getTotalPrice(controller)).toInt(),
                                      orderedProductsList: list,

                                    );

                                    Get.to(() => DeliveryAddress(placeOrder: placeOrder,));

                                  },
                                  child: Container(
                                    alignment: Alignment(0.0, 0.04),
                                    width: 326.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Constant.mainOrangeColor,
                                    ),
                                    child: Text(
                                      'Checkout',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.0,
                                        color: Constant.greyColor,
                                        height: 1.56,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],

                    ),
                  );

                }

                return emptyCart(size);

              }
          );

        },
      ),

    );


Widget getProductCount(CartController controller,index){

  final textStyle = GoogleFonts.poppins(
    fontSize: 18.0,
    color: Constant.darkBlueColor,
    fontWeight: FontWeight.w500,
    height: 1.11,
  );

  return Container(
    // width: dim.maxWidth * 0.3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      color: Constant.greyColor,
    ),
    padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.w),

    child: Row(
      children: [
        GestureDetector(
          onTap: (){

            final productId = controller.data.elementAt(index).id;

            controller.data.elementAt(index).cartQuantity--;

            if(controller.data.elementAt(index).cartQuantity == 0){

              controller.data.removeAt(index);

            }

            controller.update(['update_cart$productId','my_cart']);

          },
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Text(
              '-',
              style: textStyle.merge(const TextStyle(fontSize: 20)),
            ),
          ),
        ),
        SizedBox(width: 10.w,),
        Text(
          controller.data.elementAt(index).cartQuantity.toString(),
          style: textStyle,
        ),
        SizedBox(width: 10.w,),
        GestureDetector(
          onTap: (){

            final productId = controller.data.elementAt(index).id;

            controller.data.elementAt(index).cartQuantity++;

            controller.update(['update_cart$productId','my_cart']);

          },
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Text(
              '+',
              style: textStyle,
            ),
          ),
        ),
      ],
    ),
  );

}

String getTotalPrice(CartController controller){


  double totalPrice = 0.0;

  for( final datum in controller.data){

    String actualPrice = "";

    if(datum.applyExpiryDiscount){

      actualPrice = datum.expiryDiscountedPrice;

    }else if(datum.applyBulkDiscount){

      actualPrice = datum.bulkDiscountedPrice;

    }else{

      actualPrice =  datum.actualPrice;

    }


    if(actualPrice != null && actualPrice.isNotEmpty){

      totalPrice += double.parse(actualPrice) * datum.cartQuantity;

    }

  }

  return totalPrice.toPrecision(2).toString();

}

String getDiscountPercentage(CartController controller){


  double totalDiscount = 0.0;

  int discountSize = 0;

  for( final datum in controller.data){

    if(datum.applyExpiryDiscount){

      discountSize = discountSize + 1;

      totalDiscount = double.parse(datum.expiryDiscountInPercent);

    }


    if(datum.applyBulkDiscount){

      discountSize = discountSize + 1;

      totalDiscount = totalDiscount + double.parse(datum.bulkDiscountInPercent);

    }

  }

  print("totalDiscount : $totalDiscount");

  print("discountSize : $discountSize");

  if(totalDiscount > 0){

    totalDiscount = totalDiscount / discountSize;

    return totalDiscount.toPrecision(2).toString();

  }

  return "0.0";

}

String getDiscountPrice(CartController controller){


  double totalDiscount = 0.0;

  // int discountSize = 0;

  for( final datum in controller.data) {

    bool isDiscount = false;

    if(datum.applyExpiryDiscount){

      // discountSize = discountSize + 1;

      totalDiscount = double.parse(datum.expiryDiscountedPrice);

      isDiscount = true;

    }


    if(datum.applyBulkDiscount) {

      // discountSize = discountSize + 1;

      if(datum.bulkDiscountCapacity >= 10) {

        totalDiscount = totalDiscount + double.parse(datum.bulkDiscountedPrice);

        isDiscount = true;

      }

    }

    final actualPrice = double.parse(datum.actualPrice) * datum.cartQuantity;

    if(isDiscount){

      totalDiscount = totalDiscount * datum.cartQuantity;

      if(totalDiscount > actualPrice){

        totalDiscount = totalDiscount - actualPrice;

      }else{

        totalDiscount = actualPrice - totalDiscount;

      }

    }

  }

  print("totalDiscount : $totalDiscount");
  //
  // print("discountSize : $discountSize");
  //
  // totalDiscount = totalDiscount * datum.;

  return totalDiscount.toPrecision(2).toString();

}

String getPrice(datum){

  String actualPrice = "0";

  if(datum.applyExpiryDiscount){

    actualPrice = datum.expiryDiscountedPrice;

  }else if(datum.applyBulkDiscount){

    actualPrice = datum.bulkDiscountedPrice;

  }else{

    actualPrice =  datum.actualPrice;

  }

  return actualPrice;

}

String getDiscountPriceInPercentage(datum){

  String actualPrice = "0";

  if(datum.applyExpiryDiscount){

    actualPrice = datum.expiryDiscountInPercent;

  }else if(datum.applyBulkDiscount){

    actualPrice = datum.bulkDiscountInPercent;

  }

  return actualPrice;

}

Widget emptyCart(Size size) => SizedBox(
  width: size.width,
  height: size.height,
  child:   Column(

    mainAxisAlignment: MainAxisAlignment.center,

    children: [

      CircleAvatar(
        radius: size.width * 0.2,
        backgroundColor: Colors.grey.withOpacity(0.1),
        child: SvgPicture.asset(Assets.Cart),
      ),

      SizedBox(height: size.height * 0.03,),

      Text(
        "Your Cart Is Empty",
        style: GoogleFonts.poppins(
          fontSize: 18.0,
          color: Constant.darkGreyColor.withOpacity(0.8),
          fontWeight: FontWeight.bold,
          height: 1.25,
        ),
      ),

      SizedBox(height: size.height * 0.02,),

      Text(
        "Add Some Items In Your Cart",
        style: GoogleFonts.poppins(
          fontSize: 16.0,
          color: Constant.darkGreyColor.withOpacity(0.6),
          fontWeight: FontWeight.w400,
          height: 1.25,
        ),
      ),

      SizedBox(height: size.height * 0.2,),

    ],
  ),
);