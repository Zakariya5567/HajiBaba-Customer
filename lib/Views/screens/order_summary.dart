import 'package:baba/Core/ModelClasses/place_order_model.dart';
import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/my_orders_screen.dart';
import 'package:baba/Views/screens/strip_payment_form.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/get_services/cart_controller.dart';

import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummary extends StatelessWidget {

  OrderSummary(this.placeOrder,this.paymentIndex,this.parentContext);

  final PlaceOrderModel placeOrder;

  final int paymentIndex;

  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: customAppBar('Order Summary'),

      body: SafeArea(

        child: GetBuilder<OrderSummaryController>(

          init: OrderSummaryController(parentContext),

          builder: (controller){

            if(controller.isLoading) {

              return const Center(

                child: CircularProgressIndicator(),

              );

            }

            return SingleChildScrollView(

              physics: const ScrollPhysics(),

              child: Column(

                children: [

                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: placeOrder.orderedProductsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Card(
                            child: SizedBox(
                                width: 326.w,
                                height: 97.h,
                                child: Center(
                                  child: ListTile(leading: Image.asset(Assets.CartItem,),title: Text(
                                    placeOrder.orderedProductsList[index].productTitle,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      color: Constant.darkBlueColor,
                                      fontWeight: FontWeight.w500,
                                      height: 1.25,
                                    ),
                                  ),
                                    subtitle: Text(
                                      "Quantity: ${placeOrder.orderedProductsList[index].quantity}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.0,
                                        color: Constant.darkOrange,
                                        height: 1.64,
                                      ),
                                    ),
                                    trailing: Text(
                                      '£${getPrice(placeOrder.orderedProductsList[index])}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        color: Constant.darkOrange,
                                        height: 1.64,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),),
                                )
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     Image.asset(Assets.CartItem),
                              //     Column(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Text(
                              //           'Cube \nMeat',
                              //           style: GoogleFonts.poppins(
                              //             fontSize: 16.0,
                              //             color: const Color(0xFF242938),
                              //             fontWeight: FontWeight.w500,
                              //             height: 1.25,
                              //           ),
                              //         ),
                              //         Text(
                              //           '£8',
                              //           style: GoogleFonts.poppins(
                              //             fontSize: 12.0,
                              //             color: const Color(0xFFBDBABA),
                              //             height: 1.92,
                              //           ),
                              //           textAlign: TextAlign.center,
                              //         )
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       width: 115.0,
                              //       height: 35.0,
                              //       child: Stack(
                              //         alignment: Alignment.centerLeft,
                              //         children: <Widget>[
                              //           // Group: Group 954
                              //
                              //           Container(
                              //             width: 115.0,
                              //             height: 35.0,
                              //             decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.circular(50.0),
                              //               color: const Color(0xFFF9F9F9),
                              //             ),
                              //           ),
                              //
                              //           Positioned(
                              //             left: 22.0,
                              //             child: Text(
                              //               '-    1    +',
                              //               style: GoogleFonts.poppins(
                              //                 fontSize: 18.0,
                              //                 color: const Color(0xFF242938),
                              //                 fontWeight: FontWeight.w500,
                              //                 height: 1.11,
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     SvgPicture.asset(Assets.Bin
                              //
                              //       // semanticsLabel: 'Acme Logo'
                              //
                              //     )
                              //   ],
                              // ),
                            ),
                          ),
                        );
                      }),

                  Container(
                      width: 375.w,
                      height: 230.h,
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
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount:',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,
                                    // height: 4.64,
                                  ),
                                ),
                                Text(
                                  '£${placeOrder.discount}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,
                                    fontWeight: FontWeight.w600,
                                    // height: 4.64,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                          const Divider(
                            color: Colors.white,
                            thickness: 3,
                          ),
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
                                  '£${placeOrder.total}',
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
                          InkWell(
                            onTap: () {

                              if(paymentIndex == 0){

                                Get.to(() => StripPaymentForm(placeOrderModel: placeOrder,mContext: context,));

                              }else{

                                controller.placeOrder(placeOrder,context);
                              }

                              // Get.to(() => DeliveryAddress());
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
                                'Place Order',
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

          },

        ),
      ),
    );
  }

  getPrice(OrderedProductsList orderedProduct){

    if(orderedProduct.discountedPrice != null && orderedProduct.discountedPrice > 0){

      return orderedProduct.discountedPrice;

    }else{

      return orderedProduct.price;

    }


  }



}

class OrderSummaryController extends GetxController {

  final AddressTypesServices _apiServices = AddressTypesServices();

  final LocalData _localData = LocalData();

  final BuildContext parentContext;

  OrderSummaryController(this.parentContext);

  bool isLoading = false;

  void placeOrder(PlaceOrderModel placeOrderModel,context) async {

    try {

      isLoading = true;

      update();

      var userId = await _localData.getKeyValueFromShareedPref();

      placeOrderModel.customerId = userId;

      final response = await _apiServices.placeOrder(placeOrderModel);

      if (response["status"] == "Ok") {

        if(response['data'] != null && response['data'].isNotEmpty) {

          final mController = Get.find<CartController>();

          mController.data.clear();

          mController.update(['my_cart']);

          showOrderDialog(context,response['data']);

        }

      }


    }catch(e){

      Get.log("placeOrder error: $e");

    }
    finally {

      isLoading = false;

      update();

    }

  }

