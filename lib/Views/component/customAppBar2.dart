import 'package:baba/Views/screens/filters_screen.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


Widget customAppBar2(String title){
  return PreferredSize(
    preferredSize: Size.fromHeight(150.h),

    child: Container(
      width: 375.w,
      height: 163.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: InkWell(
                onTap: ()=>Get.back(),
                child: Image.asset(Assets.ArrowBack)),
            horizontalTitleGap: 40.w,
            title: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                color: Constant.darkBlueColor,
                fontWeight: FontWeight.w600,
                // height: 3.61,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40.h,
                  width: 288.w,
                  child: CustomTextField(hintText: 'Search',prefixIcon: Icon(Icons.search),)),
              // SizedBox(width: 5.w,),
              // InkWell(
              //   onTap: ()=>Get.to(()=>Filters()),
              //     child: Image.asset(Assets.Filter)
              // )
            ],
          ),
        ],
      ),
    ),
  );
}