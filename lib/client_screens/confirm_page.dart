import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/model/address_model.dart';
import 'package:store/utilites/button.dart';
import 'package:store/utilites/radio.dart';

import 'add_address.dart';
import 'my_order.dart';

class ConfirmPage extends StatefulWidget {
  final AddressModel addressModel;

  ConfirmPage({this.addressModel});

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  SingingCharacter _character = SingingCharacter.lafayette;
  List<AddressModel> address = [];

  @override
  void initState() {
    // TODO: implement initState
    _add();
  }

  void _add() {
    address.add(widget.addressModel);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Confirmation'),
        ),
        body: ListView.builder(
          itemCount: address.length+1,
          itemBuilder: (context, index) {
            return (index == address.length ) ? Column(
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
            )
                : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(address[index].address, style: TextStyle(color: Colors.black),),
                    leading: Radio(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  );
                })
                ;
          },
        ),
      ),
    );
  }
}

/*;*/