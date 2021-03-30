import 'dart:async';
import 'dart:convert';
import 'globals.dart';

import 'package:http/http.dart' as http;
/*
Future<bool> isAuth() async {
  final prefs = await SharedPreferences.getInstance();
  final cookie = prefs.getString('cookie');
  final userIdStorage = prefs.getString('user_id');
  headers['Content-Type'] = 'application/json; charset=UTF-8';
  headers['cookie'] = cookie;
  userID = userIdStorage;

  final response = await http.get(urlArea + '/auth/isauth', headers: headers);

  Map<String, dynamic> isConnected = jsonDecode(response.body);
  if (response.statusCode == 200 && isConnected['connected'] == true) {
    userID = isConnected['userID'];
    prefs.setString('user_id', userID);
    headers['cookie'] = cookie;
    return true;
  } else {
    return false;
  }
}

void disconnect() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('cookie');
  headers.remove('cookie');
  prefs.remove('userID');
  userID = "";
}*/

Future<bool> fetchLogin(String username, String password) async {
  headers['Content-Type'] = 'application/json; charset=UTF-8';

  final response = await http.post(
    url + '/auth/login',
    headers: headers,
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
