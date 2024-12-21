import 'package:flutter/material.dart';
import 'package:zapbill/models/item_model.dart';

class ItemViewCard extends StatelessWidget {
  final ItemModel item;
  const ItemViewCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(93, 185, 150, 1.0),
        borderRadius: BorderRadius.circular(14),
      ),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        title: Text(
          item.productName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Price : ${item.price}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "Qty : ${item.qty}",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
