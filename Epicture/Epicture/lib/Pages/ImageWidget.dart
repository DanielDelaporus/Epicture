import 'package:flutter/material.dart';
import '../api/API.dart';
import 'package:imgur/imgur.dart' as imgur;

class ImageWidget extends StatefulWidget {
  ImageWidget({Key key, this.link, this.vote, this.imgID}) : super(key: key);
  final String link;
  final String imgID;
  final imgur.VoteType vote;

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  List<Widget> gallery = new List<Widget>();
  MaterialColor up;
  MaterialColor down;

  @override
  // ignore: must_call_super
  void initState() {
    up = (widget.vote == imgur.VoteType.up) ? Colors.green : Colors.grey;
    down = (widget.vote == imgur.VoteType.down) ? Colors.green : Colors.grey;
  }

  void voteup() async {
    setState(() {
      up = Colors.green;
      down = Colors.grey;
    });
    await setvote(widget.imgID, imgur.VoteType.up);
  }

  void votedown() async {
    setState(() {
      up = Colors.grey;
      down = Colors.green;
    });
    await setvote(widget.imgID, imgur.VoteType.down);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      borderOnForeground: true,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(widget.link),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Icon(Icons.thumb_up, color: up),
                  color: Colors.blueGrey,
                  shape: CircleBorder(side: BorderSide.none),
                  onPressed: voteup,
                ),
                RaisedButton(
                  child: Icon(Icons.thumb_down, color: down),
                  color: Colors.blueGrey,
                  shape: CircleBorder(side: BorderSide.none),
                  onPressed: votedown,
                ),
              ],
            )
          ]),
    );
  }
}
