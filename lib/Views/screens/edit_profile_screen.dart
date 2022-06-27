import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Views/screens/profile_screen.dart';
import 'package:baba/Views/screens/send_verification_code_screen.dart';
import 'package:baba/utils/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatelessWidget {

  EditProfileScreen(this.profileData,{Key key}) : super(key: key);

  final profileData;

  Size _size;

  @override
  Widget build(BuildContext context) {

    _size = MediaQuery.of(context).size;

    return Scaffold(

      resizeToAvoidBottomInset: false,

      body: GetBuilder<EditProfileController>(

        init: EditProfileController(profileData),

        builder: (controller) {

          return Stack(

            children: [

              Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Container(

                    width: _size.width,

                    height: _size.height * 0.3,

                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.ProfileBg),
                            fit: BoxFit.cover)),

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

                            Text(
                              profileData['fullName'],
                              style: GoogleFonts.poppins(
                                fontSize: constraints.maxHeight * 0.08,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                // height: 3.61,
                              ),
                            ),

                            Text(
                              profileData['phoneNumber'],

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

                          return SingleChildScrollView(

                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Text(
                                  'Personal Information'.toUpperCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: constraints.maxHeight * 0.04,
                                    color: Constant.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    // height: 3.61,
                                  ),
                                ),

                                SizedBox(height: constraints.maxHeight * 0.01,),

                                _textFormField(

                                  label: 'Full Name',

                                  fontSize: constraints.maxHeight * 0.03,

                                  controller: controller.fullNameTextController,

                                  validator: (value){

                                    if(value.trim().isEmpty){

                                      return "Full Name Required";

                                    }else{

                                      return null;

                                    }

                                  },

                                ),


                                SizedBox(height: constraints.maxHeight * 0.04,),

                                _textFormField(

                                  label: 'Email',

                                  enabled: false,

                                  fontSize: constraints.maxHeight * 0.03,

                                  controller: controller.emailTextController,

                                  keyboardType: TextInputType.emailAddress,

                                  validator: (value) {

                                    if(value.trim().isEmpty){

                                      return "Email Required";

                                    }else{

                                      return null;

                                    }

                                  },

                                ),

                                SizedBox(height: constraints.maxHeight * 0.04,),

                                _textFormField(

                                  label: 'Phone Number',

                                  fontSize: constraints.maxHeight * 0.03,

                                  controller: controller.phoneNumberTextController,

                                  keyboardType: TextInputType.phone,

                                  validator: (value) {

                                    if(value.trim().isEmpty){

                                      return "Phone Number Required";

                                    }else{

                                      return null;

                                    }

                                  },

                                ),

                                SizedBox(height: constraints.maxHeight * 0.08,),

                                InkWell(
                                  onTap: () {

                                    controller.verifyPhoneNumber();

                                  },
                                  child: Container(
                                    alignment: const Alignment(0.0, 0.04),
                                    width: constraints.maxWidth,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Constant.mainOrangeColor,
                                    ),
                                    child: Text(
                                      'Update Information',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.0,
                                        color: Constant.greyColor,
                                        height: 1.56,
                                      ),
                                    ),
                                  ),
                                ),


                              ],

                            ),

                          );

                        },

                      ),
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

              Positioned(

                  left: 10,

                  top: 10,

                  child: IconButton(

                      onPressed: ()=>Get.back(),

                      icon: Image.asset(Assets.ArrowBack)

                  )

              ),


              if(controller.isLoading)
              Container(

                color: Colors.grey.withOpacity(0.4),

                width: _size.width,

                height: _size.height,

                child: const Center(

                  child: CircularProgressIndicator(),

                ),

              ),


            ],


          );

        },

      ),

    );

  }

  Widget _textFormField (
      {TextEditingController controller,
          Function(String) validator,
          TextInputAction textInputAction = TextInputAction.next,
          TextInputType keyboardType = TextInputType.text,
          String label,
          double fontSize,
          bool enabled = true,
          bool obscureText = false,
          })=> Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  color: Constant.darkGreyColor,
                  fontWeight: FontWeight.w500,
                  // height: 3.61,
                ),
              ),

              TextFormField(

    controller: controller,

    textInputAction: textInputAction,

    keyboardType: keyboardType,

    validator: validator,

    enabled: enabled,

    obscureText: obscureText,

    decoration: const InputDecoration(

      isDense: true,

    ),

  ),

            ],
          );

}

class EditProfileController extends GetxController {

  EditProfileController(this.profileData);

  final profileData;

  final AddressTypesServices _apiServices = AddressTypesServices();

  final _localData = LocalData();

  final fullNameTextController = TextEditingController();

  final emailTextController = TextEditingController();

  final phoneNumberTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    init();

  }

  final isSocial = false.obs;

  init() async {

    fullNameTextController.text = profileData['fullName'];

    emailTextController.text = profileData['email'];

    phoneNumberTextController.text = profileData['phoneNumber'];

    isSocial.value = await _localData.getIsSocialLoginFromShareedPref() ?? false;

  }

  bool isLoading = false;

  void updateCustomerProfile() async {

    try {

      isLoading = true;

      update();

      final userId = await _localData.getKeyValueFromShareedPref();

      Map<String,dynamic> data = {

        "customerId" : userId,

        "name" : fullNameTextController.text,

        "phoneNumber" : phoneNumberTextController.text

      };

      final response = await _apiServices.updateCustomerProfile(data);

      if(response != null) {

        if(response['status'] != null && response['status'] == "Ok" && response['data'] != null) {

          Get.back();

          Get.snackbar("Message", response['message']);

          Get.find<ProfileController>().fetchUserProfileData();

        } else {

          Get.snackbar("Message", response['message']);

        }

      }

    }finally{

      isLoading = false;
      // GetCustomerAddresses();
      update();

    }
  }

  void verifyPhoneNumber() async {

    if(phoneNumberTextController.text != profileData['phoneNumber']){

      isLoading = true;

      update();

      FirebaseAuth _auth = FirebaseAuth.instance;

      await _auth.verifyPhoneNumber(

          phoneNumber: phoneNumberTextController.text,

          timeout: const Duration(seconds: 30),

          verificationCompleted: (AuthCredential credential) async {

            // updateCustomerProfile();

            Get.log("******************************************************");

            isLoading = false;

            update();

          },

          verificationFailed: (e){

            Get.showSnackbar(GetSnackBar(message: e.message,));

            isLoading = false;

            update();

          },
          codeSent: (String verificationId, [int forceResendingToken]){

            Get.to( ()=> SendVerificationCode(verificationId: verificationId,));

            isLoading = false;

            update();

          },

          codeAutoRetrievalTimeout: (String verId){

            Get.log("&&&&&&&&&&&&&&&&&&&&&&&&");

          }
      );

    }else{

      updateCustomerProfile();

    }



  }


}
