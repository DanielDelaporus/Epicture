import 'dart:async';
import 'globals.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:imgur/imgur.dart' as imgur;

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

Future<bool> getImagesAccount(String username, String password) async {
  final client =
      imgur.Imgur(imgur.Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  /// Get your uploaded images
  final resp = await client.account.getImages();

  print(resp);
}

Future<bool> uploadImagesAccount(String username, String password) async {
  final client =
      imgur.Imgur(imgur.Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  /// Upload an image from path
  await client.image
      .uploadImage(
          imagePath: '/path/of/the/image.png',
          title: 'A title',
          description: 'A description')
      .then((image) => print('Uploaded image to: ${image.link}'));
}

Future<bool> fetchLogin() async {
  //final client = imgur.Imgur(imgur.Authentication.fromToken(''));
  final url = Uri.https('api.imgur.com', '/oauth2/authorize', {
    'client_id': clientID,
    'response_type': 'token', //"pin",
    'redirect_uri': 'com.example.flutter_application',
  });
  print(url.toString());
  final result = await FlutterWebAuth.authenticate(
      url: url.toString(),
      callbackUrlScheme: 'com.example.flutter_application');
  if (result == "") return false;
  token = result;
  print(result);
  return true;
}
