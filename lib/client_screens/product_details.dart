import 'package:flutter/material.dart';

import 'package:store/client_screens/cart.dart';
import 'package:store/model/products_model.dart';
import 'package:store/utilites/button.dart';

class ProductDetails extends StatefulWidget {
  final ProductsModel productsModel;

  ProductDetails({this.productsModel});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.network(
                  widget.productsModel.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Expanded(
                child: Text(
                  widget.productsModel.name,
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Expanded(
                child: Text(
                  '\$${widget.productsModel.price}',
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Expanded(
                child: Text(
                  'Description',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Expanded(
                child: Text(
                  widget.productsModel.description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, left: 8, right: 8),
              child: Expanded(
                child: MyButton(
                  text: 'Buy Now',
                  onPressed: addProduct,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  addProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Cart(
          productsModel: widget.productsModel,
        ),
      ),
    );
  }
}
