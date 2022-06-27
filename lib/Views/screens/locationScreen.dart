import 'package:baba/ViewModel/location_viewModel.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LocationScreen extends StatelessWidget {
  LocationViewModel _locationViewModel = Get.put(LocationViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.greyColor,
      body: Center(child: Container(
        width: 326.w,
        height: 460.h,
        padding: EdgeInsets.all(10.0),
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
              'Enable Location',
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                color: const Color(0xFF242938),
                fontWeight: FontWeight.w700,
                // height: 1.46,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'We need to access your location in order to serve you from your closest store.',
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
                  var posittion = await _determinePosition();
                  print(posittion.latitude.toString());
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  var userid = prefs.getString('userId');
                  _locationViewModel.addLocation(userid.toString(), posittion.latitude.toString(), posittion.longitude.toString());
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
      )),
    );
  }

   showDialog(BuildContext context) {
     // BuildContext context;
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
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
                        var posittion = await _determinePosition();
                        print(posittion.latitude.toString());
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        var userid = prefs.getString('userId');
                        _locationViewModel.addLocation(userid.toString(), posittion.latitude.toString(), posittion.longitude.toString());
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



    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
