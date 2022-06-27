import 'package:baba/Core/ModelClasses/products_model.dart';
import 'package:baba/Core/Services/get_api_data_service.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/screens/filters_screen.dart';
import 'package:baba/Views/screens/product_detail_screen.dart';
import 'package:baba/Views/widgets/baba_meat_textfield.dart';
import 'package:baba/get_services/cart_controller.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWishListScreen extends StatelessWidget {

  MyWishListScreen({Key key}) : super(key: key);

  Size _size;

  @override
  Widget build(BuildContext context) {

    _size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),

        child: Container(
          width: 375.w,
          height: 163.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 3.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 25,),
              ListTile(
                leading: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Image.asset(Assets.ArrowBack)),
                horizontalTitleGap: 40.w,
                title: Text(
                  "       My Wish List",
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    color: Constant.darkBlueColor,
                    fontWeight: FontWeight.w600,
                    // height: 3.61,
                  ),
                ),
              ),
              Container(
                  height: 45.h,
                  // width: 288.w,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomTextField(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),

                    onChange: (String value){

                      if(value.trim().isNotEmpty){

                        if(Get.find<MyWishListController>().initialized){

                          final mController = Get.find<MyWishListController>();

                          mController.isLoading = true;

                          mController.update();

                          mController.getMyWishList(autoSearch: value.trim().toLowerCase());

                        }

                      }

                    },
                  )
              ),
            ],
          ),
        ),
      ),

      body: GetBuilder<MyWishListController>(

        init: MyWishListController(),

        builder: (controller){

          if(controller.isLoading){

            return const Center(child: CircularProgressIndicator());

          }

          if(controller.productsModel != null) {

            if(controller.productsModel.data != null && controller.productsModel.data.isNotEmpty){

              return Padding(

                padding: const EdgeInsets.all(10.0),

                child: ListView.builder(

                    itemBuilder: (context,index){

                      return Card(

                          child: Stack(

                            children: [

                              Column(

                                children: [

                                  const SizedBox(height: 10,),

                                  ListTile(

                                    leading: CircleAvatar(
                                      radius: _size.width * 0.08,
                                      backgroundImage: NetworkImage(controller.productsModel.data[index].imgUrl),
                                    ),

                                    title: Text("${controller.productsModel.data[index].title} - ${controller.productsModel.data[index].unit}",style: GoogleFonts.poppins(
                                      fontSize: 15.0,
                                      color: Constant.darkBlueColor,
                                      fontWeight: FontWeight.w500,
                                      height: 1.25,
                                    )),
                                    subtitle: getProductPrice(controller.productsModel.data[index]),

                                  ),

                                  const SizedBox(height: 10,),

                                  const Divider(height: 2,thickness: 1,),

                                  const SizedBox(height: 10,),

                                  // Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: Container(
                                  //     alignment: const Alignment(0.0, 0.04),
                                  //     width: _size.width * 0.4,
                                  //     height: 35.0,
                                  //     margin: const EdgeInsets.only(right: 10),
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(50.0),
                                  //       color: Constant.mainOrangeColor,
                                  //     ),
                                  //     child: Text(
                                  //       'Add to Basket',
                                  //       style: GoogleFonts.poppins(
                                  //         fontSize: 14.0,
                                  //         color: Constant.greyColor,
                                  //         height: 1.56,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

                                  getAddCart(controller.productsModel.data[index]),

                                  const SizedBox(height: 10,),

                                ],

                              ),

                              Positioned(

                                  right: 0,

                                  top: 0,

                                  child: IconButton(

                                    onPressed: () {

                                      controller.deleteCustomerFvtProduct(controller.productsModel.data[index].id);

                                    },

                                    icon: const Icon(
                                      Icons.delete,
                                      color: Constant.primaryColor,
                                    ),

                                  )
                              )

                            ],

                          )

                      );

                    },

                  itemCount: controller.productsModel.data.length,

                ),
              );

            }

          }

          return const Center(child: Text("No Record Found"));

        },

      )

    );

  }


  Widget getProductPrice(Datum datum){

    String actualPrice = "";

    String cutPrice = "";

    if(datum.applyExpiryDiscount){

      actualPrice = datum.expiryDiscountedPrice;

      cutPrice = datum.actualPrice;

    }else if(datum.applyBulkDiscount) {

      actualPrice = datum.bulkDiscountedPrice;

      cutPrice = datum.actualPrice;

    }else{

      actualPrice =  datum.actualPrice;

    }

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          '£${actualPrice.toStringAsFixed()}',
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            color: Constant.darkBlueColor,
            fontWeight: FontWeight.w600,
            // height: 1.44,
          ),
          textAlign: TextAlign.start,
        ),

        const SizedBox(width: 20,),

        if(cutPrice.isNotEmpty)
          Text(
            '£${cutPrice.toStringAsFixed()}',
            style: GoogleFonts.poppins(
              fontSize: 13.0,
              color: Constant.mainOrangeColor,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.lineThrough,
              // height: 1.92,
            ),
            textAlign: TextAlign.center,
          ),

        const SizedBox(width: 20,),

        if(!datum.applyExpiryDiscount && datum.applyBulkDiscount)
          Container(
            // alignment: Alignment(-0.11, 0.11),
            width: 47.0,
            height: 21.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Constant.hotPinkColor,
            ),
            child: Center(
              child: Text(
                datum.bulkDiscountInPercent.toBulkDiscount(),
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 10.0,
                  color: Constant.greyColor,
                  // height: 2.78,
                ),
              ),
            ),
          )

      ],
    );

  }

  Widget getAddCart(Datum datum){

    return GetBuilder<CartController>(

        id: "update_cart${datum.id}",

        builder: (controller){

          bool isCartExist = false;

          if(!datum.isVariableProduct){

            for(final element in controller.data) {

              if(element.id == datum.id){

                isCartExist = true;

                break;

              }

            }

          }

          return Row(

            mainAxisAlignment: MainAxisAlignment.end,

            children: [

              InkWell(
                onTap: (){

                  if(!isCartExist){

                    if(!datum.isVariableProduct){

                      datum.cartQuantity = 1;

                      controller.data.add(datum);

                    }else{

                      Get.to(()=>ProductDetail(
                        datum: datum,
                      ));

                    }


                  }else{

                    for(int i=0; i < controller.data.length; i++){

                      if(controller.data.elementAt(i).id == datum.id){

                        controller.data.elementAt(i).cartQuantity++;

                        break;

                      }

                    }

                  }

                  controller.update(['update_cart${datum.id}','my_cart']);

                },

                child: Container(
                  alignment: const Alignment(0.0, 0.04),
                  width: _size.width * 0.4,
                  height: 35.0,
                  // margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constant.mainOrangeColor,
                  ),
                  child: Text(
                    isCartExist ? 'Add more' : datum.isVariableProduct ? 'Chose Option' : 'Add to Basket',
                    style: GoogleFonts.poppins(
                      fontSize: 10.0,
                      color: Constant.greyColor,
                      height: 1.56,
                      // height: 2.5,
                    ),
                  ),
                ),
              ),

              if(isCartExist)

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const SizedBox(width: 10,),

                    GestureDetector(
                      onTap: (){

                        for(int i=0; i < controller.data.length; i++){

                          if(controller.data.elementAt(i).id == datum.id){

                            controller.data.elementAt(i).cartQuantity--;

                            if(controller.data.elementAt(i).cartQuantity == 0){

                              controller.data.removeAt(i);

                            }

                            break;

                          }

                        }


                        controller.update(['update_cart${datum.id}','my_cart']);

                      },
                      child: SvgPicture.asset(
                        Assets.minus_icon,
                        width: 26,
                        height: 26,
                        color: Constant.mainOrangeColor,
                      ),
                    ),

                    const SizedBox(width: 10,),

                    Text("${getCartCount(controller.data,datum)}",style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),

                    const SizedBox(width: 10,),

                    GestureDetector(
                      onTap: (){

                        for(int i=0; i < controller.data.length; i++){

                          if(controller.data.elementAt(i).id == datum.id){

                            controller.data.elementAt(i).cartQuantity++;

                            break;

                          }

                        }

                        controller.update(['update_cart${datum.id}','my_cart']);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(
                          color: Constant.mainOrangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: const Icon(Icons.add,size: 16,color: Colors.white,),
                      ),
                    ),

                  ],
                ),

              const SizedBox(width: 10,),

            ],
          );
        }
    );

  }

  int getCartCount(List<Datum> list,Datum datum){

    return list.firstWhere((element) => element.id == datum.id).cartQuantity;

  }

}


