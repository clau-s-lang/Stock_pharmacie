import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_pharma/models/models.dart';

import '../../database/db.dart';

class ProviderApi extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future logOut() async {
    await auth.signOut();
  }

  void signUpWithEmail(
          {required String email,
          required String password,
          required Employee employee}) =>
      FireBaseApi().signUpWithEmail(
          email: email, password: password, employee: employee);

  void signInWithEmail({
    required String email,
    required String password,
  }) =>
      FireBaseApi().signInWithEmail(email: email, password: password);

  void addProd({required Product prod}) => FireBaseApi().addProduit(prod: prod);

  void addVente({required Vente vente}) => FireBaseApi().addVente(vente: vente);

  void approv({required Approvisionement appro}) => FireBaseApi().approv(appro: appro);
}
