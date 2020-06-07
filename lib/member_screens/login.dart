import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/client_screens/products.dart';
import 'package:store/member_screens/sign_up.dart';
import 'package:store/mershant_screens/first_page.dart';
import 'package:store/utilites/button.dart';
import 'package:store/model/users.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var name;

  var email;

  var password;

  var type;

  final _firestore = Firestore.instance;
  final FirebaseAuth _aut = FirebaseAuth.instance;

  Future<void> login() async {
    var res = await getDataStream(email);
    FirebaseUser user = (await _aut.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    if (res == 'Client') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Products(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ControlPanel(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 32),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 64),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                onChanged: (value) => email = value,
                cursorRadius: Radius.circular(3),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => password = value,
                obscureText: true,
                cursorRadius: Radius.circular(3),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            MyButton(
              text: "Login",
              onPressed: () async {
                await login();
              },
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Dont't have an account ?"),
                FlatButton(
                  child: Text("Sign Up"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future getDataStream(String email) async {
    await for (var data in _firestore.collection('users').snapshots()) {
      for (var user in data.documents) {
        User(
          type: user['type'],
          email: user["email"],
        );
        if (email == user['email']) {
          return user['type'];
        } else
          print('');
      }
      ;
    }
  }
}
