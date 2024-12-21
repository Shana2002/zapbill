class ItemModel {
  final String productName;
  final int qty;
  final double price;

  ItemModel(
      {required this.productName, required this.qty, required this.price});

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "qty": qty,
      "price": price,
    };
  }
}
