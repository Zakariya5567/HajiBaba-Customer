import 'package:baba/ViewModel/get_customer_storebyid.dart';
import 'package:baba/Views/screens/add_store_screen.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/dashboard.dart';
import 'package:baba/Views/screens/locationScreen.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/Views/widgets/default_size.dart';
import 'package:baba/get_services/cart_controller.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardHeader extends StatefulWidget {
  const DashboardHeader({Key key}) : super(key: key);

  @override
  _DashboardHeaderState createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {

  final TextEditingController _searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      // SizeConfig.screenWidth,
      height: 163.h,
      // SizeConfig.screenHeight * .16,
      color: Constant.mainOrangeColor,
      child: Padding(
        padding: EdgeInsets.all(
          SizeConfig.screenWidth * .04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      InkWell(
                        onTap: (){
                          Get.to(()=> AddStoreScreen(isDashboard: true,));
                        },
                        child: const Text(
                          "Selected Store",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          textScaleFactor: 1,
                        ),
                      ),

                    GetBuilder<GetCustomerStoreByIdViewModel>(
                      // specify type as Controller
                      init: GetCustomerStoreByIdViewModel(),
                      // intialize with the Controller
                      builder: (value){

                        if(value.isLoading){

                          return Container();

                        }

                        if(value.storeData != null) {


                         return InkWell(

                           onTap: (){

                             Get.to(()=> AddStoreScreen(isDashboard: true,));

                           },

                           splashColor: Constant.greyColor,

                           child: Column(

                             crossAxisAlignment: CrossAxisAlignment.start,

                             children: [

                               Text(

                                 "${value.storeData["data"]["customerStoreName"]}, ${value.storeData["data"]["storeAddress"]}",

                                 style: const TextStyle(fontSize: 14, color: Colors.white),

                                 textScaleFactor: 1,

                                 maxLines: 1,

                                 softWrap: true,

                               ),

                               // Text(
                               //
                               //   "${value.storeData["data"]["storeAddress"]}",
                               //
                               //   style: const TextStyle(fontSize: 14, color: Colors.white),
                               //
                               //   textScaleFactor: 1,
                               //
                               //   maxLines: 1,
                               //
                               // ),
                             ],
                           ),
                         );

                        }

                        return Container();

                      },
                    ),

                    ],
                  ),
                ),

                SizedBox(
                  child: GetBuilder<CartController>(
                    id: 'my_cart',
                    builder: (controller){
                      return Stack(
                        children: [
                          InkWell(
                            onTap: (){
                              final controller = Get.find<NavbarController>();
                              controller.onSelectPage(2);
                              controller.bottomNavigationKey.currentState.setPage(2);
                            },
                            child: SvgPicture.asset(
                              Assets.ShopingBagWhite,
                              // semanticsLabel: 'Acme Logo'
                            ),
                          ),

                          if(controller.data != null && controller.data.isNotEmpty)

                            Positioned(
                                right: 0,
                                top: 0,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Constant.greenColor,
                                  child: Text("${controller.data.length}",style:GoogleFonts.poppins(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                )
                            ),

                        ],
                      );
                    },
                  )
                ),
              ],
            ),
            const DefaultSize(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    DashboardScreen.scaffoldKey.currentState.openDrawer();
                  },
                  child: SizedBox(
                    width: SizeConfig.screenWidth * .07,
                    height: SizeConfig.screenWidth * .04,
                    child: Image.asset(
                      Assets.MENU_ICON,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: SizeConfig.screenWidth * .8,
                  height: SizeConfig.screenHeight * .05,
                  child: CustomTextField(
                    textEditingController: _searchTextEditingController,
                    hintText: "Search",
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
