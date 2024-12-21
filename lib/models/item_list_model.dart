import 'package:zapbill/models/item_model.dart';

class ItemListModel {
  List<ItemModel> itemList = [
    ItemModel(productName: "productName", qty: 1, price: 1200),
    ItemModel(productName: "productName2", qty: 5, price: 1500),
  ];

  void addItem(ItemModel _item) {
    itemList.add(_item);
  }

  void removeItem(int _index) {
    itemList.removeAt(_index);
  }

  void updateItem(int _index, ItemModel _item) {
    if (_index >= 0 && _index < itemList.length) {
      itemList[_index] = _item;
    }
  }

  double sumTotal() {
    double _total = 0;
    for (var element in itemList) {
      _total = _total + (element.price * element.qty);
    }
    return _total;
  }
}
