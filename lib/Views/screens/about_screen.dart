import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: customAppBar(''),
        body: Center(
          child: Padding(
            padding:  EdgeInsets.all(16.r),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 28.0,
                            color: Constant.darkBlueColor,
                            // height: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text: 'About \n',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Haji Baba',
                              style: GoogleFonts.poppins(
                                color: Constant.darkOrange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(Assets.MeatShopIcon,),
              Container(
                width: 375.w,
                height: 299.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Constant.greyColor,
                ),
                child: Column(
                  children: [
                    Text(
                      'Lorem Ipsum Is Simply Dummy Text Of The\nPrinting And Typesetting Industry. Lorem\nIpsum Is Simply Dummy Text Of The Printing\nAnd Typesetting Industry. Lorem Ipsum Is \nSimply Dummy Text Of The Printing And \nTypesetting Industry.',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Constant.darkBlueColor,
                        height: 1.79,
                      ),
                    ),
                    Text(
                      'Lorem Ipsum Is Simply Dummy Text Of The\nPrinting And Typesetting Industry. Lorem\nIpsum Is Simply Dummy Text Of The Printing\nAnd Typesetting Industry.',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Constant.darkBlueColor,
                        height: 1.79,
                      ),
                    )
                  ],
                ),
              )
                ],
              ),
            ),
          ),
        ),
      );
  }
}


