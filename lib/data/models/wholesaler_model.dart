class WholesalerModel {
  final String wholesalerId;
  final String companyName;
  final String contactPerson;
  final String email;
  final String phoneNumber;

  WholesalerModel({
    required this.wholesalerId,
    required this.companyName,
    required this.contactPerson,
    required this.email,
    required this.phoneNumber,
  });

  factory WholesalerModel.fromJson(Map<String, dynamic> json) {
    return WholesalerModel(
      wholesalerId: json['wholesalerId'],
      companyName: json['companyName'],
      contactPerson: json['contactPerson'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wholesalerId': wholesalerId,
      'companyName': companyName,
      'contactPerson': contactPerson,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
