import 'package:flutter/material.dart';
import '../api/globals.dart';
import 'ImageWidget.dart';

class MyImagesPage extends StatefulWidget {
  MyImagesPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyImagesPageState createState() => _MyImagesPageState();
}

class _MyImagesPageState extends State<MyImagesPage> {
  List<Widget> gallery = new List<Widget>();

  String type(String link) {
    if (link.substring(link.length - 3, link.length) == "png") return "png";
    if (link.substring(link.length - 4, link.length) == "jpeg") return "jpeg";
    if (link.substring(link.length - 3, link.length) == "jpg") return "jpg";
    return "";
  }

  void getImages() {
    gallery.clear();
    for (var img in myImageslinks)
      if (img.link != null &&
          (type(img.link) == "png" ||
              type(img.link) == "jpeg" ||
              type(img.link) == "jpg")) {
        gallery.add(ImageWidget(
          link: img.link,
          vote: img.vote,
          imgID: img.id,
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
                  children: getGallery()),
            )
          ],
        ),
      ),
    );
  }
}
