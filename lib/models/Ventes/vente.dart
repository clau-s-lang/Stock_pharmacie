import 'package:cloud_firestore/cloud_firestore.dart';

class Vente{
  String? prodId;
  final String name;
  final double qty;
  final double prixVente;
  final String uniteMesure;

  Vente({required this.name, required this.uniteMesure, required this.qty,required this.prixVente});

  Map<String, dynamic> toVente() => {
    'designation':  name,
    'uniteMesure':uniteMesure,
    'dateVente': Timestamp.now(),
    'qty': qty,
    'prixVente':prixVente,
  };
}