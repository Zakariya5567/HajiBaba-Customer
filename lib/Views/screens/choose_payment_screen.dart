import 'dart:convert';

import 'package:baba/Core/ModelClasses/place_order_model.dart';
import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/screens/order_summary.dart';
import 'package:baba/payment.dart';

import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ChoosePayment extends StatefulWidget {

  ChoosePayment(this.placeOrder,this.parentContext);

  final PlaceOrderModel placeOrder;

  final BuildContext parentContext;

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    StripeServices.init();

  }

  // void payNow() async {
  //   //the amount must be transformed to cents
  //   var response =
  //   await StripeServices.payNowHandler(amount: '1000', currency: 'USD');
  //   print('response message ${response.message}');
  // }

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(

        appBar: customAppBar('Choose Payment'),

        body: GetBuilder<ChoosePaymentController>(

          init: ChoosePaymentController(),

          builder: (controller){

            if(controller.isLoading) {

              return const Center(

                child: CircularProgressIndicator(),

              );

            }

            if(controller.paymentMethods == null && controller.paymentMethods['data'] == null) {

              return Container();

            }

            return Padding(

                padding: EdgeInsets.all(12.r),

                child: Stack(

                  children: [

                    ListView.builder(

                      itemBuilder: (context,index){

                        final paymentMethod = controller.paymentMethods['data'][index];

                        return Column(

                          children: [

                            Container(
                              width: 349.w,
                              height: 80.h,
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
                              child: Center(
                                child: ListTile(
                                  leading: SvgPicture.asset(
                                    getPaymentMethodAsset(paymentMethod),color: Constant.greyColor,
                                    // height: 50,width: 50,
                                    // semanticsLabel: 'Acme Logo'
                                  ),
                                  title: Text(
                                    paymentMethod['paymentMethodName'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.0,
                                      color: Constant.darkBlueColor,
                                      fontWeight: FontWeight.w600,
                                      // height: 3.61,
                                    ),
                                  ),
                                  trailing: Obx(()=>Radio(
                                    value: index,
                                    groupValue: controller.selectedPaymentIndex.value,
                                    activeColor: Constant.mainOrangeColor,
                                    onChanged: (value){
                                      controller.selectedPaymentIndex.value = value;
                                    },

                                  )),
                                ),
                              ),
                            ),

                            SizedBox(height: 12.h,)

                          ],

                        );

                      },

                      itemCount: controller.paymentMethods['data'].length,

                    ),

                    Positioned(
                      bottom: 0,
                      left: 10.w,
                      right: 10.w,
                      child: InkWell(
                        onTap: () async {


                          // final paymentMethod =
                          //     await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());


                          if(controller.paymentMethods != null && controller.paymentMethods['data'] != null){

                            widget.placeOrder.paymentMethodId = controller.paymentMethods['data'][controller.selectedPaymentIndex.value]['id'];

                            widget.placeOrder.stripeTransactionId = null;

                            Get.to(() => OrderSummary(widget.placeOrder,controller.selectedPaymentIndex.value,widget.parentContext));

                          }


                        },
                        child: Container(
                          // alignment: Alignment(0.0, 0.04),
                          width: 326.w,
                          height: 50.h,
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
                    ),
                  ],
                )
            );

          },

        ),
      ),
    );
  }

  getPaymentMethodAsset(paymentMethod){

    switch(paymentMethod['paymentMethodName']){

      case 'Stripe':
        return Assets.Stripe;
        break;
      case 'Bank Direct Account':
        return Assets.Bank;
        break;
      default:
        return Assets.COD;
        break;
    }

  }

  Future<void> initPaymentSheet(context, { String email, int amount}) async {
    try {
      // 1. create payment intent on the server
      final response = await http.post(
          Uri.parse(
              'https://us-central1-stripe-checkout-flutter.cloudfunctions.net/stripePaymentIntentRequest'),
          body: {
            'email': email,
            'amount': amount.toString(),
          });

      final jsonResponse = jsonDecode(response.body);

      Get.log(jsonResponse.toString());

      // //2. initialize the payment sheet
      // await Stripe.instance.initPaymentSheet(
      //   paymentSheetParameters: const SetupPaymentSheetParameters(
      //     paymentIntentClientSecret: "sk_test_Tyd5dRTSGssssReDnxwdOxWz00XjQAQw1w",
      //     merchantDisplayName: 'Flutter Stripe Store Demo',
      //     // customerId: jsonResponse['customer'],
      //     customerEphemeralKeySecret: "pk_test_CRKNqrZeEQaGgWJQagDiLKnG00jRtxdT0n",
      //     style: ThemeMode.light,
      //     testEnv: true,
      //     merchantCountryCode: 'SG',
      //   ),
      // );
      //
      // await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment completed!')),
      );
    } catch (e) {
      // if (e is StripeException) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Error from Stripe: ${e.error.localizedMessage}'),
      //     ),
      //   );
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Error: $e')),
      //   );
      // }
    }
  }
}


class ChoosePaymentController extends GetxController{

  final AddressTypesServices _apiServices = AddressTypesServices();

  final LocalData _localData = LocalData();

  bool isLoading = true;

  var paymentMethods;

  void getPaymentMethods() async {

    try {

      final userId = await _localData.getKeyValueFromShareedPref();

      final response = await _apiServices.fetchPaymentMethods(userId);

      print('getPaymentMethods '+response.toString());

      if (response != null) {

        if(response['data'] != null){

          paymentMethods = response;

        }

      }
    }catch(e){

      print('getPaymentMethods error '+ e.toString());

    } finally {

      isLoading = false;

      update();

    }

  }

  final selectedPaymentIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getPaymentMethods();

  }

}
