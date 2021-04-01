import 'dart:async';
import 'globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:imgur/imgur.dart' as imgur;

Future<bool> getImagesAccount() async {
  try {
    final client = imgur.Imgur(imgur.Authentication.fromToken(token));
    final resp = await client.account.getImages();
    if (resp.isEmpty) return false;
    myImageslinks.clear();
    for (var img in resp) {
      myImageslinks.add(img.link);
    }
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> uploadImages(String path, String title, String description) async {
  if (path.isEmpty || title.isEmpty || description.isEmpty) return false;
  final client = imgur.Imgur(imgur.Authentication.fromToken(token));
  await client.image
      .uploadImage(imagePath: path, title: title, description: description)
      .then((image) => print('Uploaded image to: ${image.link}'));
  return true;
}

Future<bool> searchImages(String query) async {
  try {
    var client = imgur.Imgur(imgur.Authentication.fromClientId(clientID));
    if (token != "")
      client = imgur.Imgur(imgur.Authentication.fromToken(token));
    searchedImageslinks.clear();
    var searchedImages = (await client.gallery.search(query));
    for (var img in searchedImages) {
      searchedImageslinks.add(img.images[0].link);
    }
  } catch (e) {
    print(e);
    return false;
  }
  return true;
}

Future<bool> fetchLogin(BuildContext context) async {
  //final client = imgur.Imgur(imgur.Authentication.fromToken(''));
  final url = Uri.https('api.imgur.com', '/oauth2/authorize', {
    'response_type': 'token', //"pin",
    'client_id': clientID,
    'redirect_uri': 'com.example.flutter_application://success',
  });
  print(url.toString());
  try {
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: 'com.example.flutter_application');
    print(result);
    token = result;
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}
