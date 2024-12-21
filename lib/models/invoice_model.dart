import 'package:zapbill/models/customer_model.dart';

class InvoiceModel {
  final CustomerModel customer;
  final DateTime dateTime;
  final String fileName;

  InvoiceModel(
      {required this.customer, required this.dateTime, required this.fileName});

  factory InvoiceModel.formJSON(Map<String, dynamic> _json) {
    return InvoiceModel(
        customer: CustomerModel.fromJSON(_json["customer"]),
        dateTime: _json["datetime"],
        fileName: _json["fileName"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "customer": customer.toJson(),
      "dateTime": dateTime,
      "fileName": fileName,
    };
  }
}
