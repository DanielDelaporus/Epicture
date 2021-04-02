import 'package:flutter/material.dart';
import 'MyImagesPage.dart';
import '../api/API.dart';
import 'UploadImage.dart';
import 'SearchImage.dart';

class BotBar extends StatefulWidget {
  BotBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BotBarState createState() => _BotBarState();
}

class _BotBarState extends State<BotBar> {
  int index = 0;

  void changeIndex(int touched) {
    setState(() {
      index = touched;
    });
  }

  Text getText(int ind) {
    switch (ind) {
      case 0:
        return Text("My Gallery");
        break;
      case 1:
        return Text("Search");
        break;
      case 2:
        return Text("Upload");
        break;
      default:
        return Text("ERROR");
    }
  }

  Widget getBody(int ind) {
    switch (ind) {
      case 0:
        getImagesAccount();
        return MyImagesPage();
        break;
      case 1:
        return SearchImage();
        break;
      case 2:
        return UploadImage();
        break;
      default:
        return Text("ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getText(index),
      ),
      body: Center(
        child: getBody(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'My Images',
            icon: Icon(Icons.insert_photo_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Upload Image',
            icon: Icon(Icons.file_upload),
          ),
        ],
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: changeIndex,
      ),
    );
  }
}
