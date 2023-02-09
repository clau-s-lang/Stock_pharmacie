class Approvisionement{
  String? prodId;
  final String dateAchat;
  final String status; //payé ou non payé
  final String qty;

  Approvisionement({required this.dateAchat, required this.status, required this.qty});

  Map<String, dynamic> toApprovisionement() => {
    'dateAchat':dateAchat,
    'status':status,
    'qty': qty,
  };
}