class MyWishListController extends GetxController{

  final LocalData _localData = LocalData();

  bool isLoading = true;

  ProductsModel productsModel;

  void getMyWishList({String autoSearch}) async {

    try {

     final userId = await _localData.getKeyValueFromShareedPref();

     final response = await GetApiDataServices.fetchApiData('GetCustomerFvtProducts?CustomerId=$userId&SearchTerm=$autoSearch');

      if (response["data"] != null) {
        productsModel = ProductsModel.fromJson(response);
      }
    } finally {

      isLoading = false;

      update();

    }
  }

  void deleteCustomerFvtProduct(String productId) async {

    print("deleteCustomerFvtProduct: $productId");

    isLoading = true;

    update();

    var response;

    try {

      response = await GetApiDataServices.fetchApiData('DeleteCustomerFvtProduct?Id=$productId');


    } catch(e){

      Get.log("$e",isError: true);

    } finally {

      if (response != null && response["status"] != null && response["status"] == "Ok") {

        getMyWishList();

      }else{

        isLoading = false;

        update();

      }

    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getMyWishList();

  }

}


extension StringExtension on String {

  String toBulkDiscount(){

    if(this != null && isNotEmpty){

      return "${substring(0,2)}% off";

    }else{

      return "0% off";

    }

  }

  String toStringAsFixed(){

    if(this != null && isNotEmpty){

      return double.parse(this).toStringAsFixed(2).toString();

    }

    return "";

  }

}