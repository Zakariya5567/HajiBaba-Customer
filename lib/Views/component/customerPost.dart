import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customerPost(){
  return Container(
    child: ListView(
      children: [
      Container(
      width: 326.0,
      height: 122.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFFF1F2F6),
      ),
        child: Column(
          children: [
            Row(
              children: [
        Text(
        'Tanzila Javed',
          style: GoogleFonts.poppins(
            fontSize: 12.0,
            color: Constant.darkBlueColor,
            fontWeight: FontWeight.w600,
            height: 1.92,
          ),
          textAlign: TextAlign.center,
        ),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Constant.primaryColor,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            )
          ],
        ),
    ),
      ],
    ),
  );
}