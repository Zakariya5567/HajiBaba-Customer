import 'package:baba/Core/ModelClasses/place_order_model.dart';
import 'package:baba/Core/Services/StoresData_Service.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/screens/choose_payment_screen.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';

import 'package:baba/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Order'),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Order',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: Constant.darkBlueColor,
                fontWeight: FontWeight.w600,
                // height: 3.61,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Container(
                  height: 50.h,
                  width: 326.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constant.greyColor
                  ),
                  child: CustomTextField(
                    hintText: 'Enter a voucher code',
                    suffixIcon: Icon(Icons.add),
                  )),
            ),
            // Container(
            //     width: 326.w,
            //     height: 60.h,
            //     margin: EdgeInsets.only(top: 12.h),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10.0),
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.16),
            //           offset: Offset(0, 0),
            //           blurRadius: 6.0,
            //         ),
            //       ],
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 SizedBox(
            //                   width: 8.w,
            //                 ),
            //                 Image.asset(Assets.DeliveryTruck),
            //                 SizedBox(
            //                   width: 8.w,
            //                 ),
            //                 Text(
            //                   'Delivery',
            //                   style: GoogleFonts.poppins(
            //                     fontSize: 18.0,
            //                     color: const Color(0xFF242938),
            //                     fontWeight: FontWeight.w600,
            //                     // height: 3.22,
            //                   ),
            //                 ),
            //               ],
            //             )
            //           ],
            //         ),
            //         Radio()
            //       ],
            //     )),
            Container(
                width: 326.w,
                height: 60.h,
                margin: EdgeInsets.only(top: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Constant.greyColor.withOpacity(0.16),
                      offset: Offset(0, 0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            SvgPicture.asset(
                              Assets.ShoppingStore,
                              // height: 50,width: 50,
                              // semanticsLabel: 'Acme Logo'
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'Click & Collect',
                              style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                color: Constant.darkBlueColor,
                                fontWeight: FontWeight.w600,
                                // height: 3.22,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Radio()
                  ],
                )),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub Total:',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Constant.darkBlueColor,
                    fontWeight: FontWeight.w600,
                    // height: 4.06,
                  ),
                ),
                Text(
                  '£64.00',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Constant.darkBlueColor,
                    fontWeight: FontWeight.w600,
                    // height: 4.06,
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Total :',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    color: Constant.darkBlueColor,
                    fontWeight: FontWeight.w600,
                    // height: 3.25,
                  ),
                ),
                Text(
                  '£64.00',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    color: Constant.darkBlueColor,
                    fontWeight: FontWeight.w500,
                    // height: 3.25,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Savings:',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    color: Constant.redColor,
                    fontWeight: FontWeight.w600,
                    // height: 4.64,
                  ),
                ),
                Text(
                  '£2.00(7%)',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    color: Constant.redColor,
                    fontWeight: FontWeight.w500,
                    // height: 4.64,
                  ),
                )
              ],
            ),
            Divider(),
            Text(
              'Click & Collect',
              style: GoogleFonts.poppins(
                fontSize: 20.0,
                color: Constant.darkBlueColor,
                fontWeight: FontWeight.w600,
                height: 3.25,
              ),
            ),
            Text(
              'We have a strict social distancing policy in\nour store. Please follow our safety measures\nwhen visiting.',
              style: GoogleFonts.poppins(
                fontSize: 14.0,
                color: Constant.darkBlueColor,
                height: 1.57,
              ),
            ),
            Text(
              'Check stock in your location',
              style: GoogleFonts.poppins(
                fontSize: 14.0,
                color: Constant.darkBlueColor,
                height: 1.57,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            InkWell(
              onTap: () {
                // Get.to(() => AddAdress());
              },
              child: Container(
                alignment: Alignment(0.0, 0.04),
                width: 326.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Constant.greyColor,
                ),
                child: Text(
                  'Selected Store Name',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Constant.greyColor,
                    height: 1.56,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: () {
                // Get.to(() => ChoosePayment());
              },
              child: Container(
                alignment: Alignment(0.0, 0.04),
                width: 326.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Constant.primaryColor,
                ),
                child: Text(
                  'Click & Collect Checkout',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Constant.greyColor,
                    // height: 1.56,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () {
                 // Get.to(() => ChoosePayment());
              },
              child: Container(
                alignment: Alignment(0.0, 0.04),
                width: 326.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xFFFB7712),
                ),
                child: Text(
                  'Delivery Checkout',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: const Color(0xFFF1F2F6),
                    // height: 1.56,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ChooseDelivery2 extends StatelessWidget {

  const ChooseDelivery2(this.placeOrder,this.parentContext,{Key key}) : super(key: key);

  final PlaceOrderModel placeOrder;
  final BuildContext parentContext;


  @override
  Widget build(BuildContext context) {

    final titleStyle = GoogleFonts.poppins(
      fontSize: 16.0,
      color: Constant.darkBlueColor,
      fontWeight: FontWeight.w500,
      // height: 3.22,
    );

    final subTitleStyle =  GoogleFonts.poppins(
      fontSize: 14.0,
      color: Constant.darkBlueColor,
      fontWeight: FontWeight.w400,
      // height: 3.22,
    );


    return SafeArea(
      child: Scaffold(

        resizeToAvoidBottomInset: true,

        appBar: customAppBar('Order'),

        body: GetBuilder<ChooseDeliveryController>(

          init: ChooseDeliveryController(),

          builder: (controller){

            return LayoutBuilder(

              builder: (context,constraint){

                final verticalSizeBoxed = SizedBox(height: constraint.maxHeight * 0.02,);

                return Padding(

                  padding: const EdgeInsets.all(16.0),

                  child: Column(

                    children: [

                      Expanded(

                        child: SingleChildScrollView(

                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Text("Your Order", style: titleStyle,),

                              verticalSizeBoxed,

                              Container(

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Constant.greyColor
                                  ),
                                  child: CustomTextField(
                                    hintText: 'Enter a voucher code',
                                    suffixIcon: const Icon(Icons.add),
                                    textEditingController: TextEditingController(text: ""),
                                  )),

                              verticalSizeBoxed,

                              const Divider(thickness: 1,),

                              verticalSizeBoxed,

                              Card(

                                elevation: 5.0,

                                child: Padding(

                                  padding: const EdgeInsets.only(left: 20,top: 16,bottom: 16,right: 5),

                                  child: Row(

                                    children: [

                                      SvgPicture.asset(
                                        Assets.ShoppingStore,
                                      ),

                                      SizedBox(width: constraint.maxWidth * 0.03,),

                                      Text(
                                        'Click & Collect',
                                        style: titleStyle,
                                      ),

                                      const Spacer(),

                                      Radio(
                                        value: true,
                                        groupValue: true,
                                        onChanged: (value){},
                                        activeColor: Constant.mainOrangeColor,
                                      ),


                                    ],

                                  ),
                                ),
                              ),

                              verticalSizeBoxed,

                              Row(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [

                                  Text("Discount:", style: titleStyle,),

                                  Text("£${placeOrder.discount}", style: titleStyle,),

                                ],
                              ),

                              verticalSizeBoxed,

                              const Divider(thickness: 1,),

                              verticalSizeBoxed,

                              Row(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [

                                  Text("Order Total:", style: titleStyle.merge(const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18
                                  )),),


                                  Text("£${placeOrder.total}", style: titleStyle.merge(const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18
                                  )),),

                                ],
                              ),

                              verticalSizeBoxed,

                              Row(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [

                                  Text("Total Saving:", style: subTitleStyle.merge(const TextStyle(
                                      color: Constant.hotPinkColor
                                  )),),


                                  Text("£${placeOrder.discount}", style: subTitleStyle.merge(const TextStyle(
                                      color: Constant.hotPinkColor
                                  )),),

                                ],
                              ),

                              verticalSizeBoxed,

                              const Divider(thickness: 1,),

                              verticalSizeBoxed,

                              Text("Click & Collect", style: titleStyle.merge(const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                              )),),


                              verticalSizeBoxed,

                              Text("We have a strict social distancing policy in our store. Please follow our safety measures when visiting.",
                                maxLines: null,
                                style: subTitleStyle,),

                              verticalSizeBoxed,

                              Text(
                                'Check stock in your location',
                                style: subTitleStyle,
                              ),

                              verticalSizeBoxed,

                              // InkWell(
                              //   onTap: () {
                              //     // Get.to(() => AddAdress());
                              //   },
                              //   child: Container(
                              //     alignment: Alignment(0.0, 0.04),
                              //     // width: 326.0,
                              //     height: 50.0,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(50.0),
                              //       color: Constant.greyColor,
                              //     ),
                              //     child: Text(
                              //       'Selected Store Name',
                              //       style: titleStyle,
                              //     ),
                              //   ),
                              // ),

                              GetBuilder<ChooseDeliveryController>(

                                id: 'update_dropdown',

                                  builder: (_){

                                    return Container(
                                      height: 50.0,
                                      alignment: const Alignment(0.0, 0.04),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.0),
                                        color: Constant.greyColor,),
                                      child: Padding(

                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),

                                        child: DropdownButtonFormField<StoreDropdownModel>(

                                          hint: const Text("Select Store",),

                                          decoration: const InputDecoration(

                                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Constant.greyColor))

                                          ),

                                          value: controller.storeDropdown,

                                          onChanged: (StoreDropdownModel newValue) {

                                            controller.storeDropdown = newValue;

                                            placeOrder.storeId = newValue.id;

                                          },
                                          items: controller.storeDropdownList
                                              .map<DropdownMenuItem<StoreDropdownModel>>((StoreDropdownModel value) {

                                            return DropdownMenuItem<StoreDropdownModel>(
                                              value: value,
                                              child: Text(value.name),
                                            );

                                          }).toList(),
                                        ),
                                      ),);

                                  }

                              )

                            ],

                          ),
                        ),
                      ),



                      verticalSizeBoxed,

                      InkWell(
                        onTap: () {

                          if(placeOrder.storeId != null){

                            Get.to(() => ChoosePayment(placeOrder,parentContext));

                          }else{

                            Get.snackbar("Alert", "Please Select Store");

                          }


                        },
                        child: Container(
                          alignment: Alignment(0.0, 0.04),
                          // width: 326.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Constant.greenColor,
                          ),
                          child: Text(
                            'Click & Collect Checkout',
                            style: titleStyle.apply(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),

                      verticalSizeBoxed,

                      InkWell(
                        onTap: () {
                          if(placeOrder.storeId != null){

                            Get.to(() => ChoosePayment(placeOrder,parentContext));

                          }else{

                            Get.snackbar("Alert", "Please Select Store");

                          }
                        },
                        child: Container(
                          alignment: Alignment(0.0, 0.04),
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: const Color(0xFFFB7712),
                          ),
                          child: Text(
                            'Pay Now',
                            style: titleStyle.apply(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                );

              },

            );

          },

        )

      ),
    );

  }

}


class ChooseDeliveryController extends GetxController {

  final StoresDataServices _apiServices = StoresDataServices();

  bool isLoading = true;

  List<StoreDropdownModel> storeDropdownList = [];

  StoreDropdownModel storeDropdown;


  void loadStoreDropdown() async {

    try {

      isLoading = true;

      final response = await _apiServices.fetchStoresData('GetStores');

      if (response["message"] == "Found") {

          if(response['data'] != null && response['data'].isNotEmpty){

            for( final data in  response['data']){

              storeDropdownList.add(StoreDropdownModel(name: data['name'], id: data['id']));

            }

          }

      }


    }catch(e){

      Get.log("loadStoreDropdown: $e");

    }
    finally {

      isLoading = false;

      update(['update_dropdown']);

    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    loadStoreDropdown();

  }

}

class StoreDropdownModel {

  String name;
  int id;

  StoreDropdownModel({this.name,this.id});

}