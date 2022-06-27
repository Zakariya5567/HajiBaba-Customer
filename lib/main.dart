import 'package:baba/ViewModel/appimages_viewmodel.dart';
import 'package:baba/Views/screens/splash_screen.dart';
import 'package:baba/get_services/boarding_service.dart';
import 'package:baba/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'get_services/cart_controller.dart';

const String publishableKey = "pk_test_51KVe8jK1QG2XGj2iPoxpfzA0kXgEPzUxXSt87SYCaK4uClAdnsOzeaLtLpHqVL33XBnEVTAfXowBbJTuruP7QGaV00IYctOU9g";


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();

  // Stripe.publishableKey = publishableKey;
  //
  // await Stripe.instance.applySettings();

  // StripePayment.setOptions(StripeOptions(
  //     publishableKey: "pk_test_51JQqfwSJTPoFby3pgcnkJVH7Kg8XEdcv4W5Sic0iiIrl7knziNdK489wUyaBdp6FL1YPcXmHq6UmfSNFRr4lJYUQ00pTPpDZAV",
  //     merchantId: "Test",
  //     androidPayMode: 'test'));

  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
  ]);

  await Get.putAsync(() => BoardingService().init());

  Get.put(AppImagesViewModel(),permanent: true);

  Get.put(CartController(),permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

        designSize: const Size(375, 844),

        builder: ()=> GetMaterialApp(

         navigatorKey: navigatorKey,

         debugShowCheckedModeBanner: false,

         title: 'Haji Baba',

         theme: ThemeData(

          primarySwatch: Constant.primarySwatchColor,

          fontFamily: 'Poppins',

          appBarTheme: AppBarTheme(

          backgroundColor: Theme.of(context).scaffoldBackgroundColor,

          actionsIconTheme: const IconThemeData(

            color: Colors.black,

          ),

          elevation: 0,

          iconTheme: const IconThemeData(

            color: Colors.black,

          ),
        ),
      ),
          home: const SplashScreen(),

        )
    );

  }

  static Future pushRoute(Widget widget) {

    return MyApp.navigatorKey.currentState.push(MaterialPageRoute(builder: (_) => widget));

  }

}
