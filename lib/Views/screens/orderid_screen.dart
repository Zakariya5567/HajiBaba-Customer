import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/ViewModel/order_detail_screen_getOrderById.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/component/headingTitle.dart';
import 'package:baba/Views/screens/wishlist_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderId extends StatelessWidget {

  final myOrder;

  OrderId(this.myOrder);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Constant.darkOrange,
        automaticallyImplyLeading: false,
      ),

      //customAppBar('Order ID : ${myOrder['orderRefNumber']}'),

      body: GetBuilder<OrderIdController>(

        init: OrderIdController(myOrder['orderId']),

        builder: (controller){

          if(controller.isLoading) {

            return const Center(

              child: CircularProgressIndicator(),

            );

          }

          //final orderById = controller.orderById['data'];

          return
            Column(
            children:[
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.west,
                        size: 36.w,
                      )),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text(
                    'Order Details',
                    style: GoogleFonts.poppins(
                      fontSize: 22.w,
                      color: Constant.darkOrange,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Divider(thickness: 1,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(

                    padding: const EdgeInsets.all(0.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ListTile(
                          title: Row(children: [
                            Expanded(
                              child:
                              Text(controller.getOrderByIdModel.data.refNumber.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color:Colors.black87,
                                  // height: 4.64,
                                ),
                              ),
                            ),

                            Text(
                              controller.getOrderByIdModel.data.orderStatus.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Constant.secondaryColor,
                                // height: 4.64,
                              ),
                            ),
                          ],),
                          subtitle:  Text(
                            "${getFormattedDate(controller.getOrderByIdModel.data.orderTime.toString())}",
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: Colors.black54,
                              // height: 4.64,
                            ),
                          ),
                        ),
                      //  pickup store
                        ListTile(
                          title:   Text("PickUp Store",
                            style: GoogleFonts.poppins(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color:Colors.black87,
                              // height: 4.64,
                            ),
                          ),
                          subtitle:  Text(
                           "${controller.getOrderByIdModel.data.selectedStore.storeName}"
                               "\n${controller.getOrderByIdModel.data.selectedStore.address}"
                                  "\n${controller.getOrderByIdModel.
                           data.selectedStore.phoneNumber} "
                               "/ Ext ${controller.getOrderByIdModel.data.selectedStore.extensionNumber}",
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: Colors.black54,
                              // height: 4.64,
                            ),
                          ),
                        ),
                        //payment method
                        ListTile(
                          title: Text("Payment Method",
                            style: GoogleFonts.poppins(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color:Colors.black87,
                              // height: 4.64,
                            ),
                          ),
                          subtitle: Text(
                       controller.getOrderByIdModel.data.paymentMethod.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 20.0,
                              color: Constant.secondaryColor,
                              // height: 4.64,
                            ),
                          ),
                        ),
                        // billing address
                        ListTile(
                          title: Text("Billing Address",
                            style: GoogleFonts.poppins(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color:Colors.black87,
                              // height: 4.64,
                            ),
                          ),
                          subtitle:Text(
                              "${controller.getOrderByIdModel.data.address}"
                                " ${controller.getOrderByIdModel.data.street}"
                                "\n${controller.getOrderByIdModel.data.city}"
                                " ${controller.getOrderByIdModel.data.country}"
                                  "\n${controller.getOrderByIdModel.data.code}"
                                ,
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: Colors.black54,
                              // height: 4.64,
                            ),
                          ),
                        ),
                        Divider(thickness: 1,),
                        ///////////////////////////////////////////////////////////
                       ListView.builder(
                         shrinkWrap: true,
                           scrollDirection: Axis.vertical,
                           physics: const NeverScrollableScrollPhysics(),
                           itemCount: controller.getOrderByIdModel.data.productsList.length,
                           itemBuilder:(context,index){
                           final orderItem=controller.getOrderByIdModel.data.productsList[index];
                         return
                           ListTile(
                             title:
                             Row(children: [
                               Expanded(
                                 child:
                                 Text("${orderItem.productTitle} x ${orderItem.quanitty} ",
                                   style: GoogleFonts.poppins(
                                     fontSize: 20.0,
                                     fontWeight: FontWeight.w500,
                                     color:Colors.black87,
                                     // height: 4.64,
                                   ),
                                 ),
                               ),

                               Text(
                                 "£ ${orderItem.price}",
                                 style: GoogleFonts.poppins(
                                   fontSize: 20.0,
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black87,
                                   // height: 4.64,
                                 ),
                               ),
                             ],),
                             subtitle:
                                 ListView.builder(
                                   shrinkWrap: true,
                                     scrollDirection: Axis.vertical,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemCount: orderItem.orderVarients.length,
                                     //orderItem.orderVarients.length,
                                     itemBuilder: (context,index){
                                       return
                                         orderItem.orderVarients.isEmpty?null:
                                             Text("${orderItem.orderVarients[index].toString()}");

                                 }),
                           );
                       }),



                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15),
                          child: Column(
                            children: [
                              Divider(thickness: 1,),
                              //total item
                              Row(children: [
                                Expanded(
                                  child:
                                  Text("Item Total",
                                    style: GoogleFonts.poppins(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      color:Colors.black54,
                                      // height: 4.64,
                                    ),
                                  ),
                                ),

                                Text(
                                  "£ ${controller.getOrderByIdModel.data.total}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                    // height: 4.64,
                                  ),
                                ),
                              ],),
                              //vinture discount
                              Row(children: [
                                Expanded(
                                  child:
                                  Text("Vinture Discount",
                                    style: GoogleFonts.poppins(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      color:Colors.black54,
                                      // height: 4.64,
                                    ),
                                  ),
                                ),

                                Text(
                                  '${"£ 0.00"}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                    // height: 4.64,
                                  ),
                                ),
                              ],),

                              //discount
                              Row(children: [
                                Expanded(
                                  child:
                                  Text("Discount",
                                    style: GoogleFonts.poppins(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      color:Colors.black54,
                                      // height: 4.64,
                                    ),
                                  ),
                                ),

                                Text(
                                  "£ ${controller.getOrderByIdModel.data.discount}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                    // height: 4.64,
                                  ),
                                ),
                              ],),
                              Divider(thickness: 1,),
                              //total amount
                              Row(children: [
                                Expanded(
                                  child:
                                  Text("Total Amount",
                                    style: GoogleFonts.poppins(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                      color:Colors.black87,
                                      // height: 4.64,
                                    ),
                                  ),
                                ),

                                Text(
                                  "£ ${controller.getOrderByIdModel.data.grandTotal}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                    // height: 4.64,
                                  ),
                                ),
                              ],),
                              Divider(thickness: 1,),
                              SizedBox(height: 30,),
                              //need help button
                              InkWell(
                                onTap: ()async {
                                  const url = 'https://www.hbhonline.co.uk/';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Container(
                                  alignment: Alignment(0.0, 0.04),
                                  width: 326.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color:Color(0xFFFEE7CB),
                                  ),
                                  child: Text(
                                    'Need Help?',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      height: 1.56,
                                    ),

                                  ),
                                ),
                              ),
                              SizedBox(height: 50,),
                              //view order button
                              // InkWell(
                              //   onTap: () {
                              //     Get.to(() => MyWishList());
                              //   },
                              //   child: Container(
                              //     alignment: Alignment(0.0, 0.04),
                              //     width: 326.0,
                              //     height: 50.0,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(15.0),
                              //       color: Constant.mainOrangeColor,
                              //     ),
                              //     child: Text(
                              //       'View Order',
                              //       style: GoogleFonts.poppins(
                              //         fontSize: 16.0,
                              //         color: Constant.greyColor,
                              //         height: 1.56,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ]

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

class OrderIdController extends GetxController{

  OrderIdController(this.orderId);

  final AddressTypesServices _apiServices = AddressTypesServices();

  final LocalData _localData = LocalData();

  bool isLoading = true;

  String orderId;

  var orderById;

  GetOrderByIdModel getOrderByIdModel;


  void getOrderById() async {

    try {

      final userId = await _localData.getKeyValueFromShareedPref();

      getOrderByIdModel =await _apiServices.fetchOrderById(userId,orderId);

      // final response = await _apiServices.fetchOrderById(userId,refId);
      //
      // print('getMayOrders '+response.toString());
      //
      // if (response != null) {
      //
      //   if(response['data'] != null) {
      //
      //     getOrderByIdModel = response;
      //
      //   }

    //  }

    }catch(e){

      print('getOrderById error '+ e.toString());

    } finally {

      isLoading = false;

      update();

    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getOrderById();

  }

}
