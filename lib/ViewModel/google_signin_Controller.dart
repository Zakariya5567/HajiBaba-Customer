import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';



class HomeController extends GetxController {
  GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    googleSign = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      // Get.to(()=>BottomNavBar());
      // Get.offAllNamed(Routes.WELCOME, arguments: firebaseAuth.currentUser);
    } else {
      // Get.to(()=>BottomNavBar());
      // Get.offAllNamed(Routes.LOGIN);
    }
  }
}
