import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/member_screens/login.dart';
import 'package:store/utilites/auth_service.dart';
import 'package:store/utilites/button.dart';
import 'package:store/utilites/drop_down.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<String> items = <String>['Client', 'Mershant'];
  String selectedItem = 'Client';
  var name;

  var email;

  var password;

  var type;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 58),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) => name = value,
                  cursorRadius: Radius.circular(3),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Full Name',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => email = value,
                  cursorRadius: Radius.circular(3),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) => password = value,
                  obscureText: true,
                  cursorRadius: Radius.circular(3),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            DropdownButton<String>(
              value: selectedItem,
              onChanged: (String string) =>
                  setState(() => selectedItem = string),
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((String item) {
                  return Text(item);
                }).toList();
              },
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  child: Text('$item'),
                  value: item,
                );
              }).toList(),
            ),
            SizedBox(
              height: 16,
            ),
            MyButton(
              text: "Sing Up",
              onPressed: () {},
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?"),
                FlatButton(
                  child: Text("Sign in"),
                  onPressed: () {
                    setState(() async {});
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
