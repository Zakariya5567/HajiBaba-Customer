import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/ViewModel/get_customer_by_id_viewmodel.dart';
import 'package:baba/ViewModel/customerAddresses.dart';
import 'package:baba/Views/component/empty_delivery_address.dart';
import 'package:baba/Views/screens/add_address_screen.dart';
import 'package:baba/Views/screens/deliveryaddress_screen.dart';
import 'package:baba/Views/screens/edit_profile_screen.dart';
import 'package:baba/Views/screens/forgot_password.dart';
import 'package:baba/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottom_nav_bar.dart';

class ProfileScreen2 extends StatefulWidget {
  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  LocalData _localData = LocalData();
  bool issocial = false;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    init();

  }

  init() async{

    issocial = await _localData.getIsSocialLoginFromShareedPref() ?? false;

    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetCustomerByIdViewModel>(
        // specify type as Controller
        init: GetCustomerByIdViewModel(), // intialize with the Controller
        builder: (value) {
          // value.FetchUserProfileData();
          return value.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    ListView(
                      children: [
                        Container(
                          width: 375.w,
                          height: 288.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.ProfileBg),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: 375.w,
                          height: 470.h,
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 40.h),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Full Name',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        color: Constant.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                        height: 3.06,
                                      ),
                                    ),
                                    Text(
                                      '${value.profileData["data"]["fullName"]}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Constant.darkBlueColor,
                                        height: 3.64,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Email',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        color: Constant.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                        height: 3.06,
                                      ),
                                    ),
                                    Text(
                                      '${value.profileData["data"]["email"]}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Constant.darkBlueColor,
                                        height: 3.64,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Phone Number',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        color: Constant.darkBlueColor,
                                        fontWeight: FontWeight.w600,
                                        height: 3.06,
                                      ),
                                    ),
                                    Text(
                                      '${value.profileData["data"]["phoneNumber"]}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Constant.darkBlueColor,
                                        height: 3.64,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 5,),

                                if(value.customerAddressData != null && value.customerAddressData['data'] != null)

                                  for( int i = 0; i < value.customerAddressData['data'].length; i ++)

                                /// Addrees List
                                Container(
                                  margin: EdgeInsets.only(top: 5.h,bottom: 5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Constant.darkBlueColor.withOpacity(0.16),
                                        offset: Offset(0, 0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    isThreeLine: true,
                                    title: Text(
                                      value.customerAddressData['data'][i]['addressType'],
                                      style: GoogleFonts.poppins(
                                                  fontSize: 16.0,
                                                  color: Constant.darkBlueColor,
                                                  fontWeight: FontWeight.w600,
                                                  // height: 3.61,
                                                )
                                    ),
                                    subtitle: Text(
                                        _getAddress(value.customerAddressData['data'][i]),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          color: Constant.darkBlueColor,
                                          // height: 3.61,
                                        )
                                    ),
                                    trailing: IconButton(
                                      onPressed: (){

                                        value.deleteCustomerAddress(value.customerAddressData['data'][i]['id']);

                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10,),

                                /// Add Address Button
                                InkWell(
                                  onTap: (){
                                    Get.to(() => AddAdress());
                                  },
                                  child: Container(
                                    width: 349.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xFFF1F2F6),
                                      border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xFFBDBABA),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+ Add New Address',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,

                                          color: const Color(0xFF242938),

                                          fontWeight: FontWeight.w500,

                                          // height: 4.64,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                const SizedBox(height: 15,),

                                if(!issocial)
                                InkWell(
                                  onTap: () {
                                    Get.to(() => ForgotPasswordScreen());
                                  },
                                  child: Container(
                                    alignment: Alignment(0.0, 0.04),
                                    width: 326.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Constant.mainOrangeColor,
                                    ),
                                    child: Text(
                                      'Change Password',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.0,
                                        color: Constant.greyColor,
                                        height: 1.56,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15,),
                                    // :Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 180.h,
                      left: 20.w,
                      right: 30.w,
                      // child: Image.asset(Assets.Profile_Pic),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                        child: Center(child: Icon(
                          Icons.person_outline_sharp,size: 100,
                          color: Constant.primaryColor,
                        ),),
                        // backgroundImage: AssetImage('images/batman.jpg'),
                      )
                      // ClipOval(
                      //   child: CachedNetworkImage(
                      //     height: 104,
                      //     width: 104,
                      //     fit: BoxFit.fill,
                      //     // imageUrl: "${value.productCategoriesData.data[index].imgUrl}",
                      //     placeholder: (context, url) => Center(child: Icon(Icons.person)),
                      //     errorWidget: (context, url, error) => Icon(Icons.error),
                      //   ),
                      // ),
                    ),
                    // Positioned(
                    //   top: 125.h,
                    //   left: 20.w,
                    //   right: 20.w,
                    //   child: Image.asset(Assets.Cammera_Icon),
                    // ),
                    Positioned(
                      top: 15.h,
                      left: 20.w,
                      right: 20.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Profile',
                            style: GoogleFonts.poppins(
                              fontSize: 18.0,
                              color: Constant.darkBlueColor,
                              fontWeight: FontWeight.w600,
                              // height: 3.61,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  String _getAddress(customerAddressData) {

    return "${customerAddressData['street']}, ${customerAddressData['address']}, ${customerAddressData['city']}\n${customerAddressData['country']}";

  }
}

