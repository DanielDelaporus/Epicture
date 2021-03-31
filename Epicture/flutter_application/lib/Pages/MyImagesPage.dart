import 'package:flutter/material.dart';
import 'BotBar.dart';

class MyImagesPage extends StatefulWidget {
  MyImagesPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyImagesPageState createState() => _MyImagesPageState();
}

class _MyImagesPageState extends State<MyImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("My Images")],
        ),
      ),
    );
  }
}
