import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/client_screens/confirm_page.dart';
import 'package:store/mershant_screens/add_products.dart';
import 'package:store/model/address_model.dart';
import 'package:store/utilites/button.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  var name;
  var address;
  var city;
  var postalCode;
  var phoneNumber;

  AddressModel addressModel ;
  Future<void> add() async {
    Firestore.instance.collection('addresses').document().setData({
      'name': name,
      'address': address,
      'city': city,
      'postalCode': postalCode,
      'phoneNumber': phoneNumber,
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPage(addressModel: addressModel,),
        ));
  }

  @override
  Widget build(BuildContext context) {
    addressModel = AddressModel(
      postalCode: postalCode,
      phoneNumber: phoneNumber,
      name: name,
      address: address,
      city: city
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
            NewTextField(
              onChanged: (value) => postalCode = value,
              hintText: 'Postal Code',
            ),
            SizedBox(
              height: 8,
            ),
            NewTextField(
              onChanged: (value) => phoneNumber = value,
              hintText: 'Phone Number',
            ),
            SizedBox(
              height: 16,
            ),
            MyButton(
              text: 'Add Address',
              onPressed: add,
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
