import 'package:flutter/material.dart';

class DeviceSize {
  final BuildContext context;
  late double deviceWidth;
  late double deviceHeight;
  DeviceSize({required this.context}) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
  }
}
