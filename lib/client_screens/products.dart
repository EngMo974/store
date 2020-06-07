import 'package:flutter/material.dart';
import 'package:store/client_screens/product_details.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Expanded(
                child: TextField(
                  cursorRadius: Radius.circular(3),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) => Container(
                  padding: EdgeInsets.all(8),
                  width: 200,
                  child: Card(
                    child: Center(
                        child: Text(
                      'Men',
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
                                    builder: (context) => ProductDetails(),
                                  ));
                            },
                            child: Image.network(
                              'https://rukminim1.flixcart.com/image/332/398/ju1jqfk0/t-shirt/u/z/4/l-men-ss19-rgln-hs-white-ylw-blk-strp-maniac-original-imaff9e8dpqzhwgu.jpeg?q=50',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text('\$34.00'),
                        Text('Man T-Shirt')
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
