import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/model/address_model.dart';

enum SingingCharacter { lafayette, jefferson }

class MyRadio extends StatefulWidget {
  MyRadio({Key key}) : super(key: key);

  @override
  _MyRadioState createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  final _firestore = Firestore.instance;
  SingingCharacter _character = SingingCharacter.lafayette;

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: loadAddress(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AddressModel> address = [];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;
              address.add(
                AddressModel(
                    name: data['name'],
                    city: data['city'],
                    address: data['address'],
                    postalCode: data['postalCode'],
                    phoneNumber: data['phoneNumber']),
              );
            }
            return ListView.builder(
                itemCount: address.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(address[index].address),
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
                });
            ;
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }

  Stream<QuerySnapshot> loadAddress() {
    return _firestore.collection('addresses').snapshots();
  }
}
