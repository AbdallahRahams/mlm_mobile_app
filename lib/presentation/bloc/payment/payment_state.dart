abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final List<String> paymentMethods;

  PaymentLoaded({required this.paymentMethods});
}

class PaymentErrorState extends PaymentState {  // Renamed class
  final String message;

  PaymentErrorState(this.message);
}
