import 'package:flutter/material.dart';
import '../api/API.dart';
import 'package:imgur/imgur.dart' as imgur;

class ImageWidget extends StatefulWidget {
  ImageWidget({Key key, this.img}) : super(key: key);
  final imgur.Image img;

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  List<Widget> gallery = new List<Widget>();
  MaterialColor up;
  MaterialColor down;
  MaterialColor fav;

  @override
  // ignore: must_call_super
  void initState() {
    up = (widget.img.vote == imgur.VoteType.up) ? Colors.green : Colors.grey;
    down =
        (widget.img.vote == imgur.VoteType.down) ? Colors.green : Colors.grey;
    fav = (widget.img.favorite) ? Colors.yellow : Colors.grey;
  }

  void addfav() async {
    setState(() {
      if (fav == Colors.grey)
        fav = Colors.yellow;
      else
        fav = Colors.grey;
    });
    await setfav(widget.img.id);
  }

  void voteup() async {
    setState(() {
      up = Colors.green;
      down = Colors.grey;
    });
    await setvote(widget.img.id, imgur.VoteType.up);
  }

  void votedown() async {
    setState(() {
      up = Colors.grey;
      down = Colors.green;
    });
    await setvote(widget.img.id, imgur.VoteType.down);
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
            Image.network(widget.img.link),
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
                RaisedButton(
                  child: Icon(Icons.star, color: fav),
                  color: Colors.blueGrey,
                  shape: CircleBorder(side: BorderSide.none),
                  onPressed: addfav,
                ),
              ],
            )
          ]),
    );
  }
}
