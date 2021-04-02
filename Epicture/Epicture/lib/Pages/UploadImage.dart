import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../api/API.dart';

class UploadImage extends StatefulWidget {
  UploadImage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  String imagePath = "";
  final imagePicker = ImagePicker();
  File image;

  String errormsg = "";
  String uploaded = "";

  void uploadImage() async {
    if (imagePath == "" ||
        titleController.text == "" ||
        descriptionController.text == "") {
      setState(() {
        errormsg = "Fill all the field to upload";
      });
    } else {
      bool resp = await uploadImages(
          imagePath, titleController.text, descriptionController.text);
      setState(() {
        if (resp) {
          uploaded = "Image Uploaded";
          errormsg = "";
        } else {
          uploaded = "";
          errormsg = "Error during upload";
        }
      });
    }
  }

  Future getImage() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        uploaded = "Image selected";
        image = File(pickedFile.path);
        imagePath = pickedFile.path;
      } else {
        uploaded = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: TextField(
              controller: titleController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Enter a Title',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TextField(
              controller: descriptionController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Enter a Description',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: ButtonTheme(
              height: 340,
              child: RaisedButton(
                child: Icon(Icons.add_photo_alternate,
                    color: Colors.white, size: 120),
                color: Colors.blueGrey,
                shape: CircleBorder(side: BorderSide.none),
                onPressed: getImage,
              ),
            ),
          ),
          Text(uploaded, style: TextStyle(color: Colors.green)),
          Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: ButtonTheme(
              height: 56,
              child: RaisedButton(
                child: Text('Upload',
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: uploadImage,
              ),
            ),
          ),
          Text(errormsg, style: TextStyle(color: Colors.red)),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
