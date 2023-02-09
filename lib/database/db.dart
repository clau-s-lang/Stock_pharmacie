import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stock_pharma/models/models.dart';

class FireBaseApi extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signUpWithEmail({required String email,
    required String password,
    required Employee employee}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      print(user?.uid);
      toFirestore(userCredential.user, employee);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Le mot de passe fourni est faible.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'Il existe déjà une compte avec ce mail.',
          toastLength: Toast.LENGTH_LONG,
        );
      } else if (e.code == 'too-many-requests') {
        Fluttertoast.showToast(
            msg:
            'Nous avons bloqué toutes les requetes en provenance de votre appareil suite à une activté inhabituelle ');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future toFirestore (User? user, Employee employee) async {
    try {
      // UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      //   email: employee.email,
      //   password: employee.password,
      // );
     // employee.UserId = user!.uid;
      await _firestore
          .collection('Pony').doc('Gallia').collection('Employees')
          .doc(auth.currentUser!.uid)
          .set(employee.toEmployee());
      await _firestore
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .set(employee.toUser());
    } catch (e) {
      print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ${e.toString()}');
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future signInWithEmail(
      {required String email, required String password, context}) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'Email ou mot de passe incorrect.',
            backgroundColor: Colors.redAccent);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Email ou mot de passe incorrect.');
      } else if (e.code == 'too-many-requests') {
        Fluttertoast.showToast(
            msg:
            'Nous avons bloqué toutes les requetes en provenance de votre appareil suite à une activté inhabituelle');
      }
    }
  }

  Future addProduit({required Product prod}) async {
    try {
      final docIdP = FirebaseFirestore.instance.collection('Pony').doc('Gallia').collection('Produits').doc();
      String docId = docIdP.id;
      prod.prodId = docId;
      await FirebaseFirestore.instance.collection('Pony').doc('Gallia').collection('Produits').doc(docId).set(
        prod.toProduct(),
      );
    } catch (e) {
      print(e);
    }
  }

  Future addVente({required Vente vente}) async {
    try {
      final docIdV = FirebaseFirestore.instance.collection('Pony').doc('Gallia').collection('Ventes').doc();
      String docId = docIdV.id;
      vente.prodId = docId;
      await FirebaseFirestore.instance.collection('Pony').doc('Gallia').collection('Ventes').doc(docId).set(
        vente.toVente(),
      );
    } catch (e) {
      print(e);
    }
  }

  Future approv({required Approvisionement appro}) async {
    try {
      final docIdVAp = FirebaseFirestore.instance.collection('Pony').doc('Gallia').collection('Approvisionement').doc();
      String docId = docIdVAp.id;
      appro.prodId = docId;
      await FirebaseFirestore.instance.collection('Pony').doc('Gallia').collection('Approvisionement').doc(docId).set(
        appro.toApprovisionement(),
      );
    } catch (e) {
      print(e);
    }
  }
}
