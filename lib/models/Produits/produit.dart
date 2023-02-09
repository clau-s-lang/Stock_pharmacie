class Product{
  String? prodId;
  final String name;
  final String category;
  final String qty;

  Product({required this.name, required this.category, required this.qty});

  Map<String, dynamic> toProduct() => {
    'name':name,
    'dette':category,
    'qty': qty,
  };
}