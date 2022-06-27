import 'package:baba/Views/screens/add_address_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget EmptyDeliveryAddress()=>Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding:  EdgeInsets.only(bottom: 5.h),
        child: SvgPicture.asset(
          Assets.Delivery,
          // height: 50,width: 50,
          // semanticsLabel: 'Acme Logo'
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Text(
          'You have not any address',
          style: GoogleFonts.poppins(
            fontSize: 20.0,
            color: const Color(0xFFBDBABA),
            fontWeight: FontWeight.w600,
            height: 3.25,
          ),
        ),
      ),
      InkWell(
        onTap: () {
           Get.to(() => AddAdress());
        },
        child: Container(
          alignment: Alignment(0.0, 0.04),
          width: 326.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Constant.mainOrangeColor,
          ),
          child: Text(
            '+ Add New Addresss',
            style: GoogleFonts.poppins(
              fontSize: 16.0,
              color: Constant.greyColor,
              height: 1.56,
            ),
          ),
        ),
      )

    ],
  ),
);