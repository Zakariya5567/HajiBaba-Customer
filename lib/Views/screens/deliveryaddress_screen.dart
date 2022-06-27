import 'package:baba/Core/ModelClasses/place_order_model.dart';
import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/screens/choose_delivery_screen.dart';
import 'package:baba/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_address_screen.dart';

class DeliveryAddress extends StatelessWidget {

  DeliveryAddress({this.placeOrder});

  final PlaceOrderModel placeOrder;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        appBar: customAppBar('Address'),

        body: Padding(

          padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),

          child: GetBuilder<DeliveryAddressController>(

            init: DeliveryAddressController(),

            builder: (controller) {

              if(controller.isLoading) {

                return const Center(

                  child: CircularProgressIndicator(),

                );

              }

              if(controller.customerAddressData == null) {

                return Center(

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,

                    mainAxisAlignment: MainAxisAlignment.center,

                    children:  [

                       const Image(
                        image: AssetImage(
                            Assets.DeliveryImage
                        ),
                      ),

                      const SizedBox(height: 15,),

                      const Text(
                        "You have not any address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 18
                        ),
                      ),

                      const SizedBox(height: 15,),

                      InkWell(
                        onTap: () {
                          Get.to(() => AddAdress());
                        },
                        child: Container(
                          // alignment: Alignment(0.0, 0.04),
                          width: 326.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Constant.mainOrangeColor,
                          ),
                          child: Center(
                            child: Text(
                              '+ Add New Address',
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                color: Constant.greyColor,
                                // height: 1.56,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                );

              }

              return Column(

                children: [

                  InkWell(
                    onTap: (){

                      Get.to(() => AddAdress(
                        navFrom: "Cart",
                      ));

                    },
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Constant.greyColor,
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFBDBABA),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '+ Add New Address',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,

                            color: Constant.darkBlueColor,

                            fontWeight: FontWeight.w500,

                            // height: 4.64,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(

                      child: ListView.builder(

                        itemBuilder: (context,index) {

                          return Container(
                            margin: EdgeInsets.only(top: 15.h,),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Constant.darkBlueColor.withOpacity(0.16),
                                  offset: const Offset(0, 0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Padding(

                              padding:  EdgeInsets.all(10.r),

                              child: Row(

                                children: [

                                  Expanded(
                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: <Widget>[

                                        Text(
                                          controller.customerAddressData['data'][index]['addressType'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 16.0,
                                            color: Constant.darkBlueColor,
                                            fontWeight: FontWeight.w600,
                                            // height: 3.61,
                                          ),
                                        ),

                                        Text(
                                          _getAddress(controller.customerAddressData['data'][index]),
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.0,
                                            color: Constant.darkBlueColor,
                                            // height: 1.56,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                  Obx(()=>Radio(
                                    value: index,
                                    groupValue: controller.selectedIndex.value,
                                    activeColor: Constant.mainOrangeColor,
                                    onChanged: (value){
                                      controller.selectedIndex.value = value;
                                    },

                                  ))

                                ],
                              ),
                            ),
                          );

                        },
                        itemCount: controller.customerAddressData['data'].length,
                      )

                  ),


                  if(placeOrder != null)

                  InkWell(
                    onTap: () {

                      if(controller.customerAddressData != null && controller.customerAddressData['data'] != null) {

                        placeOrder.cstomerAddressId = controller.customerAddressData['data'][controller.selectedIndex.value]['id'];

                        Get.to(() => ChooseDelivery2(
                            placeOrder,
                            context
                        ));

                      }else{

                        Get.snackbar("Alert", "Address must be required");

                      }


                    },
                    child: Container(
                      // alignment: Alignment(0.0, 0.04),
                      width: 326.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Constant.mainOrangeColor,
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: Constant.greyColor,
                            // height: 1.56,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],

              );

            },
          ),
        ),
      ),
    );
  }

  String _getAddress(customerAddressData) {

    return "${customerAddressData['street']}, ${customerAddressData['address']}, ${customerAddressData['city']}\n${customerAddressData['country']}";

  }

}



class DeliveryAddressController extends GetxController{

  final AddressTypesServices _apiServices = AddressTypesServices();

  LocalData _localData = LocalData();

  bool isLoading = true;

  var customerAddressData;

  void getCustomerAddresses() async {
    try {
      // isLoading = true;
      print('bofore ueer iddd..');
      var userid = await _localData.getKeyValueFromShareedPref();
      print('user is id'+ userid);
      var response = await _apiServices.fetchCustomerAddress(userid);
      // print('responseee${response.toString()}');
      print('GetCustomerAddresses1 '+response.toString());
      if (response != null) {

        if(response['data'] != null){

          customerAddressData = response;

          print('GetCustomerAddresses2 '+customerAddressData.toString());

        }

      }
    }catch(e){
      print('GetCustomerAddresses error '+ e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  final selectedIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCustomerAddresses();

  }

}
