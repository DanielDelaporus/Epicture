import 'package:flutter/material.dart';
import '../api/globals.dart';
import '../api/API.dart';
import 'ImageWidget.dart';

class MyFavImages extends StatefulWidget {
  MyFavImages({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFavImagesState createState() => _MyFavImagesState();
}

class _MyFavImagesState extends State<MyFavImages> {
  List<Widget> gallery = new List<Widget>();
  @override
  void initState() {
    super.initState();
    getImages();

    getFavAccount().then((int) {
      getImages();
    });
  }

  String type(String link) {
    if (link.substring(link.length - 3, link.length) == "png") return "png";
    if (link.substring(link.length - 4, link.length) == "jpeg") return "jpeg";
    if (link.substring(link.length - 3, link.length) == "jpg") return "jpg";
    return "";
  }

  void getImages() {
    gallery.clear();
    for (var img in myFavImages)
      if (img.link != null &&
          (type(img.link) == "png" ||
              type(img.link) == "jpeg" ||
              type(img.link) == "jpg")) {
        gallery.add(ImageWidget(
          img: img,
        ));
        print(img.vote);
      }
  }

  List<Widget> getGallery() {
    getImages();
    return gallery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  addAutomaticKeepAlives: true,
                  children: gallery),
            )
          ],
        ),
      ),
    );
  }
}
