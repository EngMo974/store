import 'package:flutter/material.dart';
import 'package:store/client_screens/product_details.dart';
import 'package:store/model/products_model.dart';
import 'package:store/utilites/productDatabase.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Future<List<ProductsModel>> getData() async {
    var s = await ProductsDatabase.db.getAllProducts();
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: FutureBuilder<List<ProductsModel>>(
        future: getData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductsModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                ProductsModel item = snapshot.data[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(item.name),
                                Text(item.category),
                                Text(
                                  item.price,
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(item.desc),
                              ],
                            ),
                            Container(
                              width: 120,
                              height: 50,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(),
                                    ),
                                  );
                                },
                                color: Colors.redAccent[400],
                                child: Text(
                                  'Product Details',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                elevation: 8,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
