import 'dart:convert';
import 'package:flutter_app/modals/modals.dart';
import 'package:http/http.dart' as http;

class Covid19ApiHelper {
  Covid19ApiHelper._();

  static final Covid19ApiHelper covid19ApiHelper = Covid19ApiHelper._();

  Future<List<Covid19Data>?> fetchCovid19DataAPI() async {
    String url = "https://corona-api.com/countries";

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      List decodedDataList = decodedData["data"];

      List<Covid19Data> covidData = decodedDataList.map((e) {
        return Covid19Data.fromJSON(json: e);
      }).toList();
      return covidData;
    }
    return null;
  }
}
