import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/Tiles/tile_liste_product.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class ListRapportStock extends StatefulWidget {
  const ListRapportStock({Key? key}) : super(key: key);

  @override
  State<ListRapportStock> createState() => _ListRapportStockState();
}

class _ListRapportStockState extends State<ListRapportStock> {
  @override
  Widget build(BuildContext context) {
    //User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
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
                String formattedDate =
                DateFormat('dd-MM-yyyy').format(produit['date d\'expiration'].toDate()).toString();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionProduit(
                              idProd: produit['prodId'],
                              dateExp: produit['date d\'expiration'],
                              nom: produit['name'],
                              Nombre: double.parse(produit['qty'].toString()),
                              Prix: double.parse(produit['price'].toString()),
                              uniteMesure: produit['uniteMesure'],
                              category: produit['categorie'],
                              formePharm: produit['formePharm'],
                            )));
                  },
                  child: dashListProduct(
                    designation: produit['name'],
                    nombre: "${produit['qty']}",
                    dateExp: formattedDate,
                    priceBoite: "${produit['priceBoite']}",
                    alertColor: produit['date d\'expiration'].toDate().difference(DateTime.now()).inDays <= 90 ? Colors.red : Colors.black,

                  ),
                );
              });
        },
      ),

    );
  }
}
