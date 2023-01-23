import 'package:flutter/material.dart';

Widget dashUserTile({String text = '', routing}) {
  return GestureDetector(
    onTap: routing,
    child: Container(
      padding: EdgeInsets.all(10),
      width: 180,
      height: 155,
      child: Card(
        child: Column(
          children: [
            Container(
              height: 100,
              //width: 50,
              child: Image(
                image: AssetImage('images/medoc.png'),
              ),
            ),
            Container(height:20,child: Center(child: Text(text))),
          ],
        ),
      ),
    ),
  );
}
