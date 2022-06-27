import 'package:baba/Core/ModelClasses/place_order_model.dart';
import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/screens/order_summary.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripPaymentForm extends StatefulWidget {

  const StripPaymentForm({Key key,this.placeOrderModel,this.mContext}) : super(key: key);

  final PlaceOrderModel placeOrderModel;

  final BuildContext mContext;

  @override
  _StripPaymentFormState createState() => _StripPaymentFormState();
}

class _StripPaymentFormState extends State<StripPaymentForm> {

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // resizeToAvoidBottomInset: false,

      appBar: customAppBar('Stripe Payment'),

      body: SafeArea(

        child: GetBuilder<StripPaymentFormController>(

          init: StripPaymentFormController(),

          builder: (controller) {

            if(controller.isLoading) {

              return const Center(

                child: CircularProgressIndicator(),

              );

            }

            return SingleChildScrollView(

              child: Column(

                children: [

                  const SizedBox(
                    height: 30,
                  ),

                  CreditCardWidget(

                    glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: Constant.greenColor,
                    // backgroundImage:
                    // useBackgroundImage ? 'assets/card_bg.png' : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: const Icon(Icons.account_balance)
                        // cardImage: Image.asset(
                        //   'assets/mastercard.png',
                        //   height: 48,
                        //   width: 48,
                        // ),
                      ),
                    ],

                  ),

                  CreditCardForm(

                    formKey: formKey,

                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    themeColor: Colors.blue,
                    textColor: Colors.black87,
                    cardNumberDecoration: InputDecoration(
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      hintStyle: const TextStyle(color: Colors.grey),
                      labelStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                    expiryDateDecoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
                      labelStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: border,
                      enabledBorder: border,
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
                      labelStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: border,
                      enabledBorder: border,
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
                      labelStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: border,
                      enabledBorder: border,
                      labelText: 'Card Holder',
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  //
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     const Text(
                  //       'Glassmorphism',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //     Switch(
                  //       value: useGlassMorphism,
                  //       inactiveTrackColor: Colors.grey,
                  //       activeColor: Colors.white,
                  //       activeTrackColor: Colors.green,
                  //       onChanged: (bool value) => setState(() {
                  //         useGlassMorphism = value;
                  //       }),
                  //     ),
                  //   ],
                  // ),
                  //
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     const Text(
                  //       'Card Image',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //     Switch(
                  //       value: useBackgroundImage,
                  //       inactiveTrackColor: Colors.grey,
                  //       activeColor: Colors.white,
                  //       activeTrackColor: Colors.green,
                  //       onChanged: (bool value) => setState(() {
                  //         useBackgroundImage = value;
                  //       }),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20,
                  ),

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //     ),
                  //     primary: const Color(0xff1b447b),
                  //   ),
                  //   child: Container(
                  //     margin: const EdgeInsets.all(12),
                  //     child: const Text(
                  //       'Validate',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontFamily: 'halter',
                  //         fontSize: 14,
                  //         package: 'flutter_credit_card',
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     if (formKey.currentState.validate()) {
                  //       print('valid!');
                  //     } else {
                  //       print('invalid!');
                  //     }
                  //   },
                  // ),

                  InkWell(

                    onTap: (){

                      if (formKey.currentState.validate()) {


                        final CreditCard testCard = CreditCard(
                          number: cardNumber,
                          expMonth: int.parse(expiryDate.split('/').first),
                          expYear: int.parse(expiryDate.split('/').last),
                          name: cardHolderName,
                          cvc: cvvCode,
                          addressLine1: 'Address 1',
                          addressLine2: 'Address 2',
                          addressCity: 'City',
                          addressState: 'CA',
                          addressZip: '1337',
                        );

                        StripePayment.createTokenWithCard(
                          testCard,
                        ).then((token) async {

                          final tokedId = token.tokenId;

                          if(tokedId != null ){
                            // user token in your api

                            Get.log("tokedId: $tokedId");

                            controller.saveCustomerRechargeTransaction(widget.placeOrderModel, tokedId, widget.mContext);

                          }



                        }).catchError((onError){
                          Get.log("onError: $onError");
                        });


                      }

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
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: Constant.greyColor,
                          height: 1.56,
                        ),
                      ),
                    ),
                  ),

                ],

              ),

            );

          },

        ),

      ),



    );
  }

  Future<void> onCreditCardModelChange(CreditCardModel creditCardModel) async {

    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }


}


class StripPaymentFormController extends GetxController {

  final AddressTypesServices _apiServices = AddressTypesServices();

  final LocalData _localData = LocalData();

  bool isLoading = false;


  void saveCustomerRechargeTransaction(PlaceOrderModel placeOrderModel,token, mContext) async {

    try {

      isLoading = true;

      update();

      var userId = await _localData.getKeyValueFromShareedPref();

      placeOrderModel.customerId = userId;

      Map<String, dynamic> mData = {
        "customerId": placeOrderModel.customerId,
        "customerSelectedAddressId": placeOrderModel.cstomerAddressId,
        "price": placeOrderModel.total,
        "stripeToken": token,
        "stripeEmail": "umair74773@gmail.com"
      };

      final response = await _apiServices.saveCustomerRechargeTransaction(mData);

      if (response["status"] == "Ok") {

        if(response['data'] != null && response['data'].isNotEmpty) {

          Get.back();

          final mController = Get.find<OrderSummaryController>();

          mController.placeOrder(placeOrderModel, mContext);


        }

      }


    }catch(e){

      Get.log("saveCustomerRechargeTransaction error: $e");

    }
    finally {

      isLoading = false;

      update();

    }

  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


  }

}