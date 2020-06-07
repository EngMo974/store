import 'package:flutter/material.dart';
import 'package:store/client_screens/cart.dart';
import 'package:store/utilites/button.dart';

class ProductDetails extends StatefulWidget {
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
        body: Column(
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
                  'Young Model',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Expanded(
                child: Text(
                  '\$34.00',
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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac ultricies augue. Ut sit amet dolor purus. Quisque vel magna id tortor luctus vulputate commodo sit amet felis. Nulla malesuada enim non urna finibus volutpat.',
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
                        builder: (context) => Cart(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
