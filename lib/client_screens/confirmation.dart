import 'package:flutter/material.dart';
import 'package:store/model/address_model.dart';
import 'package:store/utilites/addressDatabase.dart';
import 'package:store/utilites/my_btton.dart';


import 'add_address.dart';
import 'my_order.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  Future<List<AddressModel>> getData() async {
    var s = await AddressDatabase.db.getAllAddress();

    return s;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddress(),));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Confirmation'),
        ),
        body: FutureBuilder<List<AddressModel>>(
          future: getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AddressModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    AddressModel item = snapshot.data[index];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MyButton(
                              text: 'Add Address',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddAddress(),
                                    ));
                              },
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            MyButton(
                              text: 'Confirm',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyOrder(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        )
                      ],
                    );
                  });
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
