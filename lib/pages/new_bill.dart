import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zapbill/models/item_list_model.dart';
import 'package:zapbill/models/item_model.dart';
import 'package:zapbill/services/navigation_service.dart';
import 'package:zapbill/util/device_size.dart';
import 'package:zapbill/widgets/add_item_bottom.dart';
import 'package:zapbill/widgets/custom_text_input.dart';
import 'package:zapbill/widgets/item_view_card.dart';
import 'package:zapbill/widgets/rounded_button.dart';

class NewBill extends StatefulWidget {
  const NewBill({super.key});

  @override
  State<NewBill> createState() => _NewBillState();
}

class _NewBillState extends State<NewBill> {
  final ItemListModel _itemsList =
      GetIt.instance.registerSingleton<ItemListModel>(ItemListModel());
  late List<ItemModel> _items;
  late DeviceSize _deviceSize;
  late NavigationService _navigation;

  @override
  void initState() {
    super.initState();
    _navigation = GetIt.instance.get<NavigationService>();
    _items = _itemsList.itemList;
  }

  @override
  Widget build(BuildContext context) {
    _deviceSize = DeviceSize(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: _deviceSize.deviceHeight * 0.02,
            horizontal: _deviceSize.deviceWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customerDetails(),
            _sendInvoice(),
            _totalContainer(),
            _itemContainer(),
            _addItemBtn(),
          ],
        ),
      ),
    );
  }

  // Customer details Container
  Widget _customerDetails() {
    return SizedBox(
      height: _deviceSize.deviceHeight * 0.20,
      width: _deviceSize.deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomeSizedTextInput(
              width: _deviceSize.deviceWidth,
              height: _deviceSize.deviceHeight * 0.05,
              hintText: "Customer name",
              regEx: "",
              obscureText: false,
              onSaved: (value) {}),
          CustomeSizedTextInput(
              width: _deviceSize.deviceWidth,
              height: _deviceSize.deviceHeight * 0.05,
              hintText: "Customer name",
              regEx: "",
              obscureText: false,
              onSaved: (value) {}),
          CustomeSizedTextInput(
              width: _deviceSize.deviceWidth,
              height: _deviceSize.deviceHeight * 0.05,
              hintText: "Customer name",
              regEx: "",
              obscureText: false,
              onSaved: (value) {}),
        ],
      ),
    );
  }

  // Send invoice Button
  Widget _sendInvoice() {
    return RoundedButton(
      _deviceSize.deviceHeight * 0.05,
      _deviceSize.deviceWidth,
      "Send Invoice",
      () {
        _navigation.navigationToRoute("/invoiceconform");
      },
      fontSize: 18,
    );
  }

  // total Conatainer
  Widget _totalContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Total Amount :",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          _itemsList.sumTotal().toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  // item container
  Widget _itemContainer() {
    return Container(
      height: _deviceSize.deviceHeight * 0.45,
      width: _deviceSize.deviceWidth,
      padding: EdgeInsets.symmetric(
          vertical: _deviceSize.deviceHeight * 0.01,
          horizontal: _deviceSize.deviceWidth * 0.02),
      decoration: BoxDecoration(
        color: Color.fromRGBO(227, 240, 175, 1.0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: _itemListContainer(),
    );
  }
  // Add item button

  Widget _addItemBtn() {
    return RoundedButton(
        _deviceSize.deviceHeight * 0.07, _deviceSize.deviceWidth, "Add Item",
        () {
      _displayBottomSheet();
    });
  }

  Widget _itemListContainer() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return ItemViewCard(item: _items[index]);
      },
    );
  }

  _displayBottomSheet() {
    return AddItemBottom(
            onClick: () {
              setState(() {});
            },
            context: context)
        .displayBottomSheet();
  }
}
