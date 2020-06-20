import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:store/client_screens/products.dart';
import 'package:store/utilites/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  var pName;
  var pPrice;
  var pCategory;
  var pDesc;
  StorageReference storageReference = FirebaseStorage.instance.ref();
  File _image;
  String _uploadedFileURL;
  final picker = ImagePicker();

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });

    uploadPic();
  }

  Future uploadPic() async {
    String fileName = Path.basename(_image.path);
    StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    final url = dowurl.toString();
    return url;
  }


  Future<void> add() async {
    final path = await uploadPic();
    print(path);
    Firestore.instance.collection('products').document().setData({
      'name': pName,
      'price': pPrice,
      'category': pCategory,
      'description': pDesc,
      'image': path,

    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Products(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
        ),
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            NewTextField(
              onChanged: (value) => pName = value,
              hintText: 'Product Name',
            ),
            NewTextField(
              onChanged: (value) => pPrice = value,
              hintText: 'Product Price',
            ),
            NewTextField(
              onChanged: (value) => pCategory = value,
              hintText: 'Category',
            ),
            NewTextField(
              onChanged: (value) => pDesc = value,
              hintText: 'Description',
            ),
            SizedBox(
              height: 8,
            ),
            MyButton(
              text: "Pick Image",
              onPressed: chooseFile,
            ),
            SizedBox(
              height: 16,
            ),
            MyButton(
              text: 'Add Product',
              onPressed: add,
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}

class NewTextField extends StatelessWidget {
  final String hintText;
  final Function onChanged;

  NewTextField({this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: onChanged,
          cursorRadius: Radius.circular(3),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
