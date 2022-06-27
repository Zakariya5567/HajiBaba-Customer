import 'package:baba/Views/component/customAppBar2.dart';
import 'package:baba/utils/constant.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Filters extends StatefulWidget {
  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2('Filters'),
      body: Column(
        children: [
        Center(
          child: Container(
          width: 349.w,
          height: 292.h,
            margin: EdgeInsets.only(top: 12.h),
            padding: EdgeInsets.all(8.r),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Text(
                      'Category',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        color: Constant.greyColor,
                        fontWeight: FontWeight.w500,
                        // height: 4.06,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  // Group: Group 4402
                  Container(
                  alignment: Alignment.center,
                  width: 99.w,
                  height: 35.h,
                    // margin: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constant.mainOrangeColor,
                  ),
                  child: Text(
                    'Pouttary',
                    style: GoogleFonts.poppins(
                      fontSize: 13.0,
                      color: Colors.white,
                      // height: 5.0,
                    ),
                  ),
                ),
                    Container(
                      alignment: Alignment(0.16, 0.0),
                      width: 99.w,
                      height: 35.h,
                      // margin: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          width: 1.0,
                          color: Constant.mainOrangeColor,
                        ),
                      ),
                      child: Text.rich(
                        TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            color: Constant.darkBlueColor,
                            // height: 5.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'Mutton',
                            ),
                            TextSpan(
                              text: '  ',
                              style: GoogleFonts.poppins(
                                color: Constant.greyColor,
                              ),
                            ),
                            TextSpan(
                              text: '+',
                              style: GoogleFonts.poppins(
                                color: Constant.mainOrangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment(0.16, 0.0),
                      width: 99.w,
                      height: 35.h,
                      // margin: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          width: 1.0,
                          color: Constant.mainOrangeColor,
                        ),
                      ),
                      child: Text.rich(
                        TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            color: Constant.darkBlueColor,
                            // height: 5.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'Lamb',
                            ),
                            TextSpan(
                              text: '  ',
                              style: GoogleFonts.poppins(
                                color: Constant.greyColor,
                              ),
                            ),
                            TextSpan(
                              text: '+',
                              style: GoogleFonts.poppins(
                                color: Constant.mainOrangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  SizedBox(width: 8.w,),

                    Container(
                      alignment: Alignment(0.16, 0.0),
                      width: 99.w,
                      height: 35.h,
                      // margin: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          width: 1.0,
                          color: Constant.mainOrangeColor,
                        ),
                      ),
                      child: Text.rich(
                        TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            color: Constant.darkBlueColor,
                            // height: 5.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'Beef',
                            ),
                            TextSpan(
                              text: '  ',
                              style: GoogleFonts.poppins(
                                color: Constant.greyColor,
                              ),
                            ),
                            TextSpan(
                              text: '+',
                              style: GoogleFonts.poppins(
                                color: Constant.mainOrangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Container(
                      alignment: Alignment(0.16, 0.0),
                      width: 99.w,
                      height: 35.h,
                      // margin: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          width: 1.0,
                          color: Constant.mainOrangeColor,
                        ),
                      ),
                      child: Text.rich(
                        TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            color: Constant.darkBlueColor,
                            // height: 5.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'Fish',
                            ),
                            TextSpan(
                              text: '  ',
                              style: GoogleFonts.poppins(
                                color: Constant.greyColor,
                              ),
                            ),
                            TextSpan(
                              text: '+',
                              style: GoogleFonts.poppins(
                                color: Constant.mainOrangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Price Range',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Constant.greyColor,
                    fontWeight: FontWeight.w500,
                    // height: 4.06,
                  ),
                ),
      RangeSlider(
        values: _currentRangeValues,
        max: 100,
        divisions: 5,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Apply Filters',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Constant.mainOrangeColor,
                        fontWeight: FontWeight.w600,
                        // height: 4.64,
                      ),
                    ),
                  ],
                )


              ],
            ),
      ),
        ),

        ],
      ),

    );
  }
}
