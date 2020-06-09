import 'package:flutter/material.dart';
import 'package:store/mershant_screens/add_products.dart';
import 'package:store/model/address_model.dart';
import 'package:store/utilites/address_db.dart';
import 'package:store/utilites/button.dart';

import 'confirm_page.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  String name;
  String address;
  String phone;
  String city;

  AddressModel addressModel ;
AddressDatabase addressDatabase = AddressDatabase();

  void insertAddress() async {
    var s = await addressDatabase.insertAddress(addressModel);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPage(),
        ));
  }
  
  @override
  Widget build(BuildContext context) {
    addressModel = AddressModel(
      name: name,
      address: address,
      city: city,
      phone: phone
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Add Address'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            NewTextField(
              onChanged: (value) => name = value,
              hintText: 'Name',
            ),
            NewTextField(
              onChanged: (value) => address = value,
              hintText: 'Address Lane',
            ),
            NewTextField(
              onChanged: (value) => city = value,
              hintText: 'City',
            ),
            SizedBox(
              height: 8,
            ),
            NewTextField(
              onChanged: (value) => phone = value,
              hintText: 'Phone Number',
            ),
            SizedBox(
              height: 16,
            ),
            MyButton(
              text: 'Add Address',
              onPressed:insertAddress,
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
