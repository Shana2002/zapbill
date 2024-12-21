import 'package:flutter/material.dart';
import 'package:zapbill/models/company_model.dart';
import 'package:zapbill/util/device_size.dart';
import 'package:zapbill/widgets/rounded_image.dart';

class HomePage extends StatefulWidget {
  final CompanyModel company;
  HomePage({super.key, required this.company});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DeviceSize _deviceSize;
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
                _billList(),
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
      height: _deviceSize.deviceHeight * 0.15,
      color: Colors.red,
    );
  }

  Widget _billList() {
    return Container(
      width: _deviceSize.deviceWidth,
      height: _deviceSize.deviceHeight * 0.6,
      color: Colors.yellow,
    );
  }

  Widget _newBillBtn() {
    return Container(
      width: _deviceSize.deviceWidth,
      height: _deviceSize.deviceHeight * 0.07,
      color: const Color.fromARGB(255, 146, 134, 25),
    );
  }
}
