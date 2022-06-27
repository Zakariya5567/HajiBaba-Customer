import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Views/component/customAppBar2.dart';
import 'package:baba/Views/component/headingTitle.dart';
import 'package:baba/Views/screens/filters_screen.dart';
import 'package:baba/Views/screens/order_details_screen.dart';
import 'package:baba/Views/screens/orderid_screen.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';

import 'package:baba/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'bottom_nav_bar.dart';

class MyOrders extends StatelessWidget {

  final bool isFromDashboard;

  MyOrders({this.isFromDashboard = false});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),

        child: Container(
          width: 375.w,
          height: 163.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 3.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                leading: InkWell(
                    onTap: (){
                      if(isFromDashboard){
                        final controller = Get.find<NavbarController>();
                        controller.onSelectPage(0);
                        controller.bottomNavigationKey.currentState.setPage(0);
                      }else{
                        Get.back();
                      }

                    },
                    child: Image.asset(Assets.ArrowBack)),
                horizontalTitleGap: 40.w,
                title: Text(
                  "My Orders",
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    color: Constant.darkBlueColor,
                    fontWeight: FontWeight.w600,
                    // height: 3.61,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 45.h,
                      width: 288.w,
                      child: CustomTextField(hintText: 'Search',prefixIcon: Icon(Icons.search),)
                  ),
                  // SizedBox(width: 5.w,),
                  // InkWell(
                  //     onTap: ()=>Get.to(()=>Filters()),
                  //     child: Image.asset(Assets.Filter))
                ],
              ),
            ],
          ),
        ),
      ),

      body: GetBuilder<MyOrdersController>(

        init: MyOrdersController(),

        builder: (controller){

          if(controller.isLoading) {

            return const Center(

              child: CircularProgressIndicator(),

            );

          }

          return
            SingleChildScrollView(

            child: Padding(

              padding: EdgeInsets.only(right: 12.r,bottom: 12.r,left: 12.r,top: 6.r),

              child: Column(

                children: [

                  if(controller.myOrders['data'] == null)

                    Text(
                      'No more new orders',
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        color: Constant.greyColor,
                        height: 3.42,
                      ),
                    ),

                  if(controller.myOrders != null && controller.myOrders['data'] != null && controller.myOrders['data'].length > 0)

                    for(int i=0; i < controller.myOrders['data'].length; i++)

                      InkWell(
                        onTap: (){

                          Get.to(()=>OrderId(controller.myOrders['data'][i]));
                          // Get.to(()=>OrderDetailsScreen(controller.myOrders['data'][i]));

                        },
                        child: Container(
                          width: 349.w,
                          height: 148.h,
                          margin: EdgeInsets.symmetric(vertical: 5.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: const Offset(0, 0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  alignment: Alignment.center,
                                  width: 64.w,
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color:Constant.darkOrange.withOpacity(0.3),
                                  ),
                                  child: Text(
                                    "${controller.myOrders['data'][i]['orderNumber']}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 22.0,
                                      color: Constant.darkOrange,
                                      fontWeight: FontWeight.w600,
                                      // height: 2.95,
                                    ),
                                  ),
                                ),
                                title: Container(
                                  width: 112.w,
                                  height: 80.h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Order ID : ${controller.myOrders['data'][i]['orderRefNumber']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          color: Constant.darkBlueColor,
                                          fontWeight: FontWeight.w600,
                                          // height: 1.44,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        'Total Items : ${controller.myOrders['data'][i]['orderItems']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                          // height: 1.64,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '£${controller.myOrders['data'][i]['grandTotal']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          color: Constant.darkOrange,
                                          // height: 1.64,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                trailing:
                                SizedBox(
                                  height: 40,
                                  width: 60,
                                  child:   Text(
                                    "${getFormattedDate(controller.myOrders['data'][i]['orderDateTime'])}",
                                    //
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10.0,
                                      color: Colors.grey,
                                      height: 1.92,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ),
                              const Divider(),
                              Padding(
                                padding: EdgeInsets.only(left: 10.w,right: 10.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Detail',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.0,
                                        color: Constant.darkBlueColor,
                                        height: 1.92,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${controller.myOrders['data'][i]['orderStatus']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.0,
                                        color: Constant.secondaryColor,
                                        fontWeight: FontWeight.w600,
                                        height: 1.92,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),



                  if(controller.orderHistory != null && controller.orderHistory['data'] != null && controller.orderHistory['data'].length > 0)

                  getHeadingTitle('Order History'),
                  
                  const SizedBox(height: 10,),

                  if(controller.orderHistory != null && controller.orderHistory['data'] != null && controller.orderHistory['data'].length > 0)

                    for(int i=0; i < controller.orderHistory['data'].length; i++)

                      Container(
                        width: 349.w,
                        height: 148.h,
                        margin: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                alignment: Alignment.center,
                                width: 64.w,
                                height: 120.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Constant.darkOrange.withOpacity(0.3),
                                ),
                                child: Text(
                                  '${controller.orderHistory['data'][i]['orderNumber']}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 22.0,
                                    color: Constant.darkOrange,
                                    fontWeight: FontWeight.w600,
                                    // height: 2.95,
                                  ),
                                ),
                              ),
                              title: Container(
                                width: 112.w,
                                height: 80.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Order ID : ${controller.orderHistory['data'][i]['orderRefNumber']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.0,
                                        color: Constant.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                        // height: 1.44,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Total Items : ${controller.orderHistory
                                      ['data'][i]['orderItems']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        color: Colors.grey
                                        // height: 1.64,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '£${controller.orderHistory['data'][i]['grandTotal']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                          color: Colors.grey
                                        // height: 1.64,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              trailing:
                                  SizedBox(
                                    height: 40,
                                   width: 60,
                                    child:   Text(
                                      "${getFormattedDate(controller.orderHistory
                                      ['data'][i]['orderDateTime'])}",
                                      //
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                        height: 1.92,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                )

                            ),
                            Divider(),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w,right: 10.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Detail',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.0,
                                      color: Constant.darkBlueColor,
                                      height: 1.92,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Buy Again',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.0,
                                      color: Constant.greenColor,
                                      fontWeight: FontWeight.w600,
                                      height: 1.92,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  
                ],

              ),

            ),

          );

        },

      ),

    );

  }
  String getFormattedDate(String date) {
    /// Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());

    var outputFormat = DateFormat('dd-MM-yyyy HH:mm a');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }

}


class MyOrdersController extends GetxController{


  final AddressTypesServices _apiServices = AddressTypesServices();

  final LocalData _localData = LocalData();

  bool isLoading = true;

  var myOrders;

  var orderHistory;

  void getMyOrders() async {

    try {

      final userId = await _localData.getKeyValueFromShareedPref();

      final response = await _apiServices.fetchMayOrders(userId);

      print('getMayOrders '+response.toString());

      if (response != null) {

        if(response['data'] != null){

          myOrders = response;

        }

      }
    }catch(e){

      print('getMayOrders error '+ e.toString());

    } finally {

      getOrderHistory();

    }

  }
  void getOrderHistory() async {

    try {

      final userId = await _localData.getKeyValueFromShareedPref();

      final response = await _apiServices.fetchOrdersHistory(userId);

      print('getOrderHistory '+response.toString());

      if (response != null) {

        if(response['data'] != null){

          orderHistory = response;

        }

      }
    }catch(e){

      print('getOrderHistory error '+ e.toString());

    } finally {

      isLoading = false;

      update();

    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getMyOrders();

  }



}
