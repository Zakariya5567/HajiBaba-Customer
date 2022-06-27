import 'package:baba/ViewModel/address_type_viewmodel.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAdress extends StatefulWidget {

  AddAdress({this.navFrom = "Profile"});

  final String navFrom;

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {

  String dropdownValue = 'One';

  Size size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomInset : false,
      appBar: customAppBar('Add Address'),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: 12.h,bottom: 12.h),
          child: GetBuilder<AddressTypeViewModel>( // specify type as Controller
            init: AddressTypeViewModel(), // intialize with the Controller
            builder: (value) => value.isLoading?Center(child: CircularProgressIndicator(),):
            SingleChildScrollView(

              physics:  ClampingScrollPhysics(),

              child: SizedBox(

                height: size.height * 0.8,

                child: Stack(

                  children: [

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          const SizedBox(height: 10,),

                          Container(
                            height: 60.h,
                            width: 326.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Constant.greyColor,),
                            child: Padding(

                              padding: const EdgeInsets.symmetric(horizontal: 15.0),

                              child: DropdownButtonFormField<String>(

                                decoration: const InputDecoration(

                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Constant.greyColor))

                                ),

                                value: value.dropdownValue,

                                onChanged: (String newValue) {

                                  value.dropdownValue = newValue;

                                },
                                items: value.addressTypes
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),),

                          const SizedBox(height: 10,),

                          Container(
                              height: 60.h,
                              width: 326.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Constant.greyColor,),
                              child: CustomTextField(hintText: 'Address',textEditingController: value.addressController,)),

                          const SizedBox(height: 10,),

                          Container(
                              height: 60.h,
                              width: 326.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Constant.greyColor,),
                              child: CustomTextField(hintText: 'Street',textEditingController: value.streetController)),

                          const SizedBox(height: 10,),

                          Container(
                              height: 60.h,
                              width: 326.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Constant.greyColor,),
                              child: CustomTextField(hintText: 'Postcode',textEditingController: value.codeController)),

                          const SizedBox(height: 10,),

                          Container(
                              height: 60.h,
                              width: 326.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Constant.greyColor),
                              child: CustomTextField(hintText: 'City',textEditingController: value.cityController)),

                          const SizedBox(height: 10,),


                          Container(
                              height: 60.h,
                              width: 326.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Constant.greyColor,),
                              child: CustomTextField(hintText: 'Country',textEditingController: value.countryController)),
                        ],
                      ),
                    ),

                    Positioned(
                        left: 10.w,
                        right: 10.w,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {

                            value.addAddress(value.dropdownValue,widget.navFrom);

                            // Get.to(() => AddAdress());
                          },
                          child: Container(
                            // alignment: Alignment(0.0, 0.04),
                            width: 326.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Constant.mainOrangeColor,
                            ),
                            child: Center(
                              child: Text(
                                'Add Address',
                                style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    color: Constant.greyColor
                                  // height: 1.56,
                                ),
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          ),


        ),
      ),
    );
  }
}
