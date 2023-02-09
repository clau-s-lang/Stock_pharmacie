class Stock{
  final String prodId;
  final String qty;

  Stock(this.prodId,this.qty,);

  Map<String, dynamic> toStock() => {
    'qty': qty,
  };
}