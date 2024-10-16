class Supplier { 
  final String name;
  final String address;
  final String paymentInfo;

  Supplier({
    required this.name,
    required this.address,
    required this.paymentInfo,
  });
}

class Customer {
  final String name;
  final String address;

  Customer({
    required this.name,
    required this.address,
  });
}

class InvoiceItem {
  final String description;
  final double unitPrice;
  final double quantity;
  final double vat;

  InvoiceItem({
    required this.description,
    required this.unitPrice,
    required this.quantity,
    required this.vat,
  });

  double get total => unitPrice * quantity * (1 + vat);
}