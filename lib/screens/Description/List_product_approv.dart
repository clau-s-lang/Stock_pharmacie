import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/Tiles/tile_liste_product.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class ListDeProduitsAppov extends StatefulWidget {
  const ListDeProduitsAppov({Key? key}) : super(key: key);

  @override
  State<ListDeProduitsAppov> createState() => _ListDeProduitsAppovState();
}

class _ListDeProduitsAppovState extends State<ListDeProduitsAppov> {
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
                            builder: (context) => ApprovisionementPage(
                              productId: produit['prodId'],
                              nom: produit['name'],
                              quantity: produit['qty'],
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProducts()));
        },
        icon: Icon(Icons.add),
        label: Text('Ajouter un produit'),
        backgroundColor: Color(0xFF0C8E36),
      ),
    );
  }
}


