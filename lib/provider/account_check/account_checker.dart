import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/screens/screens.dart';

import '../provider/apiProvider.dart';

class AccountChecker extends StatefulWidget {
  const AccountChecker({Key? key}) : super(key: key);

  @override
  State<AccountChecker> createState() => _AccountCheckerState();
}

class _AccountCheckerState extends State<AccountChecker> {
  //late User _user;
  FirebaseAuth auth  = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //_user = FirebaseAuth.instance.currentUser!;

    return FutureBuilder<DocumentSnapshot>(
        future:
        FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                child: Text('Pas de données'),
              ),
            );
          }
          if (snapshot.hasError) {
            return Material(
              child: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }
          DocumentSnapshot data = snapshot.data!;
          if (data['role'] == 'Gallia') {
            return DashboardUser();
          } else if (data['role'] == 'UniCongo') {
            return DashboardUser();
          } else {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 250),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Vous n\'etes pas autorisé à utiliser cette application'),
                      ElevatedButton(
                        onPressed: () {
                          final provider = Provider.of<ProviderApi>(context, listen: false);
                          provider.logOut();
                        },
                        child: Text('Deconnexion'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
