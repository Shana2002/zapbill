import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zapbill/models/item_list_model.dart';
import 'package:zapbill/models/item_model.dart';
import 'package:zapbill/util/device_size.dart';
import 'package:zapbill/widgets/custom_text_input.dart';
import 'package:zapbill/widgets/rounded_button.dart';

class AddItemBottom {
  final Function onClick;
  final BuildContext context;
  late DeviceSize _deviceSize;
  final ItemListModel _itemList = GetIt.instance.get<ItemListModel>();
  AddItemBottom({required this.onClick, required this.context});

  displayBottomSheet() {
    _deviceSize = DeviceSize(context: context);
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true, // Ensures the bottom sheet can resize
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: _deviceSize.deviceHeight * 0.02,
                horizontal: _deviceSize.deviceWidth * 0.05),
            height: _deviceSize.deviceHeight * 0.4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextInput(
                    onSaved: (value) {},
                    obscureText: false,
                    hintText: "Product name",
                    regEx: "",
                  ),
                  SizedBox(height: 10),
                  CustomTextInput(
                    onSaved: (value) {},
                    obscureText: false,
                    hintText: "Product price",
                    regEx: "",
                  ),
                  SizedBox(height: 10),
                  CustomTextInput(
                    onSaved: (value) {},
                    obscureText: false,
                    hintText: "Product quantity",
                    regEx: "",
                  ),
                  SizedBox(height: 20),
                  RoundedButton(_deviceSize.deviceHeight * 0.07,
                      _deviceSize.deviceWidth, "Add to bill", () {
                    // ItemModel newItem = ItemModel(
                    //     productName: "productName", qty: 2, price: 1200);
                    // _itemList.addItem(newItem);
                    onClick();
                    Navigator.pop(context);
                  })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
