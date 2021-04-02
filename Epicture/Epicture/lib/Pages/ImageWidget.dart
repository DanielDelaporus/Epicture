import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({Key key, this.link}) : super(key: key);
  final String link;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      borderOnForeground: true,
      child: Image.network(link),
    );
  }
}
