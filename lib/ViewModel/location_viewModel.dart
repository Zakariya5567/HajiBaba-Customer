import 'package:baba/Core/Services/api_locationService.dart';
import 'package:baba/Core/Services/api_service.dart';
import 'package:baba/Views/screens/add_store_screen.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';


class LocationViewModel extends GetxController {
  ApiLocationServices _apiServices = ApiLocationServices();

  void showLocationDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      // context: context,
      pageBuilder: (_, __, ___) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 326.w,
              height: 460.h,
              margin: EdgeInsets.only(bottom: 140, left: 12, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                      Assets.LocationIcon),
                  Text(
                    'Enable Your Location',
                    style: GoogleFonts.poppins(
                      fontSize: 24.0,
                      color: const Color(0xFF242938),
                      fontWeight: FontWeight.w700,
                      // height: 1.46,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Please allow to use your location to\nshow nearby restaurant on the map.',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      color: const Color(0xFF242938),
                      // height: 1.44,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomButton(
                      callback: ()async {
                        Position position = await _determinePosition();
                        print(position.latitude.toString());
                        // userViewModel.login(_emailTextEditingController.text,_passwordTextEditingController.text);

                        // MyApp.pushRoute(
                        //   BottomNavBar(),
                        // );
                      },
                      title: "Enable Location",
                    ),
                  ),

                ],
              ),
            )
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;



    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void addLocation(String uid, String lat,String lng) {
    print(uid.toString());
    _apiServices.addLocation(uid,lat,lng).then((value) {
      if (value == false) {
        debugPrint('There was a problem with location api....');
      } else {
        update();
        Get.offAll(()=>AddStoreScreen()); // it's delete all pages at navigate stack
      }
    });
  }


}
