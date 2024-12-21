import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zapbill/models/item_list_model.dart';
import 'package:zapbill/models/item_model.dart';
import 'package:zapbill/services/navigation_service.dart';
import 'package:zapbill/util/device_size.dart';
import 'package:zapbill/widgets/item_view_card.dart';
import 'package:zapbill/widgets/rounded_button.dart';

class InvoiceConformPage extends StatefulWidget {
  const InvoiceConformPage({super.key});

  @override
  State<InvoiceConformPage> createState() => _InvoiceConformPageState();
}

class _InvoiceConformPageState extends State<InvoiceConformPage> {
  late DeviceSize _deviceSize;
  late NavigationService _navigation;
  final ItemListModel _listItems = GetIt.instance.get<ItemListModel>();
  late List<ItemModel> _items;
  late double _netTotal;
  double _discont = 0;
  double _subTotal = 0;

  @override
  Widget build(BuildContext context) {
    _navigation = GetIt.instance.get<NavigationService>();
    _deviceSize = DeviceSize(context: context);
    _items = _listItems.itemList;
    _netTotal = _listItems.sumTotal();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _navigation.goBack();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      resizeToAvoidBottomInset: false,
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: _deviceSize.deviceHeight * 0.003,
            horizontal: _deviceSize.deviceWidth * 0.05),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _deviceSize.deviceHeight * 0.01,
              ),
              _customerDetails(),
              SizedBox(
                height: _deviceSize.deviceHeight * 0.01,
              ),
              _itemList(),
              SizedBox(
                height: _deviceSize.deviceHeight * 0.01,
              ),
              _priceEditContainer(),
              SizedBox(
                height: _deviceSize.deviceHeight * 0.01,
              ),
              _sendButton(),
              SizedBox(
                height: _deviceSize.deviceHeight * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // customer details menu
  Widget _customerDetails() {
    return Container(
      width: _deviceSize.deviceWidth,
      height: _deviceSize.deviceHeight * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer : Hansaka Ravishan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            "Mobile : +94712875690",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            "Customer : hansakaravi02@gmail.com",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          )
        ],
      ),
    );
  }

  // Item list smaple menu
  Widget _itemList() {
    return Container(
      width: _deviceSize.deviceWidth,
      height: _deviceSize.deviceHeight * 0.35,
      padding: EdgeInsets.symmetric(
          vertical: _deviceSize.deviceHeight * 0.01,
          horizontal: _deviceSize.deviceWidth * 0.02),
      decoration: BoxDecoration(
        color: Color.fromRGBO(227, 240, 175, 1.0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return ItemViewCard(item: _items[index]);
          }),
    );
  }

  // price conformation menu
  Widget _priceEditContainer() {
    return Container(
      width: _deviceSize.deviceWidth,
      height: _deviceSize.deviceHeight * 0.20,
      padding: EdgeInsets.symmetric(
          vertical: _deviceSize.deviceHeight * 0.01,
          horizontal: _deviceSize.deviceWidth * 0.03),
      decoration: BoxDecoration(
        color: Color.fromRGBO(227, 240, 175, 1.0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _invoicePriceRow("Total Price", _netTotal, false),
          Row(
            children: [
              Container(
                  width: _deviceSize.deviceWidth * 0.71,
                  child: _invoicePriceRow("Discount", _discont, true)),
              IconButton(
                  onPressed: () {
                    _showDiscountBottomModelPage();
                  },
                  icon: Icon(Icons.edit_square))
            ],
          ),
          _invoicePriceRow("Sub Total", _netTotal, false),
        ],
      ),
    );
  }

  // send invoce button
  Widget _sendButton() {
    return RoundedButton(_deviceSize.deviceHeight * 0.07,
        _deviceSize.deviceWidth, "Send Invoice", () {});
  }

  Widget _invoicePriceRow(String _name, double _value, bool discount) {
    TextStyle _style = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _name,
          style: _style,
        ),
        Text(
          "${_value.toStringAsFixed(2)}${discount ? " %" : ""}",
          style: _style,
        ),
      ],
    );
  }

  Future _showDiscountBottomModelPage() {
    TextEditingController _discountController = TextEditingController();
    _discountController.text = _discont.toString();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows keyboard to adjust the modal size
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          ),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Set Discount",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        double currentDiscount =
                            double.tryParse(_discountController.text) ?? 0.0;
                        if (currentDiscount > 0) {
                          _discountController.text =
                              (currentDiscount - 1).toStringAsFixed(2);
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        controller: _discountController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "Enter discount",
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        double currentDiscount =
                            double.tryParse(_discountController.text) ?? 0.0;
                        _discountController.text =
                            (currentDiscount + 1).toStringAsFixed(2);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                RoundedButton(_deviceSize.deviceHeight * 0.06,
                    _deviceSize.deviceWidth * 0.7, "Apply Discount", () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}
