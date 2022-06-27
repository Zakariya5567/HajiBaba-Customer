import 'package:baba/ViewModel/appimages_viewmodel.dart';
import 'package:baba/ViewModel/user_view_model.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/forgot_password.dart';
import 'package:baba/Views/screens/signup_screen.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/Views/widgets/default_size.dart';
import 'package:baba/Views/widgets/heading_text.dart';
import 'package:baba/main.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AssetImage picture1, picture2, picture3;
  @override
  void initState() {
    super.initState();
    picture1 = const AssetImage(Assets.LOGIN_BACKGROUND_1);

    _loadImages();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(picture1, context);
  }

  final TextEditingController _emailTextEditingController =
          TextEditingController(),
      _passwordTextEditingController = TextEditingController();
  UserViewModel userViewModel = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: GetBuilder<AppImagesViewModel>( // no need to initialize Controller ever again, just mention the type
          //     builder: (value) => Container(
          //       height: SizeConfig.screenHeight * 1,
          //       width: SizeConfig.screenWidth,
          //       decoration: const BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage(Assets.LOGIN_BACKGROUND_1),
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //     ),
          //   ),
          //
          // ),

          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [

                CarouselSlider(
                  options: CarouselOptions(
                    // height: SizeConfig.screenHeight * 1,
                    // height: 200,
                    autoPlay: true,
                    aspectRatio: 1.5,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    // enlargeStrategy: CenterPageEnlargeStrategy.height,

                    // viewportFraction: 1,
                    onPageChanged: (index,reason) async {

                      setState(() {
                        _current = index;
                      });

                    },
                  ),
                  items: imageSliders,
                ),


                Positioned(
                  bottom: 40.0,
                  right: 0.0,
                  left: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((item){

                      // int index = imgList.indexOf(item);

                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == item.key ? 0.9 : 0.4)),
                      );
                    }).toList(),
                  ),
                ),

              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: SizeConfig.screenHeight * .7,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.screenWidth * .06,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .05,
                ),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * .03,
                    ),
                    const Center(
                      child: HeadingText(
                        title: 'Welcome back',
                      ),
                    ),
                    Center(
                      child: Text(
                        "Login to your account",
                        style: TextStyle(
                          fontSize: SizeConfig.screenWidth * .026,
                          color: Constant.darkGreyColor,
                        ),
                      ),
                    ),
                    DefaultSize(
                      size: SizeConfig.screenHeight * .05,
                    ),
                    CustomTextField(
                      textEditingController: _emailTextEditingController,
                      hintText: "Email",
                    ),
                    DefaultSize(
                      size: SizeConfig.screenHeight * .01,
                    ),
                    CustomTextField(
                      textEditingController: _passwordTextEditingController,
                      hintText: "Password",
                      obsecure: true,
                      isPasswordText: true,
                    ),
                    DefaultSize(
                      size: SizeConfig.screenHeight * .05,
                    ),
                    CustomButton(
                      callback: () {
                        userViewModel.login(_emailTextEditingController.text,_passwordTextEditingController.text);

                        // MyApp.pushRoute(
                        //   BottomNavBar(),
                        // );
                      },
                      title: "Log In",
                    ),
                    DefaultSize(
                      size: SizeConfig.screenHeight * .02,
                    ),
                    CustomButton(
                      callback: () {
                        MyApp.pushRoute(
                          ForgotPasswordScreen(),
                        );
                      },
                      title: "Forget your password?",
                      color: Constant.greyColor,
                      textColor: Colors.black,
                    ),
                    DefaultSize(
                      size: SizeConfig.screenHeight * .06,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          MyApp.pushRoute(SignUpScreen());
                        },
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Dont't have an account?",
                              style: TextStyle(
                                color: Constant.darkGreyColor,
                              ),
                            ),
                            TextSpan(
                              text: " Sign Up",
                              style: TextStyle(
                                color: Constant.primaryColor,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> imgList = [

    Assets.WELCOMESLIDER01,
    Assets.WELCOMESLIDER02,
    Assets.WELCOMESLIDER03,
  ];


  List<Widget> imageSliders = [];

  int _current = 0;

   _loadImages(){

     imageSliders = imgList
        .map((item){

          return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: SizeConfig.screenWidth,
                    // width: 1000.0,
                  ),



                  // Positioned(
                  //   bottom: 0.0,
                  //   left: 0.0,
                  //   right: 0.0,
                  //   child: Container(
                  //     decoration: const BoxDecoration(
                  //       gradient: LinearGradient(
                  //         colors: [
                  //           Color.fromARGB(200, 0, 0, 0),
                  //           Color.fromARGB(0, 0, 0, 0)
                  //         ],
                  //         begin: Alignment.bottomCenter,
                  //         end: Alignment.topCenter,
                  //       ),
                  //     ),
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 10.0, horizontal: 20.0),
                  //   ),
                  // ),
                ],
              )
          );
    }).toList();

  }








}
