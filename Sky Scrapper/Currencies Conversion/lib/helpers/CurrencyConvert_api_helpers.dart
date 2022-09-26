import 'dart:convert';
import 'package:flutter_app/modals/Currency_Convert.dart';
import 'package:http/http.dart' as http;

class CurrencyConvertAPIHelpers {
  CurrencyConvertAPIHelpers._();

  static final CurrencyConvertAPIHelpers currencyConvertAPIHelpers =
      CurrencyConvertAPIHelpers._();

  Future<CurrencyConvert?> currencyConvertorAPI(
      {required String countryFrom,
      required String countryTo,
      required int amount}) async {
    final String BASE_URL = "https://api.exchangerate.host/";
    final String ENDPOINT =
        "convert?from=$countryFrom&to=$countryTo&amount=$amount";

    http.Response res = await http.get(Uri.parse(BASE_URL + ENDPOINT));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      CurrencyConvert currencyConvert =
          CurrencyConvert.fromJSON(json: decodedData);
      return currencyConvert;
    }
    return null;
  }
}
