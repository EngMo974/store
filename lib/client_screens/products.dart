import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:store/client_screens/product_details.dart';
import 'package:store/model/products_model.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: StreamBuilder<QuerySnapshot>(
          stream: loadProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductsModel> products = [];
              for (var doc in snapshot.data.documents) {
                var data = doc.data;
                products.add(
                  ProductsModel(
                      name: data['name'],
                      price: data['price'],
                      category: data['category'],
                      description: data['description'],
                      imgUrl: data['image']),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Expanded(
                      child: Text(
                        'Categories',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) => Container(
                        padding: EdgeInsets.all(8),
                        width: 200,
                        height: 120,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {

                            });
                          },
                          child: Card(
                            child: Center(
                              child: Text(
                                products[index].category,
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, bottom: 4, top: 16),
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Expanded(
                      child: Text(
                        'Featured',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .8,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productsModel: products[index],
                              ),
                            )),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(products[index].imgUrl),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Opacity(
                                  opacity: .6,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            products[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('\$ ${products[index].price}')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: products.length,
                    ),
                  ),
                ],
              );
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection('products').snapshots();
  }
}
