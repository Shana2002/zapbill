import 'package:flutter/material.dart';
import 'package:zapbill/util/device_size.dart';
import 'package:zapbill/widgets/custom_text_input.dart';
import 'package:zapbill/widgets/rounded_button.dart';

class NewBill extends StatefulWidget {
  const NewBill({super.key});

  @override
  State<NewBill> createState() => _NewBillState();
}

class _NewBillState extends State<NewBill> {
  late DeviceSize _deviceSize;
  @override
  Widget build(BuildContext context) {
    _deviceSize = DeviceSize(context: context);
    return Scaffold(
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
    return Container(
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
      () {},
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
          "1650",
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
      color: Colors.red,
    );
  }
  // Add item button

  Widget _addItemBtn() {
    return RoundedButton(_deviceSize.deviceHeight * 0.07,
        _deviceSize.deviceWidth, "Add Item", () {});
  }
}
