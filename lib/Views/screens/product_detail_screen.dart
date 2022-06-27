import 'package:baba/Core/ModelClasses/products_model.dart';
import 'package:baba/Core/Services/get_api_data_service.dart';
import 'package:baba/ViewModel/product_detail_model.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/component/most_trending_grid.dart';
import 'package:baba/Views/component/productPropertyTable.dart';
import 'package:baba/get_services/cart_controller.dart';
import 'package:baba/utils/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baba/Views/component/products_gridview.dart';
import 'package:html/parser.dart' as htmlparser;

import 'bottom_nav_bar.dart';

class ProductDetail extends StatelessWidget {
  final Datum datum;

  ProductDetail({this.datum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Product Details'),
      body: GetBuilder<ProductDetailController>(
        init: ProductDetailController(datum),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Expanded(child: LayoutBuilder(
                  builder: (context, constraints) {
                    const titleStyle = TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Constant.mainOrangeColor);

                    const subTitle = TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black87);

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.6,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5.0,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  if (controller.isLoading) {
                                    return buildMostTrendingShimmer();
                                  }

                                  return Stack(
                                    children: [
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          // height: SizeConfig.screenHeight * 1,
                                          height: constraints.maxHeight,
                                          autoPlay: true,
                                          // aspectRatio: 0,
                                          viewportFraction: 1.0,
                                          enlargeCenterPage: true,
                                          enableInfiniteScroll: true,
                                          // enlargeStrategy: CenterPageEnlargeStrategy.height,

                                          // viewportFraction: 1,
                                          onPageChanged: (index, reason) async {
                                            controller.sliderIndex = index;

                                            controller
                                                .update(['slider_update']);
                                          },
                                        ),
                                        items: controller.imageSliders,
                                      ),
                                      Positioned(
                                        bottom: 0.0,
                                        child: Container(
                                          height: constraints.maxHeight * 0.2,
                                          width: constraints.maxWidth,
                                          margin: const EdgeInsets.only(
                                              right: 5, left: 5),
                                          decoration: const BoxDecoration(
                                            // color: Colors.red,

                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),

                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(0.0, 0.1),
                                                blurRadius: 20.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GetBuilder<ProductDetailController>(
                                          id: 'slider_update',
                                          builder: (_) {
                                            return Positioned(
                                              bottom: 10.0,
                                              right: 15.0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: controller
                                                    .imageSliders
                                                    .asMap()
                                                    .entries
                                                    .map((item) {
                                                  // int index = imgList.indexOf(item);

                                                  return Container(
                                                    width: 10.0,
                                                    height: 10.0,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 2.0),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: (Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white
                                                                : Constant
                                                                    .mainOrangeColor)
                                                            .withOpacity(
                                                                controller.sliderIndex ==
                                                                        item.key
                                                                    ? 0.9
                                                                    : 0.4)),
                                                  );
                                                }).toList(),
                                              ),
                                            );
                                          }),
                                      Positioned(
                                          bottom: 10.0,
                                          // right: 0,
                                          left: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.productDetailModel
                                                    .data.productDetial.title,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  // height: 1.44,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              getProductPrice(controller
                                                  .productDetailModel
                                                  .data
                                                  .productDetial),
                                            ],
                                          )),
                                      Positioned(
                                          top: 0,
                                          child: getExpiryDiscountPercentage(
                                              controller.productDetailModel.data
                                                  .productDetial)),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          if (!controller.isLoading)
                            if (controller.productDetailModel.data.productDetial
                                .isVariableProduct)
                              Card(
                                  elevation: 5.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          "Choose Option",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        for (int i = 0; i < controller
                                                    .productDetailModel
                                                    .data
                                                    .productAttributesAndVarients
                                                    .length;
                                            i++)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                    .productDetailModel
                                                    .data
                                                    .productAttributesAndVarients[i]
                                                    .attributesName,
                                                style: titleStyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    for (int k = 0;
                                                        k <
                                                            controller
                                                                .productDetailModel
                                                                .data
                                                                .productAttributesAndVarients[
                                                                    i]
                                                                .attributesVarients
                                                                .length;
                                                        k++)
                                                      GetBuilder<
                                                              ProductDetailController>(
                                                          id: "update_AttributeVarient",
                                                          builder: (_) {
                                                            return GestureDetector(
//====================================================================================================
                                                              onTap: () {
                                                                controller.selectedAttributeVarient[i][i] = k;
                                                                controller.selectedVarianlList = controller.selectedAttributeVarient.toList();

                                                              String item=controller
                                                                       .productDetailModel.data.productAttributesAndVarients[i]
                                                                       .attributesVarients[k].varientName;
                                                                print(
                                                                    "the option item is $item");

                                                                  if (controller.selectedOptionList.contains(item))
                                                                  {
                                                                    null;
                                                                  } else {
                                                                    controller.selectedOptionList.add(item);
                                                                  }

                                                                print(
                                                                    "list is ${controller.selectedOptionList}");

                                                                // List l=[];
                                                                // l.add(controller.productDetailModel.data.
                                                                // productAttributesAndVarients[i]
                                                                //     .attributesVarients[k].varientName);

                                                                controller
                                                                    .update([
                                                                  'update_AttributeVarient'
                                                                ]);
                                                                Get.find<
                                                                        CartController>()
                                                                    .update([
                                                                  'update_cart${datum.id}'
                                                                ]);
                                                              },

                                                              child: Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        5.0,
                                                                    horizontal:
                                                                        10.0),
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            20)),
                                                                    color: controller.selectedAttributeVarient[i][i] ==
                                                                            k
                                                                        ? Colors
                                                                            .blue
                                                                            .withOpacity(
                                                                                0.2)
                                                                        : Colors
                                                                            .grey
                                                                            .withOpacity(0.2)),
                                                                child: Text(
                                                                  controller
                                                                      .productDetailModel
                                                                      .data
                                                                      .productAttributesAndVarients[
                                                                          i]
                                                                      .attributesVarients[
                                                                          k]
                                                                      .varientName,
                                                                  style:
                                                                      subTitle,
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  )),
                          SizedBox(
                            height: constraints.maxHeight * 0.4,
                            child: Card(
                                elevation: 5.0,
                                child: LayoutBuilder(
                                  builder: (context, constraint) {
                                    var titleStyle = const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    );

                                    if (controller.isLoading) {
                                      return buildMostTrendingShimmer();
                                    }

                                    return Obx(() {
                                      // var html;
                                      //
                                      // if(controller.detailBox.value == DetailBox.details){
                                      //
                                      //   html = Html(
                                      //     data: controller.productDetailModel.data.productDetial.longDescription ,
                                      //
                                      //   );
                                      //
                                      // }else{
                                      //
                                      //   html = Html(
                                      //     data: controller.productDetailModel.data.productDetial.shortDiscription,
                                      //
                                      //   );
                                      //
                                      // }

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: constraint.maxWidth,
                                            height: constraint.maxHeight * 0.2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.detailBox.value =
                                                        DetailBox.details;
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      "Details",
                                                      style: titleStyle.apply(
                                                        color: controller
                                                                    .detailBox
                                                                    .value ==
                                                                DetailBox
                                                                    .details
                                                            ? Constant
                                                                .mainOrangeColor
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.detailBox.value =
                                                        DetailBox.description;
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      "Descrption",
                                                      style: titleStyle.apply(
                                                        color: controller
                                                                    .detailBox
                                                                    .value ==
                                                                DetailBox
                                                                    .description
                                                            ? Constant
                                                                .mainOrangeColor
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.detailBox.value =
                                                        DetailBox.other;
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      "Other",
                                                      style: titleStyle.apply(
                                                        color: controller
                                                                    .detailBox
                                                                    .value ==
                                                                DetailBox.other
                                                            ? Constant
                                                                .mainOrangeColor
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Divider(
                                            thickness: 1,
                                            height: 2,
                                            color: Colors.grey.withOpacity(0.6),
                                          ),

                                          // Expanded(
                                          //   child: Container(
                                          //     margin: const EdgeInsets.all(10.0),
                                          //     child: SingleChildScrollView(
                                          //       child: Text(
                                          //         controller.detailBox.value == DetailBox.details ?
                                          //         controller.productDetailModel.data.productDetial.longDescription :
                                          //         controller.productDetailModel.data.productDetial.shortDiscription,
                                          //         maxLines: null,
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),

                                          Expanded(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.all(10.0),
                                              child: SingleChildScrollView(
                                                child: Html(
                                                  data: controller.detailBox
                                                              .value ==
                                                          DetailBox.details
                                                      ? controller
                                                          .productDetailModel
                                                          .data
                                                          .productDetial
                                                          .longDescription
                                                      : controller
                                                          .productDetailModel
                                                          .data
                                                          .productDetial
                                                          .shortDiscription,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    });
                                  },
                                )),
                          )
                        ],
                      ),
                    );
                  },
                )),

                const SizedBox(
                  height: 5.0,
                ),
                //============================================================================================
                //button

                GetBuilder<CartController>(
                    id: "update_cart${datum.id}",
                    builder: (cartController) {
                      //  controller.addData();

                      bool isAddCartEnable = false;

                      bool isCartExist = false;

                      if (controller.productDetailModel != null) {
                        if (controller.productDetailModel.data.productDetial
                            .isVariableProduct) {
                          if (controller.selectedAttributeVarient.isNotEmpty) {
                            for (int i = 0;
                                i < controller.selectedAttributeVarient.length;
                                i++) {
                              // disable and anable  button logic is here,
                              for (int num = 0;
                                  num < controller.selectedVarianlList.length;
                                  num++) {
                                if (controller.selectedVarianlList[num][num] !=
                                        -1 &&
                                    num ==
                                        controller.selectedVarianlList.length -
                                            1) {
                                  // int a=controller.productDetailModel
                                  //     .data.productAttributesAndVarients.length;
                                  // controller.addData();

                                  //
                                  // print("name List is ${
                                  //     controller.productDetailModel.data.
                                  //     productAttributesAndVarients[num]
                                  //         .attributesVarients[num].varientName}");

                                  isAddCartEnable = true;

                                  break;
                                }
                              }
                            }
                          }
                        } else {
                          isAddCartEnable = true;
                        }
                      }

                      if (isAddCartEnable) {
                        for (final element in cartController.data) {
                          if (element.id == datum.id) {
                            isCartExist = true;

                            break;
                          }
                        }
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();

                              final controller = Get.find<NavbarController>();
                              controller.onSelectPage(2);
                              controller.bottomNavigationKey.currentState
                                  .setPage(2);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Constant.darkBlueColor
                                        .withOpacity(0.16),
                                    offset: Offset(0, 0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Image.asset(Assets.ShopingBag),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              if (isAddCartEnable) {
                                if (!isCartExist) {
                                  datum.cartQuantity = 1;

                                  if (controller.productDetailModel.data
                                      .productDetial.isVariableProduct) {
                                    addAttributesVarients(controller);

                                    cartController.data.add(datum);
                                  } else {
                                    cartController.data.add(datum);
                                  }
                                } else {
                                  for (int i = 0;
                                      i < cartController.data.length;
                                      i++) {
                                    if (cartController.data.elementAt(i).id ==
                                        datum.id) {
                                      if (controller.productDetailModel.data
                                          .productDetial.isVariableProduct) {
                                        // addAttributesVarients(controller);

                                        cartController.data
                                                .elementAt(i)
                                                .attributesVarients =
                                            datum.attributesVarients;
                                      }

                                      cartController.data
                                          .elementAt(i)
                                          .cartQuantity++;

                                      break;
                                    }
                                  }
                                }

                                cartController.update(
                                    ['update_cart${datum.id}', 'my_cart']);
                              }
                            },
                            child: Container(
                              alignment: Alignment(0.0, 0.04),
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: isAddCartEnable
                                    ? Constant.mainOrangeColor
                                    : Constant.darkGreyColor,
                              ),
                              child: Text(
                                isCartExist ? 'Add more' : 'Add to Cart',
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  color: Constant.greyColor,
                                  // height: 1.56,
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          if (isCartExist)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    for (int i = 0;
                                        i < cartController.data.length;
                                        i++) {
                                      if (cartController.data.elementAt(i).id ==
                                          datum.id) {
                                        if (datum.isVariableProduct) {
                                          final index = datum.attributesVarients
                                              .indexOf(datum
                                                  .attributesVarients.last);

                                          datum.attributesVarients
                                              .removeAt(index);

                                          if (datum
                                              .attributesVarients.isNotEmpty) {
                                            for (int i = 0;
                                                i <
                                                    controller
                                                        .productDetailModel
                                                        .data
                                                        .productAttributesAndVarients
                                                        .length;
                                                i++) {
                                              for (int k = 0;
                                                  k <
                                                      controller
                                                          .productDetailModel
                                                          .data
                                                          .productAttributesAndVarients[
                                                              i]
                                                          .attributesVarients
                                                          .length;
                                                  k++) {
                                                if (controller
                                                            .productDetailModel
                                                            .data
                                                            .productAttributesAndVarients[
                                                                i]
                                                            .attributesVarients[
                                                        k] ==
                                                    datum.attributesVarients
                                                        .last) {
                                                  controller
                                                          .selectedAttributeVarient[
                                                      i][i] = k;

                                                  controller.update([
                                                    'update_AttributeVarient'
                                                  ]);

                                                  break;
                                                }
                                              }
                                            }
                                          } else {
                                            controller
                                                    .selectedAttributeVarient[i]
                                                [i] = -1;

                                            controller.update(
                                                ['update_AttributeVarient']);
                                          }

                                          cartController.data
                                                  .elementAt(i)
                                                  .attributesVarients =
                                              datum.attributesVarients;
                                        }

                                        cartController.data
                                            .elementAt(i)
                                            .cartQuantity--;

                                        if (cartController.data
                                                .elementAt(i)
                                                .cartQuantity ==
                                            0) {
                                          cartController.data.removeAt(i);
                                        }

                                        break;
                                      }
                                    }

                                    cartController.update(
                                        ['update_cart${datum.id}', 'my_cart']);
                                  },
                                  child: SvgPicture.asset(
                                    Assets.minus_icon,
                                    width: 26,
                                    height: 26,
                                    color: Constant.mainOrangeColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${getCartCount(cartController.data, datum)}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    for (int i = 0;
                                        i < cartController.data.length;
                                        i++) {
                                      if (cartController.data.elementAt(i).id ==
                                          datum.id) {
                                        if (controller.productDetailModel.data
                                            .productDetial.isVariableProduct) {
                                          // addAttributesVarients(controller);

                                          cartController.data
                                                  .elementAt(i)
                                                  .attributesVarients =
                                              datum.attributesVarients;
                                        }

                                        cartController.data
                                            .elementAt(i)
                                            .cartQuantity++;

                                        break;
                                      }
                                    }

                                    cartController.update(
                                        ['update_cart${datum.id}', 'my_cart']);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(
                                      color: Constant.mainOrangeColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      );
                    }),
              ],
            ),
          );
        },
      ),
    );
  }

  addAttributesVarients(ProductDetailController controller) {
    for (int i = 0; i < controller.selectedAttributeVarient.length; i++) {
      if (controller.selectedAttributeVarient[i][i] != -1) {
        final attributesVarients = controller
            .productDetailModel
            .data
            .productAttributesAndVarients[i]
            .attributesVarients[controller.selectedAttributeVarient[i][i]];

        if (datum.attributesVarients == null) {
          datum.attributesVarients = [];

          datum.attributesVarients.add(attributesVarients);
        } else {
          datum.attributesVarients.add(attributesVarients);
        }
      }
    }

    // final attributesVarients =
    // controller.productDetailModel.data
    //     .productAttributesAndVarients[controller.selectedAttributeVarient.first]
    //     .attributesVarients[controller.selectedAttributeVarient.last];
  }

  Widget getProductPrice(data) {
    String actualPrice = "";

    String cutPrice = "";

    if (data.applyExpiryDiscount) {
      actualPrice = data.expiryDiscountedPrice.toString();

      cutPrice = data.actualPrice.toString();
    } else if (data.applyBulkDiscount) {
      actualPrice = data.bulkDiscountedPrice.toString();

      cutPrice = data.actualPrice.toString();
    } else {
      actualPrice = data.actualPrice.toString();
    }

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '£$actualPrice',
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            // height: 1.44,
          ),
          textAlign: TextAlign.start,
        ),
        if (cutPrice.isNotEmpty)
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                '£$cutPrice',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  color: Constant.hotPinkColor,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.lineThrough,
                  // height: 1.92,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        if (!data.applyExpiryDiscount && data.applyBulkDiscount)
          Container(
            // alignment: Alignment(-0.11, 0.11),
            width: 47.0,
            height: 21.0,

            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Constant.hotPinkColor,
            ),
            child: Center(
              child: Text(
                data.bulkDiscountInPercent.toString().toBulkDiscount(),
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 9.0,
                  color: Constant.greyColor,
                  // height: 2.78,
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget getExpiryDiscountPercentage(datum) {
    if (datum.applyExpiryDiscount) {
      String discountPercent = "0%\nOff";

      if (datum.expiryDiscountInPercent != null &&
          datum.expiryDiscountInPercent.isNotEmpty) {
        discountPercent =
            datum.expiryDiscountInPercent.substring(0, 2) + "%\nOff";
      }

      return Container(
          height: 70.r,
          width: 70.r,
          padding: EdgeInsets.only(bottom: 8.h, right: 5.w),
          decoration: BoxDecoration(
              color: Constant.greenColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60.r),
                topLeft: Radius.circular(10.r),
              )),
          child: Center(
            child: Text(
              discountPercent,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ));
    }

    return Container();
  }
}



