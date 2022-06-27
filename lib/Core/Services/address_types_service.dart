import 'dart:convert';

import 'package:baba/Core/ModelClasses/place_order_model.dart';
import 'package:baba/ViewModel/order_detail_screen_getOrderById.dart';
import 'package:baba/utils/constant.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
class AddressTypesServices {
  static const APIURL = '${ApiConstant.BASEURL}/${ApiConstant.APIKEY}';

  GetOrderByIdModel getOrderByIdModel=GetOrderByIdModel();

  Future fetchAddressTypes(String endpoint) async {

    final response =
    await http.get(Uri.parse('${APIURL}/${endpoint}'));
    print('after api hit');
    print(response.statusCode.toString());

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      if(parsed["data"]!=null){
        print(parsed.toString());
        return parsed;
      }


    } else {
      throw Exception('Failed to load album');
    }
  }

  Future fetchCustomerAddress(String userId) async {
    final response =
    await http.get(Uri.parse('${APIURL}/GetCustomerAddress?Id=${userId}'));
    print('after api hit');
    print(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 404) {
      final parsed = json.decode(response.body);
      print(parsed.toString());
      if(parsed["data"]!=null){
        print(parsed.toString());
        return parsed;
      }


    } else {
      throw Exception('Failed to load album');
    }
  }

  Future deleteCustomerAddress(String addressId) async {
    final response =
    await http.get(Uri.parse('${APIURL}/DeleteCustomerAddress?CustomerAddressId=$addressId'));
    print('after api hit');
    print(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 404) {
      final parsed = json.decode(response.body);
      print(parsed.toString());
      if(parsed["status"] != null && parsed['status'] == 'Ok'){
        print(parsed.toString());
        return parsed;
      }


    } else {
      throw Exception('Failed to load album');
    }
  }

  Future fetchPaymentMethods(String userId) async {
    final response =
    await http.get(Uri.parse('${APIURL}/GetPaymentMethods?Id=${userId}'));
    print('after api hit');
    print(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 404) {
      final parsed = json.decode(response.body);
      print(parsed.toString());
      if(parsed["data"]!= null){
        print(parsed.toString());
        return parsed;
      }


    } else {
      throw Exception('Failed to load album');
    }
  }


  Future fetchMayOrders(String userId) async {

    final response =
    await http.get(Uri.parse('${APIURL}/GetCustomerActiveOrders?CustomerId=${userId}'));
    print('after api hit');
    print(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 404) {
      final parsed = json.decode(response.body);
      print(parsed.toString());
      if(parsed["data"]!= null){
        print(parsed.toString());
        return parsed;
      }


    } else {
      throw Exception('Failed to load album');
    }
  }

  Future fetchOrderById(String userId, String orderId) async {

     print("orderId:  $orderId");

     print("Url: ${'${APIURL}/GetOrderById?OrderId=$orderId'}");
    final response =
    //  GetOrderById?OrderId=be5fc1df-370a-422d-8c3b-a10a4c5db0bc
    await http.get(Uri.parse('${APIURL}/GetOrderById?OrderId=$orderId'));

    Get.log("GetOrderById body: ${response.body}");

    print('after api hit');

    final responseBody = response.body;

    if (response.statusCode == 200 || response.statusCode == 404) {
      final decodeResponse = jsonDecode(responseBody);
      print(decodeResponse);
      getOrderByIdModel = GetOrderByIdModel.fromJson(decodeResponse);
      return getOrderByIdModel;

      final parsed = json.decode(response.body);
      print(parsed.toString());



      if(parsed["data"]!= null){
        // print(parsed.toString());
        return responseBody;
      }


    } else {
      throw Exception('Failed to load album');
    }

  }


  Future fetchOrdersHistory(String userId) async {

    final response =
    await http.get(Uri.parse('${APIURL}/GetCustomerOrdersHistory?CustomerId=${userId}'));
    print('after api hit');
    print(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 404) {
      final parsed = json.decode(response.body);
      print(parsed.toString());
      if(parsed["data"]!= null){
        print(parsed.toString());
        return parsed;
      }


    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<dynamic> addAddress(int addressTypeId,String address,String street,String code,String city,String country,String customerId) async {
    var url = APIURL + '/AddCustomerAddress';
    Object data = json.encode({

        "addressTypeId": addressTypeId,
        "street": street,
        "code": code,
        "city": city,
        "country": country,
        "customerId": customerId,
        "address": address,

    });

    print("addAddress data: $data");

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: data);
    if (response.statusCode == 200) {
      print('location api response in service class ${response.body}');
      return json.decode(response.body);
    } else
      return false;
  }

  Future<dynamic> placeOrder(PlaceOrderModel placeOrderModel) async {
    var url = APIURL + '/PlaceOrder';

    print("placeOrder data: ${json.encode(placeOrderModel.toJson())}");

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: json.encode(placeOrderModel.toJson()));
    if (response.statusCode == 200) {

      print('placeOrder response ${response.body}');

      return json.decode(response.body);
    } else {
      return false;
    }
  }


  Future<dynamic> submitRating(data) async {

    var url = APIURL + '/AddCustomerReview';

    print("AddCustomerReview data: ${json.encode(data)}");

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: json.encode(data));
    if (response.statusCode == 200) {

      print('AddCustomerReview response ${response.body}');

      return json.decode(response.body);
    } else {
      return false;
    }
  }


  Future<dynamic> updateCustomerProfile(Map<String, dynamic> data) async {
    var url = APIURL + '/UpdateCustomerProfile';

    Get.log("UpdateCustomerProfile data: ${json.encode(data)}");

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: json.encode(data));
    if (response.statusCode == 200) {

      Get.log('UpdateCustomerProfile response ${response.body}');

      return json.decode(response.body);
    } else {
      return null;
    }
  }

  Future<dynamic> saveCustomerRechargeTransaction(Map<String,dynamic> data) async {
    var url = APIURL + '/SaveCustomerRechargeTransaction';

    print("saveCustomerRechargeTransaction data: ${json.encode(data)}");

    http.Response response = await http.post(Uri.parse(url),headers: {
      // 'Authorization': 'Bearer ${StripeServices.secret}',
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: json.encode(data));

    print('saveCustomerRechargeTransaction response ${response.body}');

    if (response.statusCode == 200) {

      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> fetchUserProfileData(var userId) async {
    // var request = http.Request('POST', Uri.parse('http://hajibabaapi.asollearning.com/api/GetCustomerById?Id=${userId}'));
    // request.body = '''''';
    //
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    //   // var response1 = await http.Response.fromStream(response);
    //   // print('new response'+ response1.toString());
    //   var resp = await jsonDecode(await response.stream.bytesToString());
    //   print('jsonic response'+ resp.toString());
    //   return resp;
    // }
    // else {
    //   print(response.reasonPhrase);
    //   return false;
    // }

    var url = APIURL + '/GetCustomerById?Id=${userId}';
    var body = '''''';
    print('befor api hit');

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: body);
    if (response.statusCode == 200) {
      print('location api response in service class ${response.body}');
      return json.decode(response.body);
    } else
      return false;
  }



}
