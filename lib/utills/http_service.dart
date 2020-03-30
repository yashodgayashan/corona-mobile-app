import 'dart:convert';

import 'package:corona_app/utills/corona_info.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HttpService {
  final String getUrl = "https://thevirustracker.com/free-api?countryTotal=";

  Future<CoronaData> getPost({@required String id}) async {
    Response res = await get(getUrl + id);

    if(res.statusCode == 200){
      List<dynamic> subData = jsonDecode(res.body)["countrydata"];
      debugPrint(subData[0].toString());
      CoronaData coronaData = CoronaData.fromJSON(subData[0]);
      debugPrint(coronaData.country.country);
      debugPrint(coronaData.country.code);
      debugPrint(coronaData.totalActiveCases.toString());
      return coronaData;
    }
  }
}
