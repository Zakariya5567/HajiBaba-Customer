import 'dart:convert';

import 'package:baba/utils/constant.dart';

import 'package:http/http.dart' as http;
class SocialLoginServices {
  static const APIURL =
      '${ApiConstant.BASEURL}/${ApiConstant.APIKEY}';
  Future socialLogin(String socialLoginId) async {
    var url = APIURL + '/CustomerSocialLogin';
    Object data = json.encode({
      "socialSigninId": socialLoginId,
    });

    http.Response response = await http.post(Uri.parse(url),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: data);
    if (response.statusCode == 200) {
      print('location api response in service class ${response.body}');
      return await json.decode(response.body);
    } else
      return false;
  }
}
