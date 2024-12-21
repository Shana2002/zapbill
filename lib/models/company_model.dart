class CompanyModel {
  final String userName;
  final String email;
  final String companyName;
  final String companyEmail;
  final String companyMobile;
  CompanyModel(
      {required this.userName,
      required this.email,
      required this.companyName,
      required this.companyEmail,
      required this.companyMobile});

  factory CompanyModel.fromJSON(Map<String, dynamic> _json) {
    return CompanyModel(
        userName: _json["userName"],
        email: _json["email"],
        companyName: _json["companyName"],
        companyEmail: _json["companyEmail"],
        companyMobile: _json["companyMobile"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "email": email,
      "companyName": companyName,
      "companyEmail": companyEmail,
      "companyMobile": companyMobile
    };
  }
}
