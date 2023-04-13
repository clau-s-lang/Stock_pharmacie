import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/Tiles/tile_liste_product.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class ListRapportAppro extends StatefulWidget {
  const ListRapportAppro({Key? key}) : super(key: key);

  @override
  State<ListRapportAppro> createState() => _ListRapportApproState();
}

class _ListRapportApproState extends State<ListRapportAppro> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Pony')
            .doc('Gallia')
            .collection('Approvisionnement')
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
                child: Text('Aucun approv existant'),
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot approv = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApprovisionementPage(
                              productId: approv['prodId'],
                            )));*/
                  },
                  child: dashlistproducts(
                    designation: approv['name'],
                    nombre: approv['qty'],
                    mg: approv['date d\'expiration'],
                    prix: approv['price'],
                  ),
                );
              });
        },
      ),
    );
  }
}


