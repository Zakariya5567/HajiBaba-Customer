import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget getHeading(
    String title, VoidCallback onClick
    ) {
  BuildContext context;
  return Padding(
    padding:  EdgeInsets.only(top: 10.h, bottom: 10.h,right: 8.w,left: 8.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '$title',
              style: GoogleFonts.poppins(
                fontSize: 14.0,
                color: Constant.darkBlueColor,
                fontWeight: FontWeight.w700,
                height: 1.64,
              ),
              textAlign: TextAlign.center,
            ),            InkWell(
                child: Text(
                  'View All',
                  style: GoogleFonts.poppins(
                    fontSize: 12.0,
                    color: Constant.darkBlueColor,
                    height: 1.92,
                  ),
                  textAlign: TextAlign.center,
                ),
                splashColor:Constant.greyColor.withOpacity(0.2),
                onTap: onClick
            ),
          ],
        ),
      ],
    ),
  );
}