import 'package:baba/ViewModel/get_customer_by_id_viewmodel.dart';
import 'package:baba/Views/screens/about_screen.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/categories_screen.dart';
import 'package:baba/Views/screens/edit_profile_screen.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/Views/screens/my_orders_screen.dart';
import 'package:baba/Views/screens/my_wishlist_screen.dart';
import 'package:baba/Views/screens/new_offer_screen.dart';
import 'package:baba/Views/screens/tc_screen.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/Views/widgets/default_size.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:ionicons/ionicons.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const labelTextStyle =  TextStyle(
        fontSize: 16,
        color: Constant.primaryColor,
        fontWeight: FontWeight.w500
    );

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              color: Constant.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0) +
                    EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * .01,
                    ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Center(child: Icon(
                            Icons.person_outline_sharp,
                            size: 40,
                            color: Constant.primaryColor,
                          ),),
                          // backgroundImage: AssetImage('images/batman.jpg'),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * .05,
                        ),
                        GetBuilder<GetCustomerByIdViewModel>( // specify type as Controller
                          init: GetCustomerByIdViewModel(), // intialize with the Controller
                          builder: (value) => value.isLoading || value.profileData == null ? Container() : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                "${value.profileData["data"]["fullName"]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textScaleFactor: 1,
                              ),
                              Text(
                                "${value.profileData["data"]["phoneNumber"]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textScaleFactor: 1,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),

            const DefaultSize(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      "Information".toUpperCase(),
                      style: labelTextStyle,
                      textScaleFactor: 1,
                    ),
                  ),

                  const SizedBox(height: 15,),

                  getTile(
                      Icons.grid_view,
                      "Categories",
                      (){
                        Get.back();
                        Get.to(()=> CategoriesScreen());
                      }
                  ),

                  const SizedBox(height: 15,),

                  getTile(
                      Icons.content_paste,
                      "My Orders",
                          (){
                        Get.back();
                        Get.to(()=> MyOrders());
                      }
                  ),

                  const SizedBox(height: 15,),

                  getTile(
                      Icons.shopping_cart_outlined,
                      "My Cart",
                          (){
                            final controller = Get.find<NavbarController>();
                            controller.onSelectPage(2);
                            controller.bottomNavigationKey.currentState.setPage(2);
                            Get.back();
                      }
                  ),

                  const SizedBox(height: 15,),

                  getTile(
                      Icons.person_outline,
                      "Profile",
                          (){

                          //  Get.to(()=>EditProfileScreen());
                          }
                  ),

                  const SizedBox(height: 5,),

                ],
              ),
            ),

            Container(
              color: Constant.greyColor,
              child: Padding(
                padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Promotions".toUpperCase(),
                        style: labelTextStyle,
                        textScaleFactor: 1,
                      ),
                    ),

                    const SizedBox(height: 15,),
          //wishlist
                    InkWell(
                      onTap:     (){
                         Get.back();
                         Get.to(()=> MyWishListScreen());
                        },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Row(
                          children: [
                            Container(
                              height: 20,width: 22,
                              decoration:const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/w.png'
                                      ),
                                      fit: BoxFit.fill
                                  )
                              ),),
                            SizedBox(width: 10,),
                            Text("Wish List",style: TextStyle(color: Constant.darkGreyColor),),
                          ],
                        ),
                      ),
                    ),


                    // getTile(
                    //    Icons.wallet_giftcard_sharp,
                    //     "Wish List",
                    //         (){
                    //           Get.back();
                    //           Get.to(()=> MyWishListScreen());
                    //     }
                    // ),

                    const SizedBox(height: 15,),

                    getTile(
                        Icons.wallet_giftcard_sharp,
                        "New Offers",
                            (){

                          Get.back();

                          Get.to(() => NewOfferScreen());

                        }
                    ),

                    const SizedBox(height: 15,),
                    InkWell(
                      onTap:     (){
                        Get.back();
                        Get.to(()=> MyWishListScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Container(
                              height: 20,width: 20,
                              decoration:const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/rate.png'
                                      ),
                                      fit: BoxFit.fill
                                  )
                              ),),
                            SizedBox(width: 10,),
                            Text("Rate App",style: TextStyle(color: Constant.darkGreyColor),),
                          ],
                        ),
                      ),
                    ),

                    // getTile(
                    //     Icons.warning_rounded,
                    //     "Rate App",
                    //         (){
                    //
                    //     }
                    // ),

                    const SizedBox(height: 15,),

                    getTile(
                        Icons.share_outlined,
                        "Share App",
                            (){

                        }
                    ),

                    const SizedBox(height: 15,),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Others".toUpperCase(),
                      style: labelTextStyle,
                      textScaleFactor: 1,
                    ),
                  ),

                  const SizedBox(height: 15,),
        //about us
                  InkWell(
                    onTap:   (){
                    Get.back();
                    Get.to(()=>About());
                           },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 20,width: 20,
                            decoration:const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/about_imge.png'
                                    ),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("About Us",style: TextStyle(color: Constant.darkGreyColor),),
                        ],
                      ),
                    ),
                  ),

                  // getTile(
                  //   Icons.list,
                  //     "About Us",
                  //         (){
                  //           Get.back();
                  //           Get.to(()=>About());
                  //     }
                  // ),

                  const SizedBox(height: 15,),
          // term and condition
                  InkWell(
                    onTap:      (){
                           Get.back();
                           Get.to(()=>Terms());
                         },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 20,width: 20,
                            decoration:const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/termImage.png'
                                    ),
                                    fit: BoxFit.fill
                                )
                            ),),
                          SizedBox(width: 10,),
                          Text("Terms & Conditions",
                            style: TextStyle(color: Constant.darkGreyColor),),
                        ],
                      ),
                    ),
                  ),
 //                  getTile(
 //                      Icons.paste,
 //                      "Terms & Conditions",
 //                          (){
 //                        Get.back();
 //                        Get.to(()=>Terms());
 //                      }
 //                  ),

                  const SizedBox(height: 15,),

                  getTile(
                      Icons.notifications_outlined,
                      "User Notifications",
                          (){

                      }
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Constant.primaryColor,
              ),
              onTap: ()async {
                LocalData _localData = LocalData();
                await _localData.addIsLoginToShareedPref(false);
                await _localData.addIsSocialLoginToShareedPref(false);
                Get.offAll(()=>LoginRegistrationScreen());
              },
              title: const Text(
                "Logout",
                style: TextStyle(fontSize: 16, color: Constant.darkGreyColor),
                textScaleFactor: 1,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget getTile(icon,title,onTap){

    return InkWell(

      onTap: onTap,

      child: Container(

        padding: const EdgeInsets.symmetric(horizontal: 5.0),

        child: Row(

          children: [

            Icon(
              icon,
              color: Constant.primaryColor,

            ),

            const SizedBox(width: 10,),

            Text(
              title,
              style:
              const TextStyle(fontSize: 14, color: Constant.darkGreyColor),
              textScaleFactor: 1,
            ),

          ],

        ),

      ),

    );

  }

}
