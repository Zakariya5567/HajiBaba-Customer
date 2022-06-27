import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(''),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 5.h,
                right: 0.w,
                child: Image.asset(Assets.HajiBabaLogo,height: 60.h,width: 60.w,)),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 35.h,left: 16.w),
                child: Column(
                  children: [
                    Text(
                      'Terms & \nConditions',
                      style: GoogleFonts.poppins(
                        fontSize: 28.0,
                        color: Constant.darkBlueColor,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      )),
                        SizedBox(
                          width: 306.0,
                          height: 624.0,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: Constant.darkBlueColor,
                              height: 1.71,
                            ),
                          ),
                        ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
