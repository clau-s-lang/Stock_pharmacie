class Vente{
  String? prodId;
  final String dateVente;
  final String status; //payé ou non payé
  final String qty;
  final String client;
  final String formePharma;

  Vente({required this.dateVente, required this.status, required this.qty, required this.client, required this.formePharma});

  Map<String, dynamic> toVente() => {
    'status':status,
    'dateVente':dateVente,
    'qty': qty,
    'client':client,
    'formePharma': formePharma,
  };
}