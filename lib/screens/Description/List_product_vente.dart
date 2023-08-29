import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/Tiles/tile_liste_product.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class ListDeProduitsVente extends StatefulWidget {
  const ListDeProduitsVente({Key? key}) : super(key: key);

  @override
  State<ListDeProduitsVente> createState() => _ListDeProduitsVenteState();
}

class _ListDeProduitsVenteState extends State<ListDeProduitsVente> {
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
                String formattedDate =
                DateFormat('dd-MM-yyyy').format(produit['date d\'expiration'].toDate()).toString();
                return GestureDetector(
                  onTap: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Save_sales(
                                  productId: produit['prodId'],
                              name: produit['name'],
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
                    dateExp: formattedDate,
                    prix: "${produit['price']}",
                    alertColor: produit['date d\'expiration'].toDate().difference(DateTime.now()).inDays <= 90 ? Colors.red : Colors.black,

                  ),
                );
              });
        },
      ),
    );
  }
}

class MySearch extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: Icon(Icons.arrow_back),
      );
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear),
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(query),
      ); //a refaire

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Pony')
          .doc('Gallia')
          .collection('Produits')
          .snapshots(),
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot prodSearch = snapshot.data!.docs[index];
              return ListTile(
                title: prodSearch['name'],
                onTap: () {
                  query = prodSearch['name'];
                },
              );
            });
      },
    );
  }
}
