import 'package:baba/Views/component/customAppBar2.dart';

import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2('My Wish List'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  width: 349.w,
                  height: 190.h,
                  padding: EdgeInsets.all(8.r),
                  margin: EdgeInsets.all(8.r),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                              Assets.Bin
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(Assets.WishListItem),
                          Column(
                            children: [
                              Text.rich(
                                TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.0,
                                    color: Constant.darkBlueColor,
                                    // height: 1.53,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Chopped Meat - ',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '1 KG',
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 128.0,
                                height: 20.0,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '£258',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        color: Constant.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                        // height: 1.64,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Spacer(flex: 12),
                                    Align(
                                      alignment: Alignment(0.0, -0.33),
                                      child: Text(
                                        '£430',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                          decoration: TextDecoration.lineThrough,
                                          // height: 1.92,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Spacer(flex: 8),
                                    Align(
                                      alignment: Alignment(0.0, -0.33),
                                      child: Text(
                                        '40% off',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.0,
                                          color: Constant.darkOrange,
                                          fontWeight: FontWeight.w600,
                                          // height: 1.92,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Divider(thickness: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Constant.mainOrangeColor,
                            ),
                            child: Text(
                              '+ Add to Cart',
                              style: GoogleFonts.poppins(
                                fontSize: 10.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                height: 2.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
