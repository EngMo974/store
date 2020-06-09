import 'dart:io';
import 'package:flutter/material.dart';
import 'package:store/client_screens/productsList.dart';
import 'package:store/model/products_model.dart';
import 'package:store/utilites/my_btton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/utilites/productDatabase.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  ProductsDatabase productsDatabase = ProductsDatabase();
  ProductsModel productsModel;
  var pName;
  var pPrice;
  var pCategory;
  var pDesc;
  File _image;
  final picker = ImagePicker();
  String s;

  void getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      s = _image.toString();
    });
  }

  void insertProduct() async {
    var s = await productsDatabase.insertProduct(productsModel);
    print(s);

    var g = await productsDatabase.getAllProducts();
    print(g);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Products(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    productsModel = ProductsModel(
      name: pName,
      category: pCategory,
      desc: pDesc,
      image: s,
      price: pPrice,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
        ),
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
              onPressed: insertProduct,
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