class ProductDetailController extends GetxController {
  final Datum datum;

  List selectedVarianlList = [];
  List selectedOptionList = [];

  // String first;
  // String second;
  // String third;
  //
  // addData(){
  //   first=selectedOptionList[0].toString();
  //   second=selectedOptionList[1].toString();
  //   third=selectedOptionList[2].toString();
  //   print("the first is $first");
  //   print("the second is $second");
  //   print("the third is $third");
  //
  // }

  ProductDetailController(this.datum);

  bool isLoading = true;

  ProductDetailModel productDetailModel;

  void getProductDetail() async {
    try {
      isLoading = true;

      selectedAttributeVarient.clear();

      var response = await GetApiDataServices.fetchApiData(
          'GetProductById?id=${datum.id}');

      if (response['data'] != null) {
        productDetailModel = ProductDetailModel.fromJson(response);

        if (productDetailModel.data.productImges != null &&
            productDetailModel.data.productImges.isNotEmpty) {
          _loadSliderImages();

          for (int i = 0;
              i < productDetailModel.data.productAttributesAndVarients.length;
              i++) {
            selectedAttributeVarient.add({i: -1});
          }
        }
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  List<Widget> imageSliders = [];

  int sliderIndex = 0;

  final detailBox = DetailBox.details.obs;

  _loadSliderImages() {
    imageSliders = productDetailModel.data.productImges.map((item) {
      return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                item,
                height: 500,
                fit: BoxFit.cover,
                width: SizeConfig.screenWidth,
                // width: 1000.0,
              ),
            ],
          ));
    }).toList();
  }

  List<Map<int, int>> selectedAttributeVarient = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getProductDetail();
  }
}

enum DetailBox { details, description, other }