class ProfileScreen extends StatelessWidget {

  ProfileScreen({Key key}) : super(key: key);

  Size _size;

  @override
  Widget build(BuildContext context) {

    _size = MediaQuery.of(context).size;

    return Scaffold(

      body: GetBuilder<ProfileController>(

        init: ProfileController(),

        builder: (controller) {

          return Stack(

            children: [

              Column(

                children: [

                  Container(

                    width: _size.width,

                    height: _size.height * 0.3,

                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.ProfileBg),
                            fit: BoxFit.cover
                        )
                    ),

                    child: LayoutBuilder(

                      builder: (context,constraints){

                        return Column(

                          children: [

                            SizedBox(height: constraints.maxHeight * 0.05,),

                            Text(
                              'Profile',
                              style: GoogleFonts.poppins(
                                fontSize: constraints.maxHeight * 0.08,
                                color: Constant.darkBlueColor,
                                fontWeight: FontWeight.w600,
                                // height: 3.61,
                              ),
                            ),

                            SizedBox(height: constraints.maxHeight * 0.01,),

                            if(!controller.isLoading && controller.profileData != null && controller.profileData['data'] != null)
                            Text(
                              '${controller.profileData["data"]["fullName"]}',
                              style: GoogleFonts.poppins(
                                fontSize: constraints.maxHeight * 0.08,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                // height: 3.61,
                              ),
                            ),

                            if(!controller.isLoading && controller.profileData != null && controller.profileData['data'] != null)
                            Text(
                              '${controller.profileData["data"]["phoneNumber"]}',
                              style: GoogleFonts.poppins(
                                fontSize: constraints.maxHeight * 0.07,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                // height: 3.61,
                              ),
                            ),

                          ],

                        );

                      },

                    ),

                  ),

                  SizedBox(height: _size.height * 0.06,),

                  Expanded(

                    child: Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),

                      child: LayoutBuilder(

                        builder: (context,constraints){

                          return Column(

                            children: [

                              InkWell(

                                onTap : (){
                                  final controller = Get.find<NavbarController>();
                                  controller.onSelectPage(3);
                                  controller.bottomNavigationKey.currentState.setPage(3);
                                },

                                child: DottedBorder(

                                  color: Colors.grey,

                                  strokeWidth: 2,

                                  padding: const EdgeInsets.symmetric(horizontal: 15),

                                  radius: const Radius.circular(20),

                                  child: SizedBox(

                                    height: constraints.maxHeight * 0.2,

                                    child: Row(
                                      children: [

                                         Icon(
                                          Icons.dashboard,
                                          color: Constant.primaryColor,
                                          size: constraints.maxHeight * 0.08,
                                        ),

                                        SizedBox(width: constraints.maxWidth * 0.05,),

                                        Text(
                                          'All Orders',
                                          style: GoogleFonts.poppins(
                                            fontSize: constraints.maxHeight * 0.05,
                                            color: Constant.darkBlueColor,
                                            fontWeight: FontWeight.w600,
                                            // height: 3.61,
                                          ),
                                        ),

                                        const Spacer(),


                                        Text(
                                          '52',
                                          style: GoogleFonts.poppins(
                                            fontSize: constraints.maxHeight * 0.05,
                                            color: Constant.primaryColor,
                                            fontWeight: FontWeight.w600,
                                            // height: 3.61,
                                          ),
                                        ),

                                      ],
                                    ),

                                  ),
                                ),
                              ),

                              SizedBox(height: constraints.maxHeight * 0.05,),

                              InkWell(

                                onTap : (){

                                  if(!controller.isLoading && controller.profileData != null && controller.profileData['data'] != null){

                                    Get.to( () => EditProfileScreen(controller.profileData['data']));

                                  }

                                },

                                child: DottedBorder(

                                  color: Colors.grey,

                                  strokeWidth: 2,

                                  padding: const EdgeInsets.symmetric(horizontal: 15),

                                  radius: const Radius.circular(20),

                                  child: SizedBox(

                                    height: constraints.maxHeight * 0.2,

                                    child: Row(
                                      children: [

                                        Icon(
                                          Icons.edit,
                                          color: Constant.primaryColor,
                                          size: constraints.maxHeight * 0.08,
                                        ),

                                        SizedBox(width: constraints.maxWidth * 0.05,),

                                        Text(
                                          'Edit Profile',
                                          style: GoogleFonts.poppins(
                                            fontSize: constraints.maxHeight * 0.05,
                                            color: Constant.darkBlueColor,
                                            fontWeight: FontWeight.w600,
                                            // height: 3.61,
                                          ),
                                        ),

                                        const Spacer(),


                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Constant.darkGreyColor,
                                          size: constraints.maxHeight * 0.05,
                                        ),

                                      ],
                                    ),

                                  ),
                                ),
                              ),

                              SizedBox(height: constraints.maxHeight * 0.05,),

                              InkWell(

                                onTap : (){

                                  Get.to(() => DeliveryAddress());

                                },

                                child: DottedBorder(

                                  color: Colors.grey,

                                  strokeWidth: 2,

                                  padding: const EdgeInsets.symmetric(horizontal: 15),

                                  radius: const Radius.circular(20),

                                  child: SizedBox(

                                    height: constraints.maxHeight * 0.2,

                                    child: Row(
                                      children: [

                                        Icon(
                                          Icons.location_on,
                                          color: Constant.primaryColor,
                                          size: constraints.maxHeight * 0.08,
                                        ),

                                        SizedBox(width: constraints.maxWidth * 0.05,),

                                        Text(
                                          'Address',
                                          style: GoogleFonts.poppins(
                                            fontSize: constraints.maxHeight * 0.05,
                                            color: Constant.darkBlueColor,
                                            fontWeight: FontWeight.w600,
                                            // height: 3.61,
                                          ),
                                        ),

                                        const Spacer(),


                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Constant.darkGreyColor,
                                          size: constraints.maxHeight * 0.05,
                                        ),

                                      ],
                                    ),

                                  ),
                                ),
                              ),

                              const Spacer(),

                              Obx((){

                                if(!controller.isSocial.value) {

                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => ForgotPasswordScreen());
                                    },
                                    child: Container(
                                      alignment: const Alignment(0.0, 0.04),
                                      width: constraints.maxWidth * 0.9,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.0),
                                        color: Constant.mainOrangeColor,
                                      ),
                                      child: Text(
                                        'Change Password',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          color: Constant.greyColor,
                                          height: 1.56,
                                        ),
                                      ),
                                    ),
                                  );

                                }

                                return Container();

                              })

                            ],

                          );

                        },

                      )

                    ),

                  ),

                ],

              ),

              Positioned(

                 right: 0,

                 left: 0,

                  top: _size.height * 0.18,

                  child: CircleAvatar(

                    backgroundColor: Constant.greyColor,

                    radius: _size.height * 0.09,

                    child: const Center(child: Icon(
                      Icons.person_outline_sharp,size: 100,
                      color: Constant.primaryColor,
                    ),),

                    // backgroundImage: AssetImage('images/batman.jpg'),
                  )

              ),

            ],


          );

        },

      ),

    );

  }
}

class ProfileController extends GetxController {

  final _localData = LocalData();

  final AddressTypesServices _apiServices = AddressTypesServices();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    init();

  }

  final isSocial = false.obs;

  void init() async {

    fetchUserProfileData();

    isSocial.value = await _localData.getIsSocialLoginFromShareedPref() ?? false;

  }

  bool isLoading = false;

  var profileData;

  void fetchUserProfileData() async {

    try{

      isLoading = true;

      update();

      final userId = await _localData.getKeyValueFromShareedPref();

      await _apiServices.fetchUserProfileData(userId).then((value) {

        if (value == false) {

          debugPrint('There was a problem with add Store api....');

        } else {

          profileData = value;

        }

      });

    }finally{

      isLoading = false;
      // GetCustomerAddresses();
      update();

    }
  }


}




