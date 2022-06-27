import 'dart:async';

import 'package:baba/Core/Bindings.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/Views/screens/onboarding_screens.dart';

import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AssetImage splashBorder;

  Image logoText;

  Image meatImage;

  @override
  void initState() {
    super.initState();



    splashBorder = const AssetImage(Assets.SPLASH_BORDER);

    logoText = Image.asset(Assets.LOGO_TEXT);

    meatImage = Image.asset(Assets.MEAT);

    Timer(const Duration(seconds: 2), ()async{

      Get.to(()=>const HomeScreen3());

      // LocalData _localData = LocalData();
      // var islogin = await _localData.getIsLoginFromShareedPref();
      // if(islogin.isNullOrBlank){
      //   Get.to(()=>HomeScreen());
      // }else{
      //   if(islogin){
      //     Get.to(()=>BottomNavBar() );
      //   }else{
      //     Get.to(()=> LoginRegistrationScreen() );
      //   }
      // }

    });

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(splashBorder, context);
    precacheImage(logoText.image, context);
    precacheImage(meatImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: splashBorder,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * .6,
                height: SizeConfig.screenWidth * .6,
                child: logoText,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * .02,
              ),
              SizedBox(
                width: SizeConfig.screenWidth * .6,
                height: SizeConfig.screenWidth * .8,
                child: meatImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
