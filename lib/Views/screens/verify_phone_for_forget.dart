import 'package:baba/ViewModel/user_view_model.dart';
import 'package:baba/Views/component/customerfullScreenDialoag.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/Views/widgets/default_size.dart';
import 'package:baba/Views/widgets/heading_text.dart';
import 'package:baba/main.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'otp_verification_screen.dart';

class VerifyPhoneNumberForgot extends StatefulWidget {
  VerifyPhoneNumberForgot({Key key,this.uPhoneNumber,this.uPassword,}) : super(key: key);

  String uPhoneNumber;
  String uPassword;


  @override
  _VerifyPhoneNumberForgotState createState() => _VerifyPhoneNumberForgotState();
}

class _VerifyPhoneNumberForgotState extends State<VerifyPhoneNumberForgot> {
  final TextEditingController _pinTextEditingController =
  TextEditingController();

  String pin = "";
  final TextEditingController _textEditingController = TextEditingController(text: "+92");
  UserViewModel _userViewModel = Get.put(UserViewModel());
  FirebaseAuth auth = FirebaseAuth.instance;

  // bool otpVisibility = false;

  String verificationID = "";


  final _phoneController= TextEditingController();
  final _codeController= TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text = widget.uPhoneNumber;

  }


  Future<bool> loginUser(String phone, BuildContext context) async {

    FirebaseAuth _auth= FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          var result = await _auth.signInWithCredential(credential);

          var user = result.user;

          if(user != null){


            // Navigator.push(context, MaterialPageRoute(
            //     builder: (context) => BottomNavBar()
            // ));
          }
          else{

            print("Error");

          }

        },
        verificationFailed: (e){
          print("tttt"+e.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]){

          print("verificationId"+verificationId);

          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
                appBar: AppBar(),
                // backgroundColor: Colors.black87,
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.kDefaultSize * 3,
                    ),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DefaultSize(),
                          const DefaultSize(),
                          const Center(
                            child: HeadingText(
                              title: "Phone Verification",
                            ),
                          ),
                          const DefaultSize(),
                          const Center(
                            child: Text(
                              "Enter your OTP code here",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                              textScaleFactor: 1,
                            ),
                          ),
                          const DefaultSize(),
                          const DefaultSize(),
                          const DefaultSize(),
                          const DefaultSize(),
                          const DefaultSize(),
                          const DefaultSize(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.kDefaultSize * 3,
                            ),
                            child: PinCodeTextField(
                              appContext: context,
                              length: 6,
                              controller: _pinTextEditingController,
                              onChanged: (value) {
                                setState(() {
                                  pin = value;
                                });
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.kDefaultSize * 8,
                                ),
                                selectedColor: Constant.primaryColor,
                                activeFillColor: Constant.primaryColor,
                                inactiveFillColor: Constant.primaryColor,
                                activeColor: const Color(0xffE5E5E5),
                                disabledColor: const Color(0xffE5E5E5),
                                inactiveColor: const Color(0xffE5E5E5),
                                selectedFillColor: Constant.primaryColor,
                                fieldHeight: SizeConfig.kDefaultSize * 14,
                                fieldWidth: SizeConfig.kDefaultSize * 14,
                              ),
                              cursorColor: Constant.primaryColor,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const DefaultSize(),
                          const DefaultSize(),
                          const DefaultSize(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: CustomButton(title:'Verify OTP',callback: ()async{
                              try{
                                CustomFullScreenDialog.showDialog();
                                final code= _pinTextEditingController.text.trim();
                                AuthCredential credential= PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
                                var result = await _auth.signInWithCredential(credential);
                                var user = result.user;
                                if(user != null){
                                  print('user data....'+user.toString());
                                  Get.back();
                                  _userViewModel.resetPassword(widget.uPhoneNumber,widget.uPassword,);
                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (context) => BottomNavBar()
                                  // ));
                                }
                                else{
                                  CustomFullScreenDialog.cancelDialog();
                                  Get.snackbar('OTP Alert', 'Wrong OTP entered');
                                  print("Error");
                                }
                              }catch (e){
                                CustomFullScreenDialog.cancelDialog();
                                Get.snackbar('OTP Alert', 'Wrong OTP entered');
                                print(e.toString());
                              }
                            },),
                          ),

                          Center(
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Didn't you received any code?",
                                    style: TextStyle(
                                      color: Constant.darkGreyColor,
                                    ),
                                  ),

                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(child:  InkWell(
                            onTap: ()async{
                              // Get.back();
                              // Get.snackbar('OTP', 'Please Press the Send Button Again.');
                              await loginUser(_textEditingController.text,context);
                            },
                            highlightColor: Constant.greyColor,
                            splashColor: Constant.darkGreyColor,
                            child: Text(
                              "Resend a new code.",
                              style: TextStyle(
                                color: Constant.primaryColor,
                              ),
                            ),
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),//Put your screen design here!
            ),
          );
          // showDialog(
          //     context: context,
          //     barrierDismissible: false,
          //     builder: (context){
          //       return AlertDialog(
          //         title: Text("Give the code"),
          //         content: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             TextField(controller: _codeController,)
          //           ],
          //         ),
          //         actions: [
          //           FlatButton(
          //             child: Text("Conferm"),
          //             textColor: Colors.white,
          //             color: Colors.blue,
          //             onPressed: () async{
          //               final code= _codeController.text.trim();
          //               AuthCredential credential= PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
          //               var result = await _auth.signInWithCredential(credential);
          //               var user = result.user;
          //               if(user != null){
          //                 print('user data....'+user.toString());
          //                 Get.back();
          //                 _userViewModel.resetPassword(widget.uPhoneNumber,widget.uPassword,);
          //                 // Navigator.push(context, MaterialPageRoute(
          //                 //     builder: (context) => BottomNavBar()
          //                 // ));
          //               }
          //               else{
          //                 print("Error");
          //               }
          //
          //             },
          //           )
          //         ],
          //
          //       );
          //     }
          // );
        },
        codeAutoRetrievalTimeout: null
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultSize(),
                const DefaultSize(),
                const Center(
                  child: HeadingText(
                    title: "Verify your\nphone number",
                  ),
                ),
                const DefaultSize(),
                const DefaultSize(),
                 Center(
                  child: Text(
                    "We have sent you an SMS with a code\nto number ${widget.uPhoneNumber}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                  ),
                ),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                CustomTextField(
                    prefixIcon: Image.asset(Assets.UKFlag),
                    textEditingController: _textEditingController,
                    hintText: "+92 xxx xxxx xxx"),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                CustomButton(callback: ()async {
                  await loginUser(_textEditingController.text,context);
                  // MyApp.pushRoute(PinVerificationScreen());
                }, title: "Send"),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
