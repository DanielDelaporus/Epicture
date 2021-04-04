import '../globals.dart';
import '../api/API.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String errorOnSignIn = "";

  final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'epicture',
          child: CircleAvatar(
            radius: 56.0,
            child: Image.asset('assets/logo.png'),
          )));

  void loginClicked() async {
    bool resp = await fetchLogin();
    if (resp) {
      await getImagesAccount();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logo,
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: ButtonTheme(
                height: 56,
                child: RaisedButton(
                  child: Text('Connect to Imgur',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: loginClicked,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(errorOnSignIn,
                    style: TextStyle(color: Colors.red, fontSize: 10)))
          ],
        ),
      ),
    );
  }
}
