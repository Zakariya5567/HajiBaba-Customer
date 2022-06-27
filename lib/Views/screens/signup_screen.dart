import 'package:baba/Views/screens/verify_phone_number_screen.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/Views/widgets/default_size.dart';
import 'package:baba/Views/widgets/heading_text.dart';
import 'package:baba/main.dart';

import 'package:baba/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextEditingController =
          TextEditingController(),
      _passwordTextEditingController = TextEditingController(),
      _usernameTextEditingController = TextEditingController(),
      _phoneNumberTextEditingController = TextEditingController(text: "+92");


  FirebaseAuth auth = FirebaseAuth.instance;

  // bool otpVisibility = false;

  String verificationID = "";

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
                const Center(child: HeadingText(title: "Create an account")),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                CustomTextField(
                  textEditingController: _usernameTextEditingController,
                  hintText: "Fullname",
                ),
                const DefaultSize(),
                CustomTextField(
                  textEditingController: _emailTextEditingController,
                  hintText: "Email",

                  isPasswordText: true,
                ),
                const DefaultSize(),
                CustomTextField(
                  textEditingController: _phoneNumberTextEditingController,
                  hintText: "Phone Number",
                ),
                const DefaultSize(),
                CustomTextField(
                  textEditingController: _passwordTextEditingController,
                  hintText: "Password",
                  obsecure: true,
                  isPasswordText: true,
                ),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                CustomButton(
                  callback: (){

                    Get.to( () =>  VerifyPhoneNumber(
                      uName: _usernameTextEditingController.text,
                      uEmail:_emailTextEditingController.text,
                      uPhoneNumber: _phoneNumberTextEditingController.text,
                      uPassword: _passwordTextEditingController.text,
                      isSocialLogin:false,
                      uUrl: 'null',
                      uId: 'null',
                      socialSignupTypeId: '0' ,
                    ));

                    // MyApp.pushRoute(VerifyPhoneNumber(
                    //   uName: _usernameTextEditingController.text,
                    //   uEmail:_emailTextEditingController.text,
                    //   uPhoneNumber: _phoneNumberTextEditingController.text,
                    //   uPassword: _passwordTextEditingController.text,
                    //   isSocialLogin:false,
                    //   uUrl: 'null',
                    //   uId: 'null',
                    //   socialSignupTypeId: '0' ,
                    // ));
                  },
                  title: "Sign Up",
                ),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                const Center(
                  child: Text(
                    "By clicking Sign up you agree to the following\nTerms and Conditions without reservation",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
