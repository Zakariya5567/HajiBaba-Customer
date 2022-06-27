import 'package:baba/Views/screens/choose_delivery_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryAddressWidget extends StatefulWidget {
  @override
  _DeliveryAddressWidgetState createState() => _DeliveryAddressWidgetState();
}

class _DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  // SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h,bottom: 16.h),
      child: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: 349.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Constant.greyColor,
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xFFBDBABA),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '+ Add New Address',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,

                        color: Constant.darkBlueColor,

                        fontWeight: FontWeight.w500,

                        // height: 4.64,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 345.w,
                  height: 228.h,
                  margin: EdgeInsets.only(top: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Constant.darkBlueColor.withOpacity(0.16),
                        offset: Offset(0, 0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 163.0,
                              height: 83.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Home Address',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Constant.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                        // height: 3.61,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '108 Front St, Henllan\nEngland',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      color: Constant.darkBlueColor,
                                      // height: 1.56,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 2,),
                      Padding(
                        padding:  EdgeInsets.all(10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 163.0,
                              height: 83.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Office Address',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Constant.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                        // height: 3.61,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '108 Front St, Henllan\nEngland',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      color:Constant.darkBlueColor,
                                      // height: 1.56,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 345.w,
                  height: 115.h,
                  margin: EdgeInsets.only(top: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Constant.darkBlueColor.withOpacity(0.16),
                        offset: Offset(0, 0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(10.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 163.0,
                          height: 83.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Billing Address',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    color: Constant.darkBlueColor,
                                    fontWeight: FontWeight.w600,
                                    // height: 3.61,
                                  ),
                                ),
                              ),
                              Text(
                                '108 Front St, Henllan\nEngland',
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  color: Constant.darkBlueColor,
                                  // height: 1.56,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                left: 10.w,
                right: 10.w,
                bottom: 0,
                child: InkWell(
                  onTap: () {
                     Get.to(() => ChooseDelivery());
                  },
                  child: Container(
                    // alignment: Alignment(0.0, 0.04),
                    width: 326.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constant.mainOrangeColor,
                    ),
                    child: Center(
                      child: Text(
                        'Proceed to Payment',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: Constant.greyColor,
                          // height: 1.56,
                        ),
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
