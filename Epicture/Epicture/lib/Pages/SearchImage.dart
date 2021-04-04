import 'package:flutter/material.dart';
import '../api/API.dart';
import '../api/globals.dart';
import 'ImageWidget.dart';

class SearchImage extends StatefulWidget {
  SearchImage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchImageState createState() => _SearchImageState();
}

class _SearchImageState extends State<SearchImage> {
  TextEditingController searchController = new TextEditingController();
  //List<Image> list = searchedImages = new List<Image>();
  List<Widget> gallery = new List<Widget>();

  void submitSearch(String query) async {
    bool resp = await searchImages(query);
    getImages();
    if (!resp) print("------------------------ Submission error");
  }

  String type(String link) {
    if (link.substring(link.length - 3, link.length) == "png") return "png";
    if (link.substring(link.length - 4, link.length) == "jpeg") return "jpeg";
    if (link.substring(link.length - 3, link.length) == "jpg") return "jpg";
    return "";
  }

  void getImages() {
    setState(() {
      gallery.clear();
      for (var img in searchedImageslinks)
        if (img.link != null &&
            (type(img.link) == "png" ||
                type(img.link) == "jpeg" ||
                type(img.link) == "jpg"))
          gallery.add(ImageWidget(
            link: img.link,
            vote: img.vote,
            imgID: img.id,
          ));
    });
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10, top: 10),
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.emailAddress,
                onSubmitted: submitSearch,
                decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
              ),
            ),
            new Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                addAutomaticKeepAlives: true,
                children: getGallery(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
