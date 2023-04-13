class Vente{
  String? prodId;
  final String dateVente;
  final double qty;
  final double prixVente;
  final String uniteMesure;

  Vente({required this.dateVente, required this.uniteMesure, required this.qty,required this.prixVente});

  Map<String, dynamic> toVente() => {
    'uniteMesure':uniteMesure,
    'dateVente':dateVente,
    'qty': qty,
    'prixVente':prixVente,
  };
}