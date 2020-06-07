import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:store/utilites/button.dart';
import 'package:image_picker/image_picker.dart';

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
  final picker = ImagePicker();

  void getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
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
              onPressed: getImage,
            ),
            SizedBox(
              height: 16,
            ),
            MyButton(
              text: 'Add Product',
              onPressed: () {},
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
