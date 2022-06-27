import 'dart:convert';

import 'package:baba/utils/constant.dart';

import 'package:http/http.dart' as http;
class ApiServices {
  static const APIURL =
      '${ApiConstant.BASEURL}/${ApiConstant.APIKEY}';

  Future resetPassword(String phoneNumber, String newPassword) async {
    var url = APIURL + '/ResetPassword';
    Object data = json.encode({
      "phoneNumber": phoneNumber,
      "newPassword": newPassword
    });

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: data);
    if (response.statusCode == 200) {
      print('response in service class ${response.body}');
      return json.decode(response.body);
    } else
      return false;
  }
  Future login(String email, String password) async {
    var url = APIURL + '/CustomerLogin';
    Object data = json.encode({
      "email": email,
      "password": password,
    });

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: data);
    if (response.statusCode == 200) {
      print('login ${response.body}');
      return json.decode(response.body);
    } else
      return false;
  }

  Future updateFirebaseDeviceId(String token, String id) async {
    var url = APIURL + '/UpdateCustomerFirebaseDeviceId';
    Object data = json.encode({
      "customerId": id,
      "firebaseDeviceId": token,

    });

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: data);
    if (response.statusCode == 200) {
      print('updateFirebaseDeviceId ${response.body}');
      return json.decode(response.body);
    } else
      return false;
  }

  Future updateCustomerDeviceInfo(bool isAndroidUser, String id) async {
    var url = APIURL + '/UpdateCustomerDeviceInfo';
    Object data = json.encode({
      "customerId": id,
      "IsAndroidUser": isAndroidUser,
    });

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: data);
    if (response.statusCode == 200) {
      print('updateFirebaseDeviceId ${response.body}');
      return json.decode(response.body);
    } else
      return false;
  }

  Future updateCustomerDevicePhysicalAddress(String deviceId, String id) async {

    var url = APIURL + '/UpdateCustomerDevicePhysicalAddress';
    Object data = json.encode({
      "customerId": id,
      "customerDevicePhysicalAddress": deviceId,
    });

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: data);
    if (response.statusCode == 200) {
      print('updateCustomerDevicePhysicalAddress ${response.body}');
      return json.decode(response.body);
    } else
      return false;
  }

  Future register(String name, String email, String phoneNumber,String password,bool isSocailSignUp,String socialLoginId,String deviceId,int socialSignupTypeId, String imgUrl) async {
    var url = APIURL + '/CustomerSignUp';
    print(url);
    var data = json.encode({
      "fullName": name,
      "email": email,
      "phoneNumber": phoneNumber,
       "password": password,
      "isSocailSignUp": isSocailSignUp,
      "socialLoginId": socialLoginId,
      "deviceId": 'null346',
      "socialSignupTypeId": socialSignupTypeId,
      "goolgeProfileImgUrl": imgUrl
    });
    print('before api hit....');

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: data);
    if (response.statusCode == 200) {
      print('user signUp Response.....'+response.body.toString());
      return json.decode(response.body);
    } else
      print(response.body.toString());
    return false;
  }

  static Future fetchAppImages(String endpoint) async {
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
}
