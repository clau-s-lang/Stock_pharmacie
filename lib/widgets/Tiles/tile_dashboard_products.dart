import 'package:flutter/material.dart';


Widget dashProductTile({String text = '', routing}) {
  return Container(
    padding: EdgeInsets.all(10),
    width: 180,
    height: 80,
    child: Card(
      child:  Container(
          height: 20,
          //width: 50,
            child: Center(child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),))
        ),
    ),
  );
}
