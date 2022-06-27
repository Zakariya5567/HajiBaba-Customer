
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final int position;

  const MenuCard(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.assetImage,
      @required this.position})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        if(position == 0){


            final isUserAlreadyLoginIn = await LocalData().getIsLoginFromShareedPref();

            if(isUserAlreadyLoginIn != null && isUserAlreadyLoginIn){

              Get.offAll(()=>BottomNavBar());

            }else{


              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginRegistrationScreen(),
                ),
              );

            }


        }else if(position == 1){

          _launchURL();

        }
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => IntroductionScreen(),
        //   ),
        // );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.screenWidth * .03,
          ),
        ),
        child: SizedBox(
          height: SizeConfig.screenHeight * .15,
          width: SizeConfig.screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .05,
              vertical: SizeConfig.screenWidth * .04,
            ),
            child: Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth * .2,
                  height: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    color: Constant.primaryColor,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.screenWidth * .02,
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: SizeConfig.screenWidth * .12,
                      height: SizeConfig.screenWidth * .12,
                      child: Image.asset(assetImage),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * .03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenWidth * .01,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenWidth * .035,
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.screenWidth * .03,
                    ),

                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * .03,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.hbhonline.co.uk/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
