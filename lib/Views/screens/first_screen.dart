import 'dart:ui';

import 'package:baba/Views/widgets/heading_text.dart';
import 'package:baba/Views/widgets/menu_card.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  AssetImage backgroundImage;

  @override
  void initState() {
    super.initState();
    backgroundImage = const AssetImage(Assets.MEAT_BACKGROUND);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage, context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Constant.greyColor.withOpacity(0.6),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * .05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: SizeConfig.screenHeight * .2,
                  // ),

                  Text(
                    "Choose an Option",
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth * .07,
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  ),
                  //
                  SizedBox(
                    height: SizeConfig.screenHeight * .1,
                  ),

                  // const MenuCard(
                  //   title: "Quality",
                  //   subtitle: "You can trust",
                  //   assetImage: Assets.STAR_ICON,
                  // ),
                  // SizedBox(
                  //   height: SizeConfig.screenHeight * .01,
                  // ),
                  const MenuCard(
                    title: "Click and collect Available",
                    subtitle: "with unlimited slots",
                    assetImage: Assets.CLICK_ICON,
                    position: 0,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .02,
                  ),
                  const MenuCard(
                    title: "Free Delivery to mainland uk",
                    subtitle: "On Order Above £70",
                    assetImage: Assets.DELIVERY_ICON,
                    position: 1,
                  ),
                  // SizedBox(
                  //   height: SizeConfig.screenHeight * .1,
                  // ),
                  // const MenuCard(
                  //   title: "Return Policy",
                  //   subtitle: "No Questions Asked",
                  //   assetImage: Assets.STAR_ICON,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }




}
