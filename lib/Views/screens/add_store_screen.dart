import 'dart:ffi';

import 'package:baba/ViewModel/getStores_viewModel.dart';
import 'package:baba/ViewModel/location_viewModel.dart';
import 'package:baba/Views/component/customerfullScreenDialoag.dart';
import 'package:baba/Views/widgets/baba_meat_button.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/Views/widgets/menu_card.dart';
import 'package:baba/get_services/cart_controller.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddStoreScreen extends StatelessWidget {
  LocationViewModel _locationViewModel = Get.put(LocationViewModel());

  TextEditingController selectStoreController = TextEditingController();

  int selectedIndex;

  bool isDashboard;

  AddStoreScreen({this.isDashboard = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constant.greyColor,
        appBar:AppBar(
          backgroundColor: Constant.darkOrange,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.ADDRESS_BACKGROUND),
                      fit: BoxFit.cover)),
            ),

            LayoutBuilder(builder: (context, constarints) {
              return Container(
                constraints: BoxConstraints(
                    maxHeight: constarints.maxHeight,
                    maxWidth: constarints.maxWidth),
                child: GetBuilder<StoresDataViewModel>(
                    // specify type as Controller
                    init: StoresDataViewModel(),
                    // intialize with the Controller
                    builder: (value) => value.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.west,
                                        size: 36.w,
                                      )),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Choose your Nearest Store',
                                    style: GoogleFonts.poppins(
                                      fontSize: 22.w,
                                      color: Constant.darkOrange,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),

                              GetBuilder<StoresDataViewModel>(
                                  init: StoresDataViewModel(),
                                  builder: (value) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            style: TextStyle(fontSize: 14.w),
                                            controller: selectStoreController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.search,
                                            onChanged: (searchItem) async{
                                              print("search text in field : ${searchItem}");
                                              await value.onSearchTextChanged(searchItem);
                                             // value.getSearchStoresData();
                                            },
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: "Search",
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5.w,
                                                      horizontal: 25.w),
                                              hintStyle: TextStyle(
                                                  fontSize: 14.w,
                                                  color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0)),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.w,
                                          ),
                                          Text(
                                            'Store Locations',
                                            style: GoogleFonts.poppins(
                                              fontSize: 22.w,
                                              color: Constant.darkOrange,
                                              fontWeight: FontWeight.w600,
                                              height: 1.40,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 10.w,
                                          ),
                                          // selectStoreController.isBlank?
                                          Text(
                                            '${value.storesData.data.length} Result',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16.w,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400,
                                              height: 1.40,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),

                                          // : Text(
                                          //   '${value.searchStoresDataModel.data.length} Result',
                                          //   style: GoogleFonts.poppins(
                                          //     fontSize: 16.w,
                                          //     color: Colors.black87,
                                          //     fontWeight: FontWeight.w400,
                                          //     height: 1.40,
                                          //   ),
                                          //   textAlign: TextAlign.center,
                                          // ),
                                          SizedBox(
                                            height: 10.w,
                                          ),

                                          Container(
                                            height: constarints.maxHeight - 240,
                                            // width: 281.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            child:
                                            value.storesData.data.isBlank
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                :

                                            selectStoreController.text.isEmpty  ?
                                            //if search field is empty the orignal list will shown
                                            ListView.builder(
                                                    itemCount:
                                                    value.storesData.data.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return
                                                        Card(
                                                          child: ListTile(
                                                            onTap: () async {

                                                              value.selectStoreController
                                                                      .text = value.storesData
                                                                      .data[index].name.toString();
                                                              selectedIndex = index;
                                                              if (value
                                                                  .selectStoreController
                                                                  .text
                                                                  .isEmpty) {
                                                                Get.snackbar(
                                                                    'Store Alert',
                                                                    'Please Select Store to complete SignUp');
                                                              } else {
                                                                CustomFullScreenDialog
                                                                    .showDialog();
                                                                SharedPreferences
                                                                    prefs =
                                                                    await SharedPreferences
                                                                        .getInstance();
                                                                var userid = prefs
                                                                    .getString(
                                                                        'userId');
                                                                value.addStore(
                                                                    userid
                                                                        .toString(),
                                                                    value
                                                                        .storesData
                                                                        .data[
                                                                            selectedIndex]
                                                                        .id
                                                                        .toString(),
                                                                    isDashboard:
                                                                        isDashboard);
                                                              }
                                                            },
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            dense: true,
                                                            horizontalTitleGap: 0,
                                                            leading: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5),
                                                              child: Container(
                                                                height: 30,
                                                                width: 20,
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            "assets/images/storeAddressIcon.png"))),
                                                              ),
                                                            ),

                                                            // trailing: Text(value.storesData.data[index].id.toString(),
                                                            //   style: const TextStyle(
                                                            //       color: Colors.green,fontSize: 12),),

                                                            title: Text(
                                                              value
                                                                  .storesData
                                                                  .data[index]
                                                                  .name
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          13),
                                                              maxLines: 1,
                                                            ),
                                                            subtitle: Text(
                                                                value.storesData
                                                                    .data[index].address
                                                                    .toString()+"\n"+
                                                                value.storesData
                                                                .data[index].phoneNumber
                                                                .toString()+" / Ext "+
                                                              value.storesData
                                                              .data[index].extensionNumber
                                                              .toString(),
                                                                maxLines: 2,
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            13)),
                                                          ),
                                                        );
                                                    },
                                                  )
                                                :
                                            ListView.builder(
                                              itemCount:
                                              value.searchStoreList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                  int index) {
                                                return
                                                  Card(
                                                    child: ListTile(
                                                      onTap: () async {
                                                        value.selectStoreController
                                                            .text = value.searchStoreList[index].name.toString();
                                                        selectedIndex = index;
                                                        if (value
                                                            .selectStoreController
                                                            .text
                                                            .isEmpty) {
                                                          Get.snackbar(
                                                              'Store Alert',
                                                              'Please Select Store to complete SignUp');
                                                        } else {
                                                          CustomFullScreenDialog
                                                              .showDialog();
                                                          SharedPreferences
                                                          prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                          var userid = prefs
                                                              .getString(
                                                              'userId');
                                                          value.addStore(
                                                              userid
                                                                  .toString(),
                                                              value.searchStoreList[selectedIndex]
                                                                  .id
                                                                  .toString(),
                                                              isDashboard:
                                                              isDashboard);
                                                        }
                                                      },
                                                      contentPadding:
                                                      EdgeInsets.zero,
                                                      dense: true,
                                                      horizontalTitleGap: 0,
                                                      leading: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 5),
                                                        child: Container(
                                                          height: 30,
                                                          width: 20,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/storeAddressIcon.png"))),
                                                        ),
                                                      ),

                                                      // trailing: Text(value.storesData.data[index].id.toString(),
                                                      //   style: const TextStyle(
                                                      //       color: Colors.green,fontSize: 12),),

                                                      title: Text(
                                                        value
                                                            .searchStoreList[index]
                                                            .name
                                                            .toString(),
                                                        style:
                                                        const TextStyle(
                                                            fontSize:
                                                            13),
                                                        maxLines: 1,
                                                      ),
                                                      subtitle: Text(
                                                          value.searchStoreList
                                                              [index].address
                                                              .toString()+"\n"+
                                                              value.searchStoreList
                                                                  [index].phoneNumber
                                                                  .toString()+" / Ext "+
                                                              value.searchStoreList
                                                                  [index].extensionNumber
                                                                  .toString(),
                                                          maxLines: 2,
                                                          style:
                                                          const TextStyle(
                                                              fontSize:
                                                              13)),
                                                    ),
                                                  );
                                              },
                                            )

                                          )

                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          )),
              );
            }),
          ],
        ),

      ),
    );
  }

  // showDialog(BuildContext context) {
  //   // BuildContext context;
  //   showGeneralDialog(
  //     barrierLabel: "Barrier",
  //     barrierDismissible: true,
  //     barrierColor: Colors.black.withOpacity(0.5),
  //     transitionDuration: Duration(milliseconds: 700),
  //     context: context,
  //     pageBuilder: (_, __, ___) {
  //       return Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Container(
  //             width: 326.w,
  //             height: 460.h,
  //             margin: EdgeInsets.only(bottom: 140, left: 12, right: 12),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(25.0),
  //               color: Colors.white,
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 SvgPicture.asset(
  //                     Assets.LocationIcon),
  //                 Text(
  //                   'Enable Your Location',
  //                   style: GoogleFonts.poppins(
  //                     fontSize: 24.0,
  //                     color: const Color(0xFF242938),
  //                     fontWeight: FontWeight.w700,
  //                     // height: 1.46,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 Text(
  //                   'Please allow to use your location to\nshow nearby restaurant on the map.',
  //                   style: GoogleFonts.poppins(
  //                     fontSize: 16.0,
  //                     color: const Color(0xFF242938),
  //                     // height: 1.44,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(16.0),
  //                   child: CustomButton(
  //                     callback: ()async {
  //                       var posittion = await _determinePosition();
  //                       print(posittion.latitude.toString());
  //                       SharedPreferences prefs = await SharedPreferences.getInstance();
  //                       var userid = prefs.getString('userId');
  //                       _locationViewModel.addLocation(userid.toString(), posittion.latitude.toString(), posittion.longitude.toString());
  //                       // userViewModel.login(_emailTextEditingController.text,_passwordTextEditingController.text);
  //
  //                       // MyApp.pushRoute(
  //                       //   BottomNavBar(),
  //                       // );
  //                     },
  //                     title: "Enable Location",
  //                   ),
  //                 ),
  //
  //               ],
  //             ),
  //           )
  //       );
  //     },
  //     transitionBuilder: (_, anim, __, child) {
  //       return SlideTransition(
  //         position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
  //         child: child,
  //       );
  //     },
  //   );
  // }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
