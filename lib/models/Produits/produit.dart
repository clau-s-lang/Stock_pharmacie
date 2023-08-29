class Product {
  String? prodId;
  final name;
  final String uniteMesure;
  final String categorie;
  final double qty;
  final DateTime dateExp;
  final String formePharm;
  final double prixBoite;
  final double prixComp;
  final double prixFlac;
  final double prixPlaq;

  Product(
      {required this.uniteMesure,
      required this.name,
      required this.categorie,
      required this.qty,
      required this.dateExp,
      required this.formePharm,
      required this.prixBoite,
      required this.prixComp,
      required this.prixFlac,
      required this.prixPlaq});

  Map<String, dynamic> toProduct() => {
        'name': name,
        'categorie': categorie,
        'qty': qty,
        'date d\'expiration': dateExp,
        'formePharm': formePharm,
        'priceBoite': prixBoite,
        'priceComp': prixComp,
        'pricePlaquette': prixPlaq,
        'priceFlacon': prixFlac,
        'prodId': prodId,
        'uniteMesure': uniteMesure,
      };
}
