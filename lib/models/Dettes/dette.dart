class Dette{
  final String prodId;
  final String dateDette;
  final String type; //achat ou vente
  final String qty;
  final String client;
  final String fournisseur;

  Dette(this.prodId, this.dateDette, this.type, this.qty, this.client, this.fournisseur);

  Map<String, dynamic> toDette() => {
    'type':type,
    'dateDette':dateDette,
    'qty': qty,
    'client':client,
    'fournisseur':fournisseur,
  };
}