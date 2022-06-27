import 'dart:convert';

import 'package:baba/utils/constant.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
class GetApiDataServices {
  static const APIURL =
      '${ApiConstant.BASEURL}/${ApiConstant.APIKEY}';

  static Future fetchApiData(String endpoint) async {

    Get.log("$endpoint parameters: $APIURL/$endpoint");
    final response =
    await http.get(Uri.parse('${APIURL}/${endpoint}'));
    Get.log("$endpoint Status Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      Get.log("$endpoint Response: ${response.body}");
      final parsed = json.decode(response.body);
      if(parsed != null){

        return parsed;

      }

    } else {

      throw Exception('Failed to load album');

    }

  }

  static Future postApiData(String endpoint,body) async {

    Get.log("$endpoint parameters: $APIURL/$endpoint");

    print("$endpoint body: ${json.encode(body)}");

    http.Response response = await http.post(Uri.parse('$APIURL/$endpoint'),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }, body: json.encode(body));
    if (response.statusCode == 200) {

      print('$endpoint response: ${response.body}');

      return json.decode(response.body);

    } else {

      return false;

    }
  }
}
