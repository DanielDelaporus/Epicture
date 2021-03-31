import 'package:flutter/material.dart';
import 'BotBar.dart';

class SearchImage extends StatefulWidget {
  SearchImage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchImageState createState() => _SearchImageState();
}

class _SearchImageState extends State<SearchImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Search")],
        ),
      ),
    );
  }
}
