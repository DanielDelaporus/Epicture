import '../globals.dart';
import '../api/Login.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String errorOnSignIn = "";

  final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'epicture',
          child: CircleAvatar(
            radius: 56.0,
            child: Image.asset('assets/logo.png'),
          )));

  void loginClicked() {
    //if (fetchLogin(emailController.text, passwordController.text)) {
    //Navigator.pushNamed(context, '/login');
    fetchLogin();
    /*
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
      setState(() {
        errorOnSignIn = "";
      });
    } else {
      setState(() {
        errorOnSignIn = "Error in mail or password";
      });
    }*/
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
            /*Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Username or Email',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
              ),
            ),*/
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
