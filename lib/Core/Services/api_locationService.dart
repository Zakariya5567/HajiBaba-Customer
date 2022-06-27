import 'dart:convert';

import 'package:baba/utils/constant.dart';

import 'package:http/http.dart' as http;
class ApiLocationServices {
  static const APIURL =
      '${ApiConstant.BASEURL}/${ApiConstant.APIKEY}';

  Future addLocation(String uId, String lat,String lng) async {
    var url = APIURL + '/AddCustomerLocation';
    Object data = json.encode({
      "customerId": uId,
      "lat": lat,
      "lng": lng
    });

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


}
