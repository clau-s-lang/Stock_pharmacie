import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/widgets.dart';

Widget dashlistproducts(
    {String? designation,
    String? mg,
    String? description,
    String? prix,
    String? nombre,
    routing}) {
  return Container(
    padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
    height: 120,
    child: Card(
      child: Row(
        children: [
          Image_produit(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$designation',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text('$mg'+ ' ' +'g'),
                SizedBox(height: 5,),
                Text('$description'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(children: [
              Text('$prix' + ' '+'\$', style: TextStyle(fontSize: 15),),
              SizedBox(height: 12,),
              Text('$nombre', style: TextStyle(fontSize: 13),),
              Text('Disponibles', style: TextStyle(fontWeight: FontWeight.bold),),
            ],),
          ),
        ],
      ),
    ),
  );
}


