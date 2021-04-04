import 'dart:async';
import 'globals.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:imgur/imgur.dart' as imgur;

Future<bool> getImagesAccount() async {
  try {
    final client = imgur.Imgur(imgur.Authentication.fromToken(token));
    print(myImageslinks);
    final resp = await client.account.getImages();
    print(myImageslinks);
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
  if (query == "") return false;
  try {
    final client = imgur.Imgur(imgur.Authentication.fromToken(token));
    searchedImageslinks.clear();
    List<imgur.GalleryAlbumImage> searchedImages =
        await client.gallery.search(query);
    if (searchedImages == null) print("FUCK");
    for (imgur.GalleryAlbumImage img in searchedImages) {
      if (img != null && img.images[0].type != "video/mp4")
        searchedImageslinks.add(img.images[0].link);
    }
    print(searchedImageslinks);
  } catch (e) {
    print(e);
    return false;
  }
  return true;
}

Future<bool> fetchLogin() async {
  //final client = imgur.Imgur(imgur.Authentication.fromToken(''));
  final url = Uri.https('api.imgur.com', '/oauth2/authorize', {
    'response_type': 'token', //"pin",
    'client_id': clientID,
    'redirect_uri': addr + "://success",
  });
  print(url.toString());
  try {
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: addr);
    print("SUCCESS ! --------------------- : " + result);
    token =
        Uri.parse(result.replaceAll('#', '?')).queryParameters['access_token'];
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}
