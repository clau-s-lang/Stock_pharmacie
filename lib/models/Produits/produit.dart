class Product{
  String? prodId;
  final name;
  final String uniteMesure;
  final String categorie;
  final double qty;
  final String dateExp;
  final String formePharm;
  final double prix;

  Product({required this.uniteMesure, required this.name, required this.categorie, required this.qty, required this.dateExp, required this.formePharm, required this.prix});

  Map<String, dynamic> toProduct() => {
    'name':name,
    'categorie':categorie,
    'qty': qty,
    'date d\'expiration' : dateExp,
    'formePharm':formePharm,
    'price' : prix,
    'prodId': prodId,
    'uniteMesure':uniteMesure,
  };
}