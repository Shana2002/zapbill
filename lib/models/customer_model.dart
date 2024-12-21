class CustomerModel {
  final String customerName;
  late String customerMobile;
  late String customerEmail;

  CustomerModel(this.customerName,
      {this.customerMobile = "", this.customerEmail = ""});

  factory CustomerModel.fromJSON(Map<String, dynamic> _json) {
    return CustomerModel(_json["customerName"],
        customerEmail: _json["customerEmail"] ?? "",
        customerMobile: _json["customerMobile"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "customerName": customerName,
      "customerMobile": customerMobile,
      "customerEmail": customerEmail,
    };
  }
}
