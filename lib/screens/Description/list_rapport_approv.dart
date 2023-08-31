import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    //User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Pony')
            .doc('Gallia')
            .collection('Approvisionement')
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
                String formattedDate =
                DateFormat('dd-MM-yyyy').format(approv['dateExp'].toDate()).toString();
                return dashListProduct(
                    designation: approv['name'],
                    nombre:  "${approv['qty']}",
                    dateExp: formattedDate,
                  priceBoite: "${approv['priceBoite']}",
                  alertColor: Colors.black,
                );
              });
        },
      ),
    );
  }
}


