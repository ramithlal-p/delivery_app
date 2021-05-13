import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;

  const Button({Key key, this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(30.0)),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
    );
  }
}
