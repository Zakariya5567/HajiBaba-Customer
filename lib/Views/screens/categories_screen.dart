import 'package:baba/Views/component/categories_grid.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/component/slider.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class CategoriesScreen extends StatelessWidget {

  final bool isFromBottomNav;

  CategoriesScreen({this.isFromBottomNav = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: Container(
            width: 375.w,
            height: 90.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 3.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Center(
              child: ListTile(
                leading: InkWell(
                    onTap: () {
                      if(isFromBottomNav){
                        final controller = Get.find<NavbarController>();
                        controller.onSelectPage(0);
                        controller.bottomNavigationKey.currentState.setPage(0);
                      }else{
                        Get.back();
                      }

                    },
                    child: Image.asset(Assets.ArrowBack)
                ),
                horizontalTitleGap: 40.w,
                title: Text(
                  "Choose Category",
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    color: Constant.blueColor,
                    fontWeight: FontWeight.w600,
                    // height: 3.61,
                  ),
                ),
              ),
            )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         InkWell(
          //           onTap: ()=>Get.back(),
          //             child: Image.asset(Assets.ArrowBack)),
          //         Text(
          //           title,
          //           style: GoogleFonts.poppins(
          //             fontSize: 18.0,
          //             color: const Color(0xFF242938),
          //             fontWeight: FontWeight.w600,
          //             // height: 3.61,
          //           ),
          //         ),
          //         Text(''),
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              catSlider2(),
              categoriesGrid(),
            ],
          ),
        ),
      ),

    );
  }
}
