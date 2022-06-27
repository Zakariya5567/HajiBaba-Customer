import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/main.dart';

import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:flutter/material.dart';

// class IntroductionScreen extends StatefulWidget {
//   const IntroductionScreen({Key key}) : super(key: key);
//
//   @override
//   State<IntroductionScreen> createState() => _IntroductionScreenState();
// }
//
// class _IntroductionScreenState extends State<IntroductionScreen> {
//   AssetImage backgroundImage;
//   @override
//   void initState() {
//     super.initState();
//     backgroundImage = const AssetImage(Assets.INTRODUCTION_BACKGROUND);
//     Future.delayed(const Duration(seconds: 2), () {
//       MyApp.navigatorKey.currentState.push(
//         MaterialPageRoute(builder: (_) => const LoginRegistrationScreen()),
//       );
//     });
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     precacheImage(backgroundImage, context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: SizeConfig.screenHeight,
//         width: SizeConfig.screenWidth,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: backgroundImage,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
