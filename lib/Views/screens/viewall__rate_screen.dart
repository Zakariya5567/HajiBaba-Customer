
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ViewAllRate extends StatelessWidget {
  const ViewAllRate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: Constant.darkOrange,
        title: Text("All Review",style: GoogleFonts.poppins(
          fontSize: 18.0,
          color: Constant.darkBlueColor,
          fontWeight: FontWeight.w600,
        ),),
      ),
    );
  }
}
