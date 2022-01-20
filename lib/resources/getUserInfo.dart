import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:login_user/models/signup_models.dart';

class getUserInfo{
  Client client=Client();
  Future<User> fetchUsersDetails() async{
    final response = await client.get(Uri.parse('https://sandbox.9930i.com/central/fetch_logs/info.log'));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return User.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}