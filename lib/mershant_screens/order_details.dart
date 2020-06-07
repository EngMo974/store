import 'package:flutter/material.dart';
import 'package:store/utilites/button.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 16, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Client Name',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Ahmed Shamala',
                    style: TextStyle(color: Colors.black),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Divider(
                      height: 2,
                      color: Colors.black38,
                    ),
                  ),
                  Text(
                    'Address Lane',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Gaza',
                    style: TextStyle(color: Colors.black),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Divider(
                      height: 2,
                      color: Colors.black38,
                    ),
                  ),
                  Text(
                    'Product List',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'T-Shirt',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Glasses',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: MyButton(
                  text: 'Accept',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
