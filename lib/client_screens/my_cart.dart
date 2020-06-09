import 'package:flutter/material.dart';
import 'package:store/client_screens/confirmation.dart';
import 'package:store/model/products_model.dart';
import 'package:store/utilites/my_btton.dart';
import 'package:store/utilites/productDatabase.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<List<ProductsModel>> getData() async {
    var s = await ProductsDatabase.db.getAllProducts();
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return (index == 1)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      text: 'Continue',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmPage(),
                          )),
                    ),
                  )
                : Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 108,
                            height: 108,
                          ),
                          Expanded(
                            child: FutureBuilder<List<ProductsModel>>(
                              future: getData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<ProductsModel>> snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        ProductsModel item =
                                            snapshot.data[index];
                                        return Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  item.name,
                                                  maxLines: 2,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                Text(
                                                  item.category,
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                                Text(
                                                  item.price,
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ],
                                            ));
                                      });
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
