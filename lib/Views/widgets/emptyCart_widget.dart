import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget EmptyCart()=>Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
     width: 200.w,
     height: 200.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Constant.greyColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.16),
          offset: Offset(0, 0),
          blurRadius: 6.0,
        ),
      ],
    ),
      child: Center(
        child: SvgPicture.asset(
          Assets.Cart,
          // height: 50,width: 50,
          // semanticsLabel: 'Acme Logo'
        ),
      ),
  ),
      Text(
        'Your Cart Is Empty',
        style: GoogleFonts.poppins(
          fontSize: 20.0,
          color: Constant.greyColor,
          fontWeight: FontWeight.w600,
          height: 3.25,
        ),
      ),
      Text(
        'Add Some Items In Your Cart',
        style: GoogleFonts.poppins(
          fontSize: 16.0,
          color: Constant.greyColor,
          height: 4.06,
        ),
      ),
    ],
  ),
);