import 'dart:convert';

import 'package:baba/utils/constant.dart';

import 'package:http/http.dart' as http;
class StoresDataServices {
  static const APIURL =
      '${ApiConstant.BASEURL}/${ApiConstant.APIKEY}';

  Future fetchStoresData(String endpoint) async {

    print('StoreUrl: ${APIURL}/${endpoint}');

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



  Future fetchSearchStoresData(String searchText) async {

    print("searching ");
    //print('StoreUrl: ${APIURL}/${endpoint}');
    final Url="http://hajibabaapi.asollearning.com/api/SearchStores?SearchTerm=$searchText";
    print("Url is:  $Url");

    final response =
    await http.get(Uri.parse(Url));
    print('after api hit');
 //   print(response.statusCode.toString());

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);
      if(parsed["data"]!=null){
        print(parsed.toString());
        return parsed;
      }
    } else {
      throw Exception('Failed to load album');
    }
  }



  Future addStore(String uId, String storeId) async {
    var url = APIURL + '/AddCustomerStore';
    Object data = json.encode({
      "customerId": uId,
      "storeId": storeId,
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
