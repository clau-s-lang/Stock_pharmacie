import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/Tiles/tile_liste_product.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class ListDeProduits extends StatefulWidget {
  const ListDeProduits({Key? key}) : super(key: key);

  @override
  State<ListDeProduits> createState() => _ListDeProduitsState();
}

class _ListDeProduitsState extends State<ListDeProduits> {
  @override
  Widget build(BuildContext context) {
    //User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des produits'),
        backgroundColor: Color(0xFF0C8E36),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearch());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Pony')
            .doc('Gallia')
            .collection('Produits')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Material(
              child: Center(
                child: Text('Veuillez vous connecter à internet'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Material(
              child: Center(
                child: Text('Aucun produit existant'),
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot produit = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Save_sales(
                              name: produit['name'],
                              productId: produit['prodId'],
                              quantite: double.parse(produit['qty'].toString()),
                              prixComp: double.parse(produit['priceComp'].toString()),
                              prixBoite: double.parse(produit['priceBoite'].toString()),
                              prixPlaq: double.parse(produit['pricePlaquette'].toString()),
                              prixFlac: double.parse(produit['priceFlacon'].toString()),
                            )));
                  },
                  child: dashListProduct(
                    designation: produit['name'],
                    nombre: "${produit['qty']}",
                    dateExp: produit['date d\'expiration'],
                    priceBoite: "${produit['priceBoite']}",
                    alertColor: DateTime.now().difference(produit['date d\'expiration'].toDate()).inDays <= 90 ? Colors.red : Colors.black,

                  ),
                );
              });
        },
      ),
    );
  }
}


