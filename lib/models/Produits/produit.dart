class Product{
  String? prodId;
  final name;
  final String category;
  final String qty;
  final String dateExp;
  final String formePharm;
  final String prix;

  Product({required this.name, required this.category, required this.qty, required this.dateExp, required this.formePharm, required this.prix});

  Map<String, dynamic> toProduct() => {
    'name':name,
    'categorie':category,
    'qty': qty,
    'date d\'expiration' : dateExp,
    'formePharm':formePharm,
    'price' : prix,
    'prodId': prodId,
  };
}