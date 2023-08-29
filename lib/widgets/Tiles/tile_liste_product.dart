import 'package:flutter/material.dart';

Widget dashListProduct({
  String? designation,
  String? dateExp,
  DateTime? today,
  String? categorie,
  String? prix,
  String? nombre,
  required Color? alertColor,
}) {


  return Container(
    padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
    height: 110,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image_produit(),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$designation',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Expire le' + ': ' + '$dateExp' + ' ',
                  style: TextStyle(
                    color: alertColor,
                  ),
                ),
                //Text('$categorie'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              children: [
                Text(
                  '$prix' + ' ' + 'Fc',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$nombre',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  'Disponibles',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
