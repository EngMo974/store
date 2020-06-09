import 'package:flutter/material.dart';
import 'package:store/client_screens/product_details.dart';
import 'package:store/model/products_model.dart';
import 'package:store/utilites/products_db.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: FutureBuilder<List<ProductsModel>>(
          future: ProductsDatabase.db.getAllProducts(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ProductsModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  ProductsModel item = snapshot.data[index];
                  return Dismissible(
                    child: ListTile(
                      title: Text(item.category),
                    ),
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

/*ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Expanded(
                          child: Text(
                            item.category,
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            padding: EdgeInsets.all(8),
                            width: 200,
                            child: Card(
                              child: Center(
                                  child: Text(
                                item.name,
                                style: TextStyle(fontSize: 22),
                              )),
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
                        child: GridView.count(
                          padding: EdgeInsets.all(8),
                          crossAxisCount: 2,
                          children: List.generate(
                            20,
                            (index) {
                              return Column(
                                children: <Widget>[
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(),
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        item.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(item.price),
                                  Text(item.desc)
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );*/
