import 'package:flutter/material.dart';
import 'package:store/client_screens/cart.dart';
import 'package:store/client_screens/confirm_page.dart';
import 'package:store/model/products_model.dart';
import 'package:store/utilites/button.dart';
import 'package:store/utilites/products_db.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future<List<ProductsModel>> getData() async {
    var s = await ProductsDatabase.db.getAllProducts();
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://static.cdn.printful.com/static/v766/images/landing/make-shirt/make-your-own-shirt-mobile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Expanded(
                          child: Text(
                            item.name,
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Expanded(
                          child: Text(
                           item.price,
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
                            item.desc,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24, left: 8, right: 8),
                        child: Expanded(
                          child: MyButton(
                            text: 'Buy Now',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConfirmPage(),
                                ),
                              );
                            },
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
      ),
    );
  }
}
