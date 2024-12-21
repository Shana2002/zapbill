import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zapbill/models/company_model.dart';
import 'package:zapbill/models/customer_model.dart';
import 'package:zapbill/models/invoice_model.dart';
import 'package:zapbill/services/navigation_service.dart';
import 'package:zapbill/util/device_size.dart';
import 'package:zapbill/widgets/rounded_button.dart';
import 'package:zapbill/widgets/rounded_image.dart';

class HomePage extends StatefulWidget {
  final CompanyModel company;
  HomePage({super.key, required this.company});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DeviceSize _deviceSize;
  NavigationService _navigator = GetIt.instance.get<NavigationService>();
  late List<InvoiceModel> _invoices;

  @override
  void initState() {
    super.initState();

    // Create customers
    CustomerModel customer1 = CustomerModel(
      "John Doe",
      customerMobile: "1234567890",
      customerEmail: "john.doe@example.com",
    );

    CustomerModel customer2 = CustomerModel(
      "Jane Smith",
      customerMobile: "0987654321",
      customerEmail: "jane.smith@example.com",
    );

    CustomerModel customer3 = CustomerModel(
      "Mike Johnson",
      customerMobile: "5555555555",
      customerEmail: "mike.johnson@example.com",
    );

    // Create invoices
    _invoices = [
      InvoiceModel(
        customer: customer1,
        dateTime: DateTime.now(),
        fileName: "invoice_001.pdf",
      ),
      InvoiceModel(
        customer: customer2,
        dateTime: DateTime.now().add(Duration(days: -1)),
        fileName: "invoice_002.pdf",
      ),
      InvoiceModel(
        customer: customer3,
        dateTime: DateTime.now().add(Duration(days: -2)),
        fileName: "invoice_003.pdf",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _deviceSize = DeviceSize(context: context);
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: _deviceSize.deviceHeight * 0.02,
                horizontal: _deviceSize.deviceWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _topBar(),
                _totalBillContainer(),
                _invoiceListContainer(),
                _newBillBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundedImage(
            imagePath: "assets/images/logo.png",
            size: _deviceSize.deviceWidth * 0.1),
        SizedBox(
          width: 15,
        ),
        Text(
          widget.company.companyName,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        )
      ],
    );
  }

  Widget _totalBillContainer() {
    return Container(
      width: _deviceSize.deviceWidth,
      height: _deviceSize.deviceHeight * 0.1,
      decoration: BoxDecoration(
        color: Color.fromRGBO(251, 246, 233, 1.0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          "Total bill : 200",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget _invoiceListContainer() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: _deviceSize.deviceWidth * 0.05,
          vertical: _deviceSize.deviceHeight * 0.01),
      width: _deviceSize.deviceWidth,
      height: _deviceSize.deviceHeight * 0.6,
      decoration: BoxDecoration(
        color: Color.fromRGBO(227, 240, 175, 1.0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Last Bills",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              GestureDetector(
                child: Text(
                  "Show All",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 12,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          Container(
            width: _deviceSize.deviceWidth,
            height: _deviceSize.deviceHeight * 0.54,
            child: _invoceList(),
          )
        ],
      ),
    );
  }

  Widget _newBillBtn() {
    return RoundedButton(
        _deviceSize.deviceHeight * 0.07,
        _deviceSize.deviceWidth,
        "New Bill",
        () {
          _navigator.navigationToRoute("/newbill");
        });
  }

  Widget _invoceList() {
    return ListView.builder(
        itemCount: _invoices.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(93, 185, 150, 1.0),
              borderRadius: BorderRadius.circular(14),
            ),
            margin: EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
              textColor: Colors.white,
              title: Text(
                _invoices[index].customer.customerName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                _invoices[index].dateTime.toString(),
                style: TextStyle(fontSize: 12),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
