import 'package:flutter/material.dart';
import 'package:store/client_screens/products.dart';
import 'package:store/utilites/button.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Order'),
        ),
        body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return (index == 5)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      text: 'Order Again',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Products(),
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
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTFVrrSLddxRJ8K_jKHqqBNPSYv8OZKdRnv2MdUUqkSkyRlRypP&usqp=CAU'),
                            width: 108,
                            height: 108,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Man T-Shirt',
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'Lotto.LTD',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  Text(
                                    '\$34.00',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
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
