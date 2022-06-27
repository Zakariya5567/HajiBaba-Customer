import 'dart:convert';

import 'package:baba/utils/constant.dart';

import 'package:http/http.dart' as http;
class SocialSignup_ApiServices {
  static const APIURL =
      '${ApiConstant.BASEURL}/${ApiConstant.APIKEY}';

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
      print('response in service class ${response.body}');
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
