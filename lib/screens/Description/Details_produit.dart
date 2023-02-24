import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DescriptionProduit extends StatefulWidget {
  final String idProd;
  final String nom;
  final String dateExp;
  final String Prix;
  final String Nombre;

  DescriptionProduit(
      {Key? key,
      required this.idProd,
      required this.dateExp,
      required this.nom,
      required this.Nombre,
      required this.Prix})
      : super(key: key);

  @override
  State<DescriptionProduit> createState() => _DescriptionProduitState();
}

class _DescriptionProduitState extends State<DescriptionProduit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description du produit'),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Pony')
              .doc('Gallia')
              .collection('Produits')
              .doc(widget.idProd)
              .snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                            'Voici la description du produit ' + widget.nom + '.',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nom du produuit'),
                              SizedBox(height: 5),
                              Text(widget.nom, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
