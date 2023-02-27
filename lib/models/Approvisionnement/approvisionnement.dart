class Approvisionement{
  String? prodId;
  final String dateAchat;
  final String prixAchat; //payé ou non payé
  final String qty;
  final String dateExp;
  final String typePaiement; //payé ou non payé
  final String fournisseur;

  Approvisionement({required this.dateAchat, required this.prixAchat, required this.qty, required this.dateExp, required this.typePaiement, required this.fournisseur});

  Map<String, dynamic> toApprovisionement() => {
    'dateAchat':dateAchat,
    'prixAchat':prixAchat,
    'qty': qty,
    'typePaiement':typePaiement,
    'fournisseur': fournisseur,
    'dateExp':dateExp,
  };
}