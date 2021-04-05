import 'dart:async';
import 'globals.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:imgur/imgur.dart' as imgur;

Future<bool> getImagesAccount() async {
  try {
    final client = imgur.Imgur(imgur.Authentication.fromToken(token));
    final resp = await client.account.getImages();
    if (resp.isEmpty) return false;
    myImageslinks.clear();
    for (var img in resp) {
      myImageslinks.add(img);
    }
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> getFavAccount() async {
  try {
    final client = imgur.Imgur(imgur.Authentication.fromToken(token));
    List<imgur.GalleryAlbumImage> resp =
        await client.account.getFavoriteImages();
    myFavImages.clear();
    for (var gal in resp) {
      if (gal.isAlbum)
        myFavImages.add(gal.images[0]);
      else
        myFavImages.add(imgur.Image(
            link: gal.link,
            vote: gal.vote,
            favorite: gal.favorite,
            id: gal.id));
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
      if (img.isAlbum)
        searchedImageslinks.add(img.images[0]);
      else
        searchedImageslinks.add(imgur.Image(
            link: img.link,
            vote: img.vote,
            favorite: img.favorite,
            id: img.id));
    }
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

Future<bool> setvote(String id, imgur.VoteType vote) async {
  try {
    final client = imgur.Imgur(imgur.Authentication.fromToken(token));
    final resp = await client.image.vote(id, vote);
    if (resp) return false;
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> setfav(String id) async {
  try {
    final client = imgur.Imgur(imgur.Authentication.fromToken(token));
    final resp = await client.image.favorite(id);
    if (resp == "") return false;
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}
