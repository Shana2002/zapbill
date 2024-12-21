import 'package:flutter/material.dart';

class NewBill extends StatefulWidget {
  const NewBill({super.key});

  @override
  State<NewBill> createState() => _NewBillState();
}

class _NewBillState extends State<NewBill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return Column();
  }
}
