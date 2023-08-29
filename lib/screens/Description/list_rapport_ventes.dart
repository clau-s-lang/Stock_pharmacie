import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class ListRapportVente extends StatefulWidget {
  const ListRapportVente({Key? key}) : super(key: key);

  @override
  State<ListRapportVente> createState() => _ListRapportVenteState();
}

class _ListRapportVenteState extends State<ListRapportVente> {
  @override
  Widget build(BuildContext context) {
    //User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Pony')
            .doc('Gallia')
            .collection('Ventes')
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
                child: Text('Aucun vente existant'),
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot vente = snapshot.data!.docs[index];
                String formattedDate =
                DateFormat('dd MMMM yyyy').format(vente['dateVente'].toDate()).toString();
                return GestureDetector(
                  onTap: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApprovisionementPage(
                              productId: vente['prodId'],
                            )));*/
                  },
                  child: dashlistproductsSold(
                    designation: vente['designation'],
                    nombre: "${vente['qty']}",
                    mg: formattedDate,
                    prix: "${vente['prixVente']}",
                  ),
                );
              });
        },
      ),
    );
  }
}


