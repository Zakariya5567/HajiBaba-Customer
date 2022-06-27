import 'package:baba/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPropertyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

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
      child: DefaultTabController(
          length: 3, // length of tabs
          initialIndex: 0,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Constant.greenColor,
                    unselectedLabelColor: Constant.darkBlueColor,
                    tabs: [
                      Tab(text: 'Details'),
                      Tab(text: 'Discription'),
                      Tab(text: 'Other'),
                      // Tab(text: 'Other'),
                    ],
                  ),
                ),
                Container(
                    height: 145.h, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Constant.greyColor, width: 0.5))),
                    child: TabBarView(children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Group: Group 943

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Quantity',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,

                                  ),
                                ),
                                Text(
                                  '1 Kg',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Shelf Life',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,

                                  ),
                                ),
                                Text(
                                  '12 Months',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Organic',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,

                                  ),
                                ),
                                Text(
                                  'Spanish',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Flavor',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,

                                  ),
                                ),
                                Text(
                                  'Plain',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Pack Of',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Constant.darkBlueColor,
                                  ),
                                ),
                                Text(
                                  '01',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color:Constant.darkBlueColor,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'Lorem Ipsum Is Simply Dummy Text Of The\nPrinting And Typesetting Industry. Lorem\nIpsum Is Simply Dummy Text Of The Printing\nAnd Typesetting Industry.',
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: Constant.darkBlueColor,
                              height: 1.79,
                            ),
                          )
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 3',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      // Container(
                      //   child: Center(
                      //     child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      //   ),
                      // ),
                    ]))
              ])),
    );
  }
}
