abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final String orderId;

  OrderLoaded({required this.orderId});
}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);
}
