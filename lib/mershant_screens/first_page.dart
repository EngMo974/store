import 'package:flutter/material.dart';
import 'package:store/mershant_screens/add_products.dart';
import 'package:store/mershant_screens/orders.dart';
import 'package:store/utilites/button.dart';

class ControlPanel extends StatefulWidget {
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyButton(
              text: 'New Product',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProducts(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            MyButton(
              text: 'Orders',
              onPressed:  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Orders(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
