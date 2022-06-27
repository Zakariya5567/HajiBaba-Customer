import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/screens/edit_profile_screen.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/Views/widgets/heading_text.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SendVerificationCode extends StatelessWidget {

  SendVerificationCode({Key key,this.verificationId}) : super(key: key);

  Size _size;

  final String verificationId;

  @override
  Widget build(BuildContext context) {

    _size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: customAppBar('Phone Verification'),

      body: SizedBox(

        width: _size.width,

        child: GetBuilder<SendVerificationCodeController>(

          init: SendVerificationCodeController(),

          builder: (controller){

            return Column(

              children: [

                const Spacer(flex: 30,),

                Text(
                  'Phone Verification'.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: _size.height * 0.03,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    // height: 3.61,
                  ),
                ),

                const SizedBox(height: 10,),

                Text(
                  'Enter your OTP code here',
                  style: GoogleFonts.poppins(
                    fontSize: _size.height * 0.02,
                    color: Colors.black87.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                    // height: 3.61,
                  ),
                ),

                const Spacer(flex: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: controller.pinTextEditingController,
                    onChanged: (value) {
                      // setState(() {
                      //   pin = value;
                      // });
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(
                        _size.width * 0.2,
                      ),
                      selectedColor: Constant.primaryColor,
                      activeFillColor: Constant.primaryColor,
                      inactiveFillColor: Constant.primaryColor,
                      activeColor: const Color(0xffE5E5E5),
                      disabledColor: const Color(0xffE5E5E5),
                      inactiveColor: const Color(0xffE5E5E5),
                      selectedFillColor: Constant.primaryColor,
                      fieldHeight: _size.width * 0.15,
                      fieldWidth: _size.width * 0.15,
                    ),
                    cursorColor: Constant.primaryColor,
                    keyboardType: TextInputType.number,
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(

                  padding: const EdgeInsets.all(20.0),

                  child: CustomButton(

                      title:'Verify OTP',

                      callback: () async {

                        try{

                          final code = controller.pinTextEditingController.text.trim();

                          Get.log("code: $code");

                          AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

                          if(credential != null) {

                            Get.find<EditProfileController>().updateCustomerProfile();

                            Get.back();

                          }

                        }catch(e){

                          Get.snackbar('OTP Alert', 'Wrong OTP entered');

                          Get.log(e.toString());

                        }


                      },

                  ),
                ),

                const Spacer(flex: 60,),


              ],

            );

          },

        )

      ),

    );

  }

}

class SendVerificationCodeController extends GetxController{

  final pinTextEditingController = TextEditingController();

}
