import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget getHeadingTitle(
    String title,
    ) {
  BuildContext context;
  return Padding(
    padding:  EdgeInsets.only(top: 10.h, bottom: 10.h,right: 8.w,left: 8.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$title',
              style: GoogleFonts.poppins(
                fontSize: 16.0.sp,
                color: Constant.darkBlueColor,
                fontWeight: FontWeight.w700,
                // height: 4.06,
              ),
            )

          ],
        ),
      ],
    ),
  );
}