  void showOrderDialog(context,data){

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              width: 326.w,
              height: 560.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 5.0,),
                  SvgPicture.asset(
                    Assets.Accept,

                  ),
                  const SizedBox(height: 5.0,),
                  Text.rich(
                    TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 24.0,
                        color: Constant.darkBlueColor,
                        height: 1.46,
                      ),
                      children: [
                        TextSpan(
                          text: 'Your order ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: '${data['orderNumber']} \n',
                          style: GoogleFonts.poppins(
                            color: Constant.darkOrange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'is successfully',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5.0,),
                  Text.rich(
                    TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        color: Constant.darkBlueColor,
                        height: 1.44,
                      ),
                      children: [
                         TextSpan(
                          text: '${data['message']} \n',
                        ),
                        // TextSpan(
                        //   text: '"oders\'\'',
                        //   style: GoogleFonts.poppins(
                        //     color: Constant.darkOrange,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        // const TextSpan(
                        //   text: ' section.',
                        // ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w,right: 8.0.w),
                    child: InkWell(
                      onTap: () {
                        Get.off(() => BottomNavBar());
                      },
                      child: Container(
                        // alignment: Alignment(0.0, 0.04),
                        width: 256.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Constant.mainOrangeColor,
                        ),
                        child: Center(
                          child: Text(
                            'Continue Shopping',
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              color: Constant.greyColor,
                              // height: 1.56,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),


                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      TextButton(onPressed: (){

                        Get.back();

                        showRatingDialog(context,data);

                      }, child: Text(
                        'Add Review',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: Colors.grey,
                          height: 1.44,
                        ),
                        textAlign: TextAlign.center,
                      )),

                      TextButton(onPressed: (){

                        // Navigator.pop(parentContext);

                        Navigator.pushReplacement(parentContext, MaterialPageRoute(builder: (context)=> MyOrders()));

                        // Get.to(()=>MyOrders());

                        // Get.offAll(MyOrders());

                      }, child: Text(
                        'View Orders',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: Colors.grey,
                          height: 1.44,
                        ),
                        textAlign: TextAlign.center,
                      )),

                    ],

                  ),


                ],
              ),
            ),
          );
        });

  }

  void showRatingDialog(context,data){

    final textFieldController = TextEditingController();

    double rate = 0.0;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              width: 326.w,
              height: 560.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,

              ),
              child: GetBuilder<OrderSummaryController>(

                builder: (_){

                  if(isRatingLoading) {

                    return const Center(

                      child: CircularProgressIndicator(),

                    );

                  }

                  return Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      const SizedBox(height: 5.0,),

                      Text.rich(
                        TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 24.0,
                            color: Constant.darkBlueColor,
                            height: 1.46,
                          ),
                          children: [
                            TextSpan(
                              text: 'Add Ratings',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 5.0,),

                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Constant.primaryColor,
                        ),
                        onRatingUpdate: (rating) {
                          rate = rating;
                        },
                      ),

                      const SizedBox(height: 5.0,),

                      Container(
                          height: 60.h,
                          width: 256.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Constant.greyColor,),
                          child: CustomTextField(
                              hintText: 'Review',
                              textEditingController: textFieldController
                          )),

                      const SizedBox(height: 5.0,),

                      Padding(

                        padding: EdgeInsets.only(left: 8.0.w,right: 8.0.w),

                        child: InkWell(

                          onTap: () {

                            // Get.off(() => BottomNavBar());

                            if(rate > 0 || textFieldController.text.isNotEmpty){

                              Map<String,dynamic> mData = {

                                "review" : textFieldController.text,

                                "stars" : rate.round()

                              };

                              submitRating(context, mData);

                            } else {

                              Get.snackbar("Alert", "Rating Required");

                            }



                          },
                          child: Container(
                            // alignment: Alignment(0.0, 0.04),
                            width: 256.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Constant.mainOrangeColor,
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  color: Constant.greyColor,
                                  // height: 1.56,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5.0,),

                      TextButton(onPressed: (){

                        Get.off(() => BottomNavBar());

                      }, child: Text(
                        'Continue Shopping',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: Colors.grey,
                          height: 1.44,
                        ),
                        textAlign: TextAlign.center,
                      )),

                    ],
                  );

                },
              ),
            ),
          );
        });

  }

  void submitRating(context, Map<String,dynamic> data) async{

    try {

      isRatingLoading = true;

      update();

      var userId = await _localData.getKeyValueFromShareedPref();

      data.addAll({

        "customerId" : userId,

      });


      final response = await _apiServices.submitRating(data);

      if (response["status"] == "Ok") {

        Get.snackbar("Success", response['message']);

        Get.off(() => BottomNavBar());

      }


    }catch(e){

      Get.log("placeOrder error: $e");

    }
    finally {

      isRatingLoading = false;

      update();

    }

  }

  bool isRatingLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


  }

}
