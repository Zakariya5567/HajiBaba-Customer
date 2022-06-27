

import 'package:baba/ViewModel/google_signin_Controller.dart';
import 'package:baba/ViewModel/socialLogin_ViewModel.dart';
import 'package:baba/Views/component/customerfullScreenDialoag.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/socialSignup.dart';
import 'package:baba/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  SocialLoginViewModel _socialLoginViewModel = Get.put(SocialLoginViewModel());
  // Get.find<HomeController>();
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future login() async {
    CustomFullScreenDialog.showDialog();
    GoogleSignInAccount googleSignInAccount =
    await homeController.googleSign.signIn();
    if (googleSignInAccount == null) {
      CustomFullScreenDialog.cancelDialog();
    } else {
      print('acount holder id' +googleSignInAccount.id.toString());
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await homeController.firebaseAuth.signInWithCredential(oAuthCredential);
      CustomFullScreenDialog.cancelDialog();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userid = prefs.getString('userId');
      print('user id from shared prefrences ${userid}');
      print('social login id of gmail'+googleSignInAccount.id.toString());
      await _socialLoginViewModel.socialLogin(googleSignInAccount.id.toString());

      if(_socialLoginViewModel.issocial==1){
        LocalData _localData = LocalData();
        _localData.addIsLoginToShareedPref(true);
        _localData.addIsSocialLoginToShareedPref(true);
        Get.off(()=>BottomNavBar());
      }
      else{
        Get.off(()=> SocialSignUpScreen(uName: googleSignInAccount.displayName.toString(),
            uEmail: googleSignInAccount.email.toString(),uPassword: 'null',uUrl: googleSignInAccount.photoUrl.toString(),
            uId: googleSignInAccount.id.toString(),socialSignupTypeId: '2'));

      }



    }
  }
}
