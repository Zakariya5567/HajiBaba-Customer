
import 'package:baba/Views/component/get_products_by_categoryid_grid.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/component/today_offer_grid.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baba/utils/constant.dart';

class selectedCategory extends StatelessWidget {
  selectedCategory({Key key,this.title }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('$title'),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                      width: 288.w,
                      child: CustomTextField(hintText: 'Search',prefixIcon: Icon(Icons.search),)),
                  // Image.asset(Assets.Filter)
                ],
              ),
              GetProductsByCategoryId(),
            ],
          ),
        ),
      ),

    );
  }
}
