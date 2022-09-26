import 'dart:convert';

import 'package:flutter_app/modals/user_modal.dart';
import 'package:http/http.dart' as http;


class UserDetailsAPI {
  UserDetailsAPI._();

  static final UserDetailsAPI userDetailsAPI = UserDetailsAPI._();

  Future<UserDetails?> fetchUserDetailsAPI() async {
    String url = "https://randomuser.me/api/";

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      UserDetails user = UserDetails.fromJSON(json: decodedData);
      return user;
    }
    return null;
  }
}
