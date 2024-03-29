class Approvisionement{
  String? prodId;
  final String dateAchat;
  final String nom;
  final double prixAchat; //payé ou non payé
  final double qty;
  final DateTime dateExp;
  final String typePaiement; //payé ou non payé
  final String fournisseur;

  Approvisionement({required this.nom, required this.dateAchat, required this.prixAchat, required this.qty, required this.dateExp, required this.typePaiement, required this.fournisseur});

  Map<String, dynamic> toApprovisionement() => {
    'name':nom,
    'dateAchat':dateAchat,
    'prixAchat':prixAchat,
    'qty': qty,
    'typePaiement':typePaiement,
    'fournisseur': fournisseur,
    'dateExp':dateExp,
  };
}