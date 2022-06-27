import 'package:baba/Core/Services/address_types_service.dart';
import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  
  OrderDetailsScreen(this.myOrder,{Key key}) : super(key: key);

  final myOrder;


  @override
  Widget build(BuildContext context) {

    TextStyle headingTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      fontSize: 16
    );

    TextStyle labelTextStyle = const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        fontSize: 16
    );
    
    return Scaffold(
      
      appBar: customAppBar('Order Details'),

      body: GetBuilder<OrderDetailsController>(

      init: OrderDetailsController(myOrder['orderRefNumber']),

      builder: (controller){

      if(controller.isLoading) {

        return const Center(

          child: CircularProgressIndicator(),

        );

      }

      final orderById = controller.orderById['data'];

      return
        SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(10.0),

          child: Column(

            children: [

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    "${myOrder['orderRefNumber']}",
                    style: headingTextStyle,
                  ),


                  Text(
                    "${orderById['orderStatus']}",
                    style: headingTextStyle.merge(
                        TextStyle(
                        color: orderById['orderStatus'] != 'Pending' ? Colors.green : Colors.red,
                        fontSize: 16
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 10,),



            ],

          ),
        ),
      );

      },

    ),
      
    );
    
  }
  
}


class OrderDetailsController extends GetxController{

  OrderDetailsController(this.refId);

  final AddressTypesServices _apiServices = AddressTypesServices();

  final LocalData _localData = LocalData();

  bool isLoading = true;

  String refId;

  var orderById;


  void getOrderById() async {

    try {

      final userId = await _localData.getKeyValueFromShareedPref();

      final response = await _apiServices.fetchOrderById(userId,refId);

      print('getMayOrders '+response.toString());

      if (response != null) {

        if(response['data'] != null) {

          orderById = response;

        }

      }

    }catch(e){

      print('getOrderById error '+ e.toString());

    } finally {

      isLoading = false;

      update();

    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getOrderById();

  }

}