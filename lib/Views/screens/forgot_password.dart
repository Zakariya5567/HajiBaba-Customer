import 'package:baba/Views/screens/verify_phone_for_forget.dart';
import 'package:baba/Views/screens/verify_phone_number_screen.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/Views/widgets/default_size.dart';
import 'package:baba/Views/widgets/heading_text.dart';
import 'package:baba/main.dart';
import 'package:baba/utils/size_config.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
 var _passwordTextEditingController = TextEditingController();
 var _verifyPasswordTextEditingController = TextEditingController();
 var _phoneNumberTextEditingController = TextEditingController(text: "+92");

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
                const Center(child: HeadingText(title: "Forgot Password")),
                const DefaultSize(),
                const DefaultSize(),
                const Center(
                  child: Text(
                    "Please enter your registered phone number we will send you an OTP code to rest your password",
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
                  textEditingController: _phoneNumberTextEditingController,
                  hintText: "Phone Number",
                ),
                const DefaultSize(),
                CustomTextField(
                  textEditingController: _passwordTextEditingController,
                  hintText: "New Password",
                  obsecure: true,
                  isPasswordText: true,
                ),
                const DefaultSize(),
                CustomTextField(
                  textEditingController: _verifyPasswordTextEditingController,
                  hintText: "Verify Password",
                  obsecure: true,
                  isPasswordText: true,
                ),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                CustomButton(callback: () {
                  if(_passwordTextEditingController.text == _verifyPasswordTextEditingController.text){

                    MyApp.pushRoute(VerifyPhoneNumberForgot(
                      uPhoneNumber: _phoneNumberTextEditingController.text,
                      uPassword: _passwordTextEditingController.text,)
                    );

                  }else{

                    _passwordTextEditingController.clear();
                    _verifyPasswordTextEditingController.clear();

                    Get.snackbar("Alert", "Passwords are not matching");

                  }

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
