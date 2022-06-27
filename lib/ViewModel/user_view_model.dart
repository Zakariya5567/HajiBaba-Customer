import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/Core/Services/socialSignup_Service.dart';
import 'package:baba/Views/component/customerfullScreenDialoag.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/locationScreen.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/Views/screens/login_screen.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/utils/constant.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:platform/platform.dart';

enum UserEnums { Logged, Logout, Waiting, Error, Initial }

class UserViewModel extends GetxController {
  ApiServices _apiServices = ApiServices();
  LocalData _localData = LocalData();
  SocialSignup_ApiServices _socialSignup_ApiServices = SocialSignup_ApiServices();
  // final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();


  UserEnums userEnums = UserEnums.Initial;

  String name;
  String email;
  String password;
  var responsedata;

  // UserModel user;

  // addKeyToShareedPref(String key, String value) async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  //   _sharedPreferences.setString(key, value);
  //   var userid = _sharedPreferences.getString('userId');
  //   print('id saved suceess'+userid.toString());
  // }
  void resetPassword(phoneNumber, newPassword) {
    print(phoneNumber.toString());
    userEnums = UserEnums.Waiting;
    update();
    _apiServices.resetPassword(phoneNumber, newPassword).then((value) {
      if (value == false) {
        userEnums = UserEnums.Error;
        debugPrint('There was a problem with user login....');
      } else {
        // user = UserModel.fromJson(value);
        //  addKeyToShareedPref('userId', user.objectId);
        update();
        CustomFullScreenDialog.cancelDialog();
        Get.offAll(()=>LoginScreen()
        ); // it's delete all pages at navigate stack
      }
    });
  }
  void login(apiEmail, apiPassword) {
    print(apiEmail);
    userEnums = UserEnums.Waiting;
    update();
    _apiServices.login(apiEmail, apiPassword).then((value) {
      if (value == false) {
        userEnums = UserEnums.Error;
        debugPrint('There was a problem with user login....');
      } else {
        if(value['data']!=null){

          LocalData _localData = LocalData();

          _localData.addKeyToShareedPref('userId', value["data"]["id"]);

          _localData.addIsLoginToShareedPref(true);

          final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

          firebaseMessaging.requestPermission();

          firebaseMessaging.getToken().then((token) async {

            print('push token: $token');

            if (token != null) {

              if(value['data']['firebaseDeviceId'] == null){

                await _apiServices.updateFirebaseDeviceId(token, value["data"]["id"]);

              }else{

                if(value['data']['firebaseDeviceId'] != token){

                  await _apiServices.updateFirebaseDeviceId(token, value["data"]["id"]);

                }

              }

              bool isAndroid = true;

              if(Platform.android != 'android'){

                isAndroid = false;

              }

              await _apiServices.updateCustomerDeviceInfo(isAndroid,value["data"]["id"]);

            }

          }).catchError((err) {

            Get.log("firebaseMessaging error: $err");

          });

          customerDevicePhysicalAddress(value["data"]["id"]);

          update();

          Get.offAll(()=>BottomNavBar());

        }
        else{

          Get.snackbar('LOGIN ALERT','Wrong Credentials');

        }
      }
    });
  }

  void customerDevicePhysicalAddress(customerId) async {

    try {

      String identifier;
      final DeviceInfoPlugin deviceInfoPlugin =  DeviceInfoPlugin();
      if (Platform.android == 'android') {
        final build = await deviceInfoPlugin.androidInfo;
        identifier = build.androidId;  //UUID for Android
      } else {
        final data = await deviceInfoPlugin.iosInfo;
        identifier = data.identifierForVendor;  //UUID for iOS
      }

      if(identifier != null){

        await _apiServices.updateCustomerDevicePhysicalAddress(identifier,customerId);

      }

    } on PlatformException {

      print('Failed to get platform version');

    }

  }


  void register(String fullName,String email,String phoneNumber,String pssword,bool isSocailSignUp,String socialLoginId,String deviceId,int socialSignupTypeId,String goolgeProfileImgUrl) async{
    print(fullName);
    print(email);
    // print(apiPassword);

    userEnums = UserEnums.Waiting;
    update();
    if(isSocailSignUp){
      await _socialSignup_ApiServices.register(fullName,email,phoneNumber,pssword,isSocailSignUp,socialLoginId,deviceId,socialSignupTypeId,goolgeProfileImgUrl).then((value) {
        if (value == false) {
          userEnums = UserEnums.Error;

          debugPrint('There was a problem with user register....');
        } else {
          responsedata=value;
          // user = UserModel.fromJson(value);
          _localData.addKeyToShareedPref('userId', responsedata["data"]["id"]);
          _localData.addIsLoginToShareedPref(true);
          _localData.addIsSocialLoginToShareedPref(true);


          // update();
          // showDialog();
          CustomFullScreenDialog.cancelDialog();

          Get.offAll(()=>
              LocationScreen()
          );
        }
      });

    }
    else{

      await _apiServices.register(fullName,email,phoneNumber,pssword,isSocailSignUp,socialLoginId,deviceId,socialSignupTypeId,goolgeProfileImgUrl).then((value) {
        if (value == false) {
          userEnums = UserEnums.Error;

          debugPrint('There was a problem with user register....');
        } else {
          // user = UserModel.fromJson(value);
          _localData.addKeyToShareedPref('userId', value["data"]["id"]);
          _localData.addIsLoginToShareedPref(true);
          _localData.addIsSocialLoginToShareedPref(false);

          // update();
          // showDialog();

          Get.offAll(()=>
              LocationScreen()
          );
        }
      });

    }

  }
}
