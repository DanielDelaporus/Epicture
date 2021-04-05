import 'package:flutter/material.dart';
import 'MyImagesPage.dart';
import 'MyFavImages.dart';
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
  Widget body = MyImagesPage();
  Text text = Text("My Gallery");

  Future changeIndex(int touched) async {
    setState(() {
      index = touched;
    });
    body = await getBody(index);
    text = await getText(index);
  }

  Future<Text> getText(int ind) async {
    switch (ind) {
      case 0:
        return Text("My Gallery");
        break;
      case 1:
        return Text("Search");
        break;
      case 2:
        return Text("Favorites");
        break;
      case 3:
        return Text("Upload");
        break;
      default:
        return Text("ERROR");
    }
  }

  Future<Widget> getBody(int ind) async {
    switch (ind) {
      case 0:
        getImagesAccount();
        return MyImagesPage();
        break;
      case 1:
        return SearchImage();
        break;
      case 2:
        getFavAccount();
        return MyFavImages();
        break;
      case 3:
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
        title: text,
      ),
      body: Center(
        child: body,
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
            label: 'Favorites',
            icon: Icon(Icons.star_outline),
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
