class Quote {
  final String clientName;
  final String clientCompany;
  final String clientAddress;
  final String clientEmail;
  final String clientPhone;
  final String serviceDescription;
  final String price;
  final String validity;
  final String paymentTerms;
  final String deliveryTimeline;

  Quote({
    required this.clientName,
    required this.clientCompany,
    required this.clientAddress,
    required this.clientEmail,
    required this.clientPhone,
    required this.serviceDescription,
    required this.price,
    required this.validity,
    required this.paymentTerms,
    required this.deliveryTimeline,
  });

  // Helper to map data for easier storage or retrieval
  Map<String, dynamic> toMap() {
    return {
      'clientName': clientName,
      'clientCompany': clientCompany,
      'clientAddress': clientAddress,
      'clientEmail': clientEmail,
      'clientPhone': clientPhone,
      'serviceDescription': serviceDescription,
      'price': price,
      'validity': validity,
      'paymentTerms': paymentTerms,
      'deliveryTimeline': deliveryTimeline,
    };
  }

  static Quote fromMap(Map<String, dynamic> map) {
    return Quote(
      clientName: map['clientName'],
      clientCompany: map['clientCompany'],
      clientAddress: map['clientAddress'],
      clientEmail: map['clientEmail'],
      clientPhone: map['clientPhone'],
      serviceDescription: map['serviceDescription'],
      price: map['price'],
      validity: map['validity'],
      paymentTerms: map['paymentTerms'],
      deliveryTimeline: map['deliveryTimeline'],
    );
  }
}
