

import 'package:baba/ViewModel/appimages_viewmodel.dart';
import 'package:baba/ViewModel/location_viewModel.dart';
import 'package:baba/ViewModel/login_controller.dart';
import 'package:baba/ViewModel/socialLogin_ViewModel.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/locationScreen.dart';
import 'package:baba/Views/screens/login_screen.dart';
import 'package:baba/Views/screens/socialSignup.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/Views/widgets/menu_card.dart';
import 'package:baba/main.dart';

import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRegistrationScreen extends StatefulWidget {
  const LoginRegistrationScreen({Key key}) : super(key: key);

  @override
  State<LoginRegistrationScreen> createState() =>
      _LoginRegistrationScreenState();
}

class _LoginRegistrationScreenState extends State<LoginRegistrationScreen> {
  AssetImage backgroundImage;

  @override
  void initState() {
    super.initState();
    backgroundImage = const AssetImage(Assets.LOGIN_REGISTRATION_BACKGROUND);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage, context);
  }
  LoginController _controller = Get.put(LoginController());
  final SocialLoginViewModel _socialLoginViewModel = Get.put(SocialLoginViewModel());

  var loading = false;

  _loginwithfacebook() async {

    try{

      final facebookLoginResult = await FacebookAuth.instance.login();

      final userData  = await FacebookAuth.instance.getUserData();
      print('useDattttaaaa'+userData.toString());
      final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      print('user id data'+ userData["id"].toString());

      await _socialLoginViewModel.socialLogin(userData["id"].toString());
      if(_socialLoginViewModel.issocial==1){
        LocalData _localData = LocalData();
        _localData.addIsLoginToShareedPref(true);
        _localData.addIsSocialLoginToShareedPref(true);
        Get.off(()=> BottomNavBar());

      }
      else{
        Get.off(()=>SocialSignUpScreen(
          uName: userData["name"].toString(),
          uEmail: userData["email"].toString(),
          uUrl: userData["picture"]["data"]["url"].toString(),
          uId: userData["id"].toString(),
          socialSignupTypeId: '1',)
        );
      }

    } on Exception catch(e){
      print("Facebook error: ${e.toString()}");

    } finally{
      setState(() {
        loading = false;

      });
    }

  }

  LocationViewModel _locationViewModel = Get.put(LocationViewModel());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AppImagesViewModel>( // specify type as Controller
        init: AppImagesViewModel(), // intialize with the Controller
        builder: (value) => Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image:NetworkImage(value.imagesSplash4.data.toString()),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: value.imagesSplash4?.data?.toString(),
                placeholder: (context, url) => CustomWidget.rectangular(height: 1.sh, width: 1.sw),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Constant.darkBlueColor.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * .05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "LOVE\nTO MEAT\nYOU",
                  //   style: TextStyle(
                  //     fontSize: SizeConfig.screenWidth * .1,
                  //     height: SizeConfig.screenHeight * .0015,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: SizeConfig.screenHeight * .05,
                  // ),
                  // const Text(
                  //   "Set exact location to find the\nright store near you",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 11,
                  //   ),
                  // ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.5,
                  ),
                  CustomButton(
                    callback: () {
                      // showDialog();
                      MyApp.navigatorKey.currentState.push(
                        MaterialPageRoute(
                          builder: (_) =>
                          // MenuCard(title: 'meue card',subtitle: 'subtile',assetImage: Assets.FeatureCuts1,)
                          LoginScreen(),
                        ),
                      );
                    },
                    title: "Log In",
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .02,
                  ),
                  CustomButton(
                    callback: () async{
                      await _loginwithfacebook();
                    },
                    title: "SignIn with facebook",
                    color: Constant.blueColor,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .02,
                  ),
                  CustomButton(
                    callback: ()async {
                      await _controller.login();
                    },
                    title: "SignIn with google",
                    color: Constant.redColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }


}
