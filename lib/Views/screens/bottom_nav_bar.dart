import 'package:baba/Views/screens/categories_screen.dart';
import 'package:baba/Views/screens/dashboard.dart';
import 'package:baba/Views/screens/my_cart_screen.dart';
import 'package:baba/Views/screens/my_orders_screen.dart';
import 'package:baba/Views/screens/profile_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:bottom_nav/bottom_nav.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  // int _page = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
        init: NavbarController(),
        builder: (controller){

      return WillPopScope(
        onWillPop: () async {

          return false;
        },
        child:
        Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              key: controller.bottomNavigationKey,
              index: 0,
              height: 60.h,
              items: <Widget>[
                SvgPicture.asset(Assets.HomeIcon,color:Colors.white,),
                SvgPicture.asset(Assets.CategoryIcon,color:Colors.white,),
                SvgPicture.asset(Assets.TrolleyCart,color:Colors.white,),
                SvgPicture.asset(Assets.OrderIcon,color:Colors.white,),
                SvgPicture.asset(Assets.User_icon,color:Colors.white,),

              ],
              color: Constant.mainOrangeColor,
              buttonBackgroundColor: Constant.mainOrangeColor,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {

                Get.find<NavbarController>().onSelectPage(index);

              },
              letIndexChange: (index) => true,
            ),
            body: SafeArea(
              child: _getPage(controller.selectedPage),
            )
        ),
      );

    });
  }
  _getPage(int page) {
    switch (page) {
      case 0:
        return DashboardScreen();
      case 1:
        return CategoriesScreen(isFromBottomNav: true,);
      case 2:return MyCart();
      case 3:return MyOrders(isFromDashboard: true,);
      case 4:return ProfileScreen();
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("This is the basket page"),
            MaterialButton(
              child: const Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }
}

// _getPage(int page) {
//   switch (page) {
//     case 0:
//       return DashboardScreen();
//     case 1:
//       return MyCart();
//     default:
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text("This is the basket page"),
//           RaisedButton(
//             child: Text(
//               "Start new page",
//               style: TextStyle(color: Colors.white),
//             ),
//             color: Theme.of(context).primaryColor,
//             onPressed: () {},
//           )
//         ],
//       );
//   }
// }


class NavbarController extends GetxController{

  int selectedPage = 0;

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  void onSelectPage(int index){

    selectedPage = index;
    update();
  }

}