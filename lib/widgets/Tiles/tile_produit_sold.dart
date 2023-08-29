import 'package:flutter/material.dart';

Widget dashlistproductsSold(
    {String? designation,
      String? mg,
      String? categorie,
      String? prix,
      String? nombre,
    }) {
  return Container(
    padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
    height: 110,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Image_produit(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$designation',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10,),
                Text('Date'+': '+'$mg'+ ' ' ),

                //Text('$categorie'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(children: [
              Text('$prix ' +'Fc', style: const TextStyle(fontSize: 15),),
              const SizedBox(height: 10,),
              Text('$nombre', style: const TextStyle(fontSize: 13),),
              const Text('Vendus', style: TextStyle(fontWeight: FontWeight.bold),),
            ],),
          ),
        ],
      ),
    ),
  );
}


