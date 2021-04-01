import 'package:flutter/material.dart';
import '../api/API.dart';
import '../api/globals.dart';

class SearchImage extends StatefulWidget {
  SearchImage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchImageState createState() => _SearchImageState();
}

class _SearchImageState extends State<SearchImage> {
  TextEditingController searchController = new TextEditingController();
  //List<Image> list = searchedImages = new List<Image>();

  void submitSearch(String query) async {
    bool resp = await searchImages(query);
    if (!resp) print("------------------------ Submission error");
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
            for (var link in searchedImageslinks)
              if (link != null) Image.network(link),
          ],
        ),
      ),
    );
  }
}
