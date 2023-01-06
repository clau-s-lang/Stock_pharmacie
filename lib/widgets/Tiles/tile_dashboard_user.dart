import 'package:flutter/material.dart';

Widget dashUserTile({String text = '', routing}) {
  return Container(
    padding: EdgeInsets.all(10),
    width: 180,
    height: 155,
    child: Card(
      child: ListTile(
        title: Container(
          height: 100,
          //width: 50,
          child: Image(
            image: AssetImage('images/medoc.png'),
          ),
        ),
        subtitle: Container(height:20,child: Center(child: Text(text))),
      ),
    ),
  );
}
