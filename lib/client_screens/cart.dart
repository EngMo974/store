import 'package:flutter/material.dart';

import 'package:store/client_screens/confirm_page.dart';
import 'package:store/model/products_model.dart';
import 'package:store/utilites/button.dart';

class Cart extends StatefulWidget {
  final ProductsModel productsModel;

  Cart({this.productsModel});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int quantity = 1;
  List<ProductsModel> products = [];

  @override
  void initState() {
    addProduct();
  }

  void addProduct() {
    products.add(widget.productsModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length + 1,
        itemBuilder: (context, index) {
          return (index == products.length)
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
                        Expanded(
                          child: SizedBox(
                            child: Image.network(products[index].imgUrl),
                            width: 108,
                            height: 108,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  products[index].name,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  products[index].category,
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Text(
                                  '\$${products[index].price}',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      color: Colors.lightBlue,
                                      onPressed: add,
                                      icon: Icon(Icons.add),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(quantity.toString()),
                                    ),
                                    IconButton(
                                      color: Colors.lightBlue,
                                      onPressed: sub,
                                      icon: (Icon(Icons.minimize)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text('Total Price',  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Text('\$ ${calcPrice().toString()}',  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  void add() {
    setState(() {
      quantity += 1;
    });
  }

  void sub() {
    setState(() {
      quantity -= 1;
      if (quantity == 0) {
        quantity = 1;
      }
    });
  }

  int calcPrice() {
    int s = int.parse(widget.productsModel.price);
    int result = quantity * s;
    return result;
  }
}
