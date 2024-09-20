abstract class PaymentEvent {}

class LoadPaymentMethods extends PaymentEvent {}

class AddPaymentMethod extends PaymentEvent {
  final String method;

  AddPaymentMethod({required this.method});
}

class EditPaymentMethod extends PaymentEvent {
  final String method;

  EditPaymentMethod({required this.method});
}

class PaymentErrorEvent extends PaymentEvent {  // Renamed class
  final String message;

  PaymentErrorEvent(this.message);
}
