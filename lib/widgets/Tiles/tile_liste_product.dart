import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/widgets.dart';

Widget dashlistproducts(
    {String? designation,
    String? mg,
    String? categorie,
    String? prix,
    String? nombre,
    }) {
  return Container(
    padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
    height: 100,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         // Image_produit(),
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
                SizedBox(height: 10,),
                Text('Date d\'expiration'+': '+'$mg'+ ' ' ),

                //Text('$categorie'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(children: [
              Text('$prix' + ' '+'Fc', style: TextStyle(fontSize: 15),),
              SizedBox(height: 10,),
              Text('$nombre', style: TextStyle(fontSize: 13),),
              Text('Disponibles', style: TextStyle(fontWeight: FontWeight.bold),),
            ],),
          ),
        ],
      ),
    ),
  );
}


