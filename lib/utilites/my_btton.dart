import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  MyButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: RaisedButton(
        color: Colors.transparent,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.redAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: double.infinity, minHeight: 80.0),